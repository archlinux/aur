pkgname=osvr-cpi-git
pkgver=r19.1d8d242
pkgrel=1
pkgdesc="A simple QT based utility to help users set up their configuration parameters"
arch=(i686 x86_64)
url="https://github.com/OSVR/OSVR-Config"
#license=('GPL')
#install=osvr-cpi.install
makedepends=('git')
depends=('osvr-core-git' 'fswatch')
source=("osvr-cpi::git+https://github.com/ChristophHaag/OSVR-CPI.git")
#    "Findjsoncpp.cmake")

pkgver() {
  cd "$srcdir/osvr-cpi"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd osvr-cpi
}

build() {
  cd osvr-cpi
  qmake OSVR-CPI.pro
  make

  cd usersettingsplugin
  mkdir -p build; cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make

  cd ../..

  cd usersettingsclient
  mkdir -p build; cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd osvr-cpi
  #make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/bin"
  install -m 755 OSVR_CPI "$pkgdir/usr/bin"

  cd usersettingsplugin/build
  make DESTDIR="$pkgdir/" install
  cd ../..

  cd usersettingsclient/build
  install -m755 UserSettingsClient "$pkgdir"/usr/bin
  #make DESTDIR="$pkgdir/" install
}
md5sums=('SKIP')

# vim:set ts=2 sw=2 et:
