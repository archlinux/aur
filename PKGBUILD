# Maintainer: 2xsaiko <aur@dblsaiko.net>

pkgname=kde-rounded-corners-git
_pkgname=${pkgname%-git}
pkgver=r15.b1f65f2
pkgrel=1
pkgdesc="Rounds the corners of your windows"
arch=("any")
url="https://github.com/alex47/KDE-Rounded-Corners"
license=("GPL3")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(qt5-tools qt5-x11extras kconfigwidgets kcrash kglobalaccel kio knotifications kinit kwin)
makedepends=(git cmake gcc gettext extra-cmake-modules)
source=("${_pkgname}::git+https://github.com/alex47/KDE-Rounded-Corners.git")
sha512sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  test -d build || mkdir build
}

build() {
  cd "${srcdir}/${_pkgname}/build"
  cmake -DQT5BUILD=ON ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make install DESTDIR="${pkgdir}"
}
