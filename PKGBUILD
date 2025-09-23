# Maintainer: alphazo <alphazo@gmail.com>

pkgname=rtl-sdr-blog-git
pkgrel=1
pkgver=v1.3.6.r0.g240bd0e
epoch=1
pkgdesc="Tuner for DVB-T sticks based on the Realtek RTL2832U, which can be used as a cheap SDR, since the chip allows transferring the raw I/Q samples to the host. RTL Blog edition to support RTL-SDR V4 dongles."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/rtlsdrblog/rtl-sdr-blog"
license=('GPL')
depends=('libusb')
makedepends=('git' 'cmake')
provides=('rtl-sdr')
conflicts=('rtl-sdr' 'rtl-sdr-git' 'rtl-sdr-librtlsdr-git')
source=("git+${url}" "rtl-sdr-blog.conf")
md5sums=('SKIP'
         'e88d2a4b140e31b97436489825a1e941')

pkgver() {
  cd "${srcdir}/rtl-sdr-blog"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/rtl-sdr-blog"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DDETACH_KERNEL_DRIVER=ON -Wno-dev ../
  make
}

package() {
  cd "${srcdir}/rtl-sdr-blog/build/"
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/rtl-sdr-blog/rtl-sdr.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/10-rtl-sdr.rules"
  install -Dm644 "$srcdir/rtl-sdr-blog.conf" "$pkgdir/etc/modprobe.d/rtl-sdr-blog.conf"
  ln -s librtlsdr.so "${pkgdir}/usr/lib/librtlsdr.so.2"
}

