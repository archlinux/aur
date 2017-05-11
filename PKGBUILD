# Maintainer: tildearrow <acc12345acc at gmail dot com>
pkgname=taebron-git
pkgver=aur.r4.g60bf1d2
pkgrel=1
pkgdesc="Razer device daemon and configuration tool, from git"
arch=('any')
url="https://github.com/tildearrow/taebron"
license=('GPL')
depends=('razer-driver-dkms')
makedepends=('git' 'cmake')
provides=('taebron')
conflicts=('razer-daemon')
source=("$pkgname::git+https://github.com/tildearrow/taebron.git")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  if [ -e build ]
    then rm -rf build
  fi
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package() {
  cd "$pkgname/build"
  make DESTDIR="$pkgdir/" install
  install -dm644 "${pkgdir}"/etc/xdg/autostart/ ../etc/xdg/autostart/
  install -m644 ../etc/xdg/autostart/tbrnd.desktop \
                "${pkgdir}"/etc/xdg/autostart/tbrnd.desktop
}
