# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=python-tiktoken
pkgname="${_pkgname}-git"
pkgver=0.3.1.r15.20230312.3e86200
pkgrel=1
pkgdesc="A fast BPE tokeniser for use with OpenAI's models."
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/openai/tiktoken"
license=('MIT')
depends=(
  'python>=3.8'
  'python-blobfile>=2'
  'python-regex>=2022.1.18'
  'python-requests>=2.26.0'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools>=62.4'
  'python-setuptools-rust>=1.5.2'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo"export CARGO_HOME="${srcdir}/cargo"

  git log > "${srcdir}/git.log"

  python ./setup.py build_rust # This will download stuff, therefore we have it in `prepare()`.
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo"

  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${_pkgname}"
#   export CARGO_HOME="${srcdir}/cargo"
# 
#   python -m pytest
# }

package() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo"

  export PYTHONHASHSEED=0
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -D -v -m644 LICENSE                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _docfile in CHANGELOG.md README.md; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/git.log"           "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  ln -svf "/usr/share/licenses/${pkgname}/LICENSE"  "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
