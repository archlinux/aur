# Maintainer: Stefanos Mitropoulos stefmitropoulos@gmail.com
_pkgname="blueblack"
pkgname="${_pkgname}-git"
pkgver=1.0.6.r1.g09e3a713
pkgrel=1
pkgdesc="Automatically switch between light/dark mode"
arch=('any')
url="https://github.com/smitropoulos/blueblack"
license=('GPL')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

depends=(
  'python-yaml>=6.0.1'
  'python-requests>=2.31.0'
  'python-xdg-base-dirs'
  'python-jsonschema>=4.21.1'
  'python-astral>=3.2'
)

makedepends=(python-build python-installer python-wheel git python-poetry)

source=("${_pkgname}::git+https://github.com/smitropoulos/blueblack.git")

sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname} || exit 1

  git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' |
    sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}" || exit 1
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}" || exit 1
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p ${pkgdir}/usr/lib/systemd/user || return 1
  install -m644 systemd/${_pkgname}.service ${pkgdir}/usr/lib/systemd/user || return 1
}
