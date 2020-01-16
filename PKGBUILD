# Maintainer: maz-1 < ohmygod19993 at gmail dot com >

pkgname=pcsx2-plugin-usbqemu-wheel
_pkgsrcname=USBqemu-wheel
pkgver=0.8.2_3
pkgrel=1
pkgdesc='A USB plugin modified to support steering wheels in pcsx2.'
arch=('i686' 'x86_64')
url='https://github.com/jackun/USBqemu-wheel'
license=('Unlicense')
depends=('pcsx2')
makedepends=('cmake')
makedepends_x86_64=('gcc-multilib')
source=("https://github.com/jackun/USBqemu-wheel/archive/${pkgver//_/-}.tar.gz")
sha256sums=('0c82476c08547bb3a16b24a9a8399e7ddc5f35f157a60fcdbd760f38fa793986')

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver//_/-}"
  rm -rf build/
  mkdir build && cd build/

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr/lib32/pcsx2 \
    -DCMAKE_TOOLCHAIN_FILE=cmake/linux-compiler-i386-multilib.cmake \
    -DPLUGIN_BUILD_DYNLINK_PULSE=FALSE
  make
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver//_/-}"
  cd build/

  if [ $CARCH = "i686" ]; then
    install -Dm644 libUSBqemu-wheel-${pkgver%_*}.so -t "$pkgdir/usr/lib/pcsx2/"
  else
    install -Dm644 libUSBqemu-wheel-${pkgver%_*}.so -t "$pkgdir/usr/lib32/pcsx2/"
  fi

  install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
