# Maintainer: alphazo <alphazo@gmail.com>

pkgname=rtl-sdr-blog-git
pkgrel=1
pkgver=V1.2.r0.g7b16cfb
epoch=1
pkgdesc="Tuner for DVB-T sticks based on the Realtek RTL2832U, which can be used as a cheap SDR, since the chip allows transferring the raw I/Q samples to the host. RTL Blog edition to support RTL-SDR V4 dongles."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/rtlsdrblog/rtl-sdr-blog"
license=('GPL')
depends=('libusb')
makedepends=('git' 'cmake')
provides=('rtl-sdr')
conflicts=('rtl-sdr' 'rtl-sdr-git' 'rtl-sdr-librtlsdr-git')
source=("git+${url}")

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
}

md5sums=('SKIP')
