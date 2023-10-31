# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=python-blobfile
pkgname="${_pkgname}-git"
pkgver=2.1.0+1.r630.20231011.e81b345
pkgrel=1
pkgdesc="A library that provides a Python-like interface for reading local and remote files (only from blob storage), with an API similar to open() as well as some of the os.path and shutil functions."
arch=(
  'any'
)
url="https://github.com/christopher-hesse/blobfile"
license=('custom: public domain')
depends=(
  'python>=3'
  'python-filelock>=3.0'
  'python-lxml>=4.9'
  'python-numpy'
  'python-pycryptodomex>=3.8'
  'python-pytest'
  'python-typing_extensions'
  'python-urllib3>=1.25.3' 'python-urllib3<3'
  'python-xmltodict'
)
makedepends=(
  'git'
  'python-astor'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'python-av'
  'python-imageio'
  'python-tensorflow'
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

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"

  printf '%s\n' "  Removing version requirements for build dependencies in 'pyproject.toml' ..."
  sed -i -E 's|[[:space:]]*==.*$|",|' pyproject.toml
}

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

build() {
  cd "${srcdir}/${_pkgname}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"

  export PYTHONHASHSEED=0
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -D -v -m644 LICENSE                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _docfile in CHANGES.md README.md; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -d -v -m755                               "${pkgdir}/usr/share/doc/${_pkgname}/docs"
  cp -av docs/                                      "${pkgdir}/usr/share/doc/${_pkgname}/docs"/
  install -D -v -m644 "${srcdir}/git.log"           "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  ln -svf "/usr/share/licenses/${pkgname}/LICENSE"  "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
