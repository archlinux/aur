# -*- mode: pkgbuild -*-
# Maintainer  : Jeremy Borgman <borgman.jeremy@pm.me>
# Maintainer  : Mehrad Mahmoudian <m.mahmoudian@gmail.com>
# Contributor : Feresey <p.milko1999@yandex.ru>
# Contributor : j1simon <stemp@ono.com>
# Contributor : Feresey <p.milko1999@yandex.ru>

pkgname=flameshot-git
_pkgname=flameshot
pkgver=r1354.8f6b6b08
pkgrel=1
pkgdesc="Powerful yet simple to use screenshot software"
arch=('i686' 'x86_64')
url="https://github.com/flameshot-org/flameshot"
license=('GPL')
depends=(qt5-base hicolor-icon-theme qt5-svg)
makedepends=(qt5-tools git cmake)
provides=(flameshot-git)
conflicts=(flameshot)
source=("git+https://github.com/flameshot-org/flameshot.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  # get the details of the version numbers
  NORMAL_VERSION="$(grep -oP 'FLAMESHOT_VERSION\s\d+\.\d+\.\d+' CMakeLists.txt | cut -d ' ' -f2)"
  ROLLING_VERSION="r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"

  # skip the special characters in the versions
  NORMAL_VERSION_PATTERN="$(echo ${NORMAL_VERSION} | sed 's/\./\\\./g')"
  ROLLING_VERSION_PATTERN="$(echo ${ROLLING_VERSION} | sed 's/\./\\\./g')"

  # Replace the version number in the cmake with the combination of versions above
  sed "s/${NORMAL_VERSION_PATTERN}/${NORMAL_VERSION_PATTERN}_${ROLLING_VERSION_PATTERN}/" CMakeLists.txt


  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
