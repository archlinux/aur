# Maintainer: tildearrow <acc12345acc at gmail dot com>
pkgname=taebron-git
pkgver=aur.r6.ge69caf9
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
install=taebron.install

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
  install -dm755 "${pkgdir}"/etc/xdg/autostart/ ../etc/xdg/autostart/
  install -m644 ../etc/xdg/autostart/tbrnd.desktop \
                "${pkgdir}"/etc/xdg/autostart/tbrnd.desktop
  install -dm755 "${pkgdir}"/etc/rc.d/ ../etc/rc.d/
  install -m755 ../etc/rc.d/tbrn-uinput \
                "${pkgdir}"/etc/rc.d/tbrn-uinput
  install -dm755 "${pkgdir}"/usr/lib/systemd/system ../lib/systemd/system/
  install -m644 ../lib/systemd/system/tbrn-uinput.service \
                "${pkgdir}"/usr/lib/systemd/system/tbrn-uinput.service
}
