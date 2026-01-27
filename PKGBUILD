# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=python-openmemory-git
_pkgname=OpenMemory
pkgver=1.3.0.r21.g30daf78
pkgrel=1
pkgdesc="OpenMemory Python SDK (git)"
arch=('any')
url="https://github.com/CaviraOSS/OpenMemory"
license=('Apache-2.0')

depends=(
  'python'
  'python-fastapi'
  'uvicorn'
  'python-pydantic'
  'python-numpy'
  'python-httpx'
  'python-google-api-python-client'
  'python-google-auth'
  'python-msal'
  'python-pygithub'
  'python-beautifulsoup4'
  'python-pypdf'
  'python-mammoth'
  'python-markdownify'
  'python-openai'
)

makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)

provides=('python-openmemory')
conflicts=('python-openmemory')

source=(
  "${_pkgname}::git+https://github.com/CaviraOSS/OpenMemory.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Prefer tags if they exist; otherwise fall back to commit count + hash.
  local v
  v="$(git describe --long --tags --abbrev=7 2>/dev/null)" || true
  if [[ -n "$v" ]]; then
    # v1.3.1-12-gabcdef0 -> 1.3.1.r12.gabcdef0
    v="${v#v}"
    printf '%s\n' "${v/-/.r}" | sed 's/-/./g'
  else
    printf "0.0.0.r%s.g%s\n" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}/packages/openmemory-py"

  # Ensure we never accidentally install a stale wheel from an earlier build.
  rm -rf dist build *.egg-info

  # Note: -git packages intentionally track HEAD; users can pin commits by editing source=.
  python -m build --wheel --no-isolation
}

#check() {
#  cd "${srcdir}/${_pkgname}/packages/openmemory-py"
#
#  local whls
#  mapfile -t whls < <(ls -1 dist/*.whl 2>/dev/null)
#
#  if (( ${#whls[@]} != 1 )); then
#    echo "ERROR: Expected exactly one wheel in dist/, found ${#whls[@]}."
#    ls -la dist || true
#    return 1
#  fi
#
#  # Validate the built artifact by compiling the extracted wheel contents.
#  local tmpdir
#  tmpdir="$(mktemp -d -t openmemory-wheel-check.XXXXXX)"
#  trap 'rm -rf "${tmpdir}"' RETURN
#
#  python -m zipfile -e "${whls[0]}" "${tmpdir}"
#  python -m compileall -q "${tmpdir}/openmemory"
#}

package() {
  cd "${srcdir}/${_pkgname}/packages/openmemory-py"

  local whls
  mapfile -t whls < <(ls -1 dist/*.whl 2>/dev/null)

  if (( ${#whls[@]} != 1 )); then
    echo "ERROR: Expected exactly one wheel in dist/, found ${#whls[@]}."
    ls -la dist || true
    return 1
  fi

  python -m installer --destdir="${pkgdir}" "${whls[0]}"
}
