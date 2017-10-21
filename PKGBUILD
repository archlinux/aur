# Maintainer: tildearrow <acc12345acc at gmail dot com>
pkgname=taebron-git
pkgver=aur.r176.g80ae0fd
pkgrel=1
pkgdesc="Razer device daemon and configuration tool, from git"
arch=('any')
url="https://github.com/tildearrow/taebron"
license=('GPL')
depends=('openrazer-driver-dkms')
makedepends=('git' 'cmake')
provides=('taebron')
conflicts=('openrazer-daemon')
source=("$pkgname::git+https://github.com/tildearrow/taebron.git")
sha1sums=('SKIP')
install=taebron.install

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  git submodule init
  git submodule update
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
  install -dm755 "${pkgdir}"/etc/rc.d/ ../etc/rc.d/
  install -m755 ../etc/rc.d/taebron \
                "${pkgdir}"/etc/rc.d/taebron
  install -dm755 "${pkgdir}"/usr/lib/systemd/system ../lib/systemd/system/
  install -m644 ../lib/systemd/system/taebron.service \
                "${pkgdir}"/usr/lib/systemd/system/taebron.service
}
