# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=python-replicate
pkgname="${_pkgname}-git"
pkgver=1.0.7+2.r288.20250826.d2956ff
pkgrel=2
pkgdesc="A library to run machine learning models in the cloud from your own code, without having to set up any servers."
arch=(
  'any'
)
url="https://replicate.com/"
_giturl="https://github.com/replicate/replicate-python"
license=('Apache')
depends=(
  'python>=3.6'
  'python-numpy'
  'python-packaging'
  'python-pydantic'
  'python-requests'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-packaging>=21.3'
  'python-pytest>=7.1.2'
  'python-pytest-asyncio'
  'python-pytest-recording'
  'python-respx'
  'python-responses>=0.21.0'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()
source=(
  "${_pkgname}::git+${_giturl}.git"
)
sha256sums=(
  'SKIP'
)

unset REPLICATE_API_KEY # As notified in https://aur.archlinux.org/packages/python-replicate-git#comment-1040279

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

  git log > "${srcdir}/git.log"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}"

  python -m pytest
}

package() {
  cd "${srcdir}/${_pkgname}"

  export PYTHONHASHSEED=0
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -D -v -m644 LICENSE                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _docfile in CONTRIBUTING.md README.md; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/git.log"           "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  ln -svf "/usr/share/licenses/${pkgname}/LICENSE"  "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
