# Maintainer: dreieck

_pkgname="python-condconfigparser"
pkgname="${_pkgname}-git"
pkgdesc="Python library designed to help parsing configuration files. Main specificity: Allows to define conditions using boolean operators and specific sections in the configuration file that are only applied when the corresponding condition is fulfilled."
url="https://frougon.net/projects/CondConfigParser/"
license=("BSD-2-Clause")
epoch=0
pkgver=1.0.6+1.r38.20250415.77c0a62
pkgrel=2
arch=(
  'any'
)
depends=(
  'python>=3.4'
)
makedepends=(
  'git'
  'gitlog-to-changelog'
  'python-build'
  'python-installer'
  'python-setuptools>=77.0.3'
  'python-wheel'
)
provides=(
  "python3-condconfigparser=${pkgver}"
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "python3-condconfigparser"
  "${_pkgname}"
)
optdepends=()
source=(
  "${_pkgname}::git+https://github.com/frougon/CondConfigParser"
  # "workaround_license_double_specification.pyproject-toml.patch::https://github.com/user-attachments/files/19757701/workaround_license_double_specification.pyproject-toml.patch.txt"
)
sha256sums=(
  'SKIP'
  # '978b615bb7a5a1b5d19bc021cf6e21030a457c78aa5ca2f06f457174ed7b44da'
)

validpgpkeys=(
  '125B5A0FDB788FDD0EF41A9DC785B90B5053A3A2'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  # for _patch in "${srcdir}/workaround_license_double_specification.pyproject-toml.patch"; do
  #   printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
  #   patch -Np1 --follow-symlinks -i "${_patch}"
  # done

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _rev="$(git rev-list HEAD --count)"
  _date="$(git log -1 --format=%cd --date=format:%Y%m%d)"
  _hash="$(git rev-parse --short HEAD)"
  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  #cd condconfigparser
  #_ver="$(python -c 'import version; print(version.__version__)')"
  if [ -z ${_ver} ]; then
    error "Could not determine version."
    exit 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}


build() {
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' "${url}" > "upstream.url"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  for _docfile in git.log upstream.url AUTHORS README.distributors README.rst INSTALL.txt TODO; do
    install -D -m644 -v "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  for _license in COPYING COPYING.Sphinx; do
    install -D -m644 -v "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_license}" "${pkgdir}/usr/share/doc/${_pkgname}/${_license}"
  done
}

