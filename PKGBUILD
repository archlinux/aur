# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=rtl-sdr-librtlsdr-git
_gitname=librtlsdr
pkgrel=1
pkgver=r627.3551e61
pkgdesc="Fork of driver for Realtek RTL2832U, allowing general purpose software defined radio (SDR)."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/librtlsdr/librtlsdr"
license=('GPL')
depends=('libusb>=1.0')
makedepends=('git' 'cmake')
provides=('rtl-sdr')
conflicts=('rtl-sdr' 'rtl-sdr-git')
options=('staticlibs')
install=librtlsdr.install
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DDETACH_KERNEL_DRIVER=ON -Wno-dev ../
  make
}

package() {
  cd "${srcdir}/${_gitname}/build/"
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/${_gitname}/rtl-sdr.rules" "${pkgdir}/usr/lib/udev/rules.d/10-rtl-sdr.rules"
  install -D -m644 "${srcdir}/${_gitname}/rtlsdr-blacklist.conf" "$pkgdir/etc/modprobe.d/rtlsdr.conf"
}
