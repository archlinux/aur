# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=serdisplib
pkgver=1.97.9
pkgrel=6
pkgdesc="Library to drive displays with built-in controllers"
url="http://serdisplib.sourceforge.net/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gd' 'libusb-compat' 'sdl')
source=("http://sourceforge.net/projects/serdisplib/files/serdisplib/$pkgver/$pkgname-$pkgver.tar.gz"
        'libusb_fix.diff'
        '99-serdisplib.rules')
md5sums=('130552ec60d01e974712a60274f34de7'
         '6661faa31c7bff7fe5138604dc9fd3b9'
         'f32b8a39b91b7badf14c22f189327803')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p2 -i ${srcdir}/libusb_fix.diff
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --includedir=${pkgdir}/usr/include \
              --bindir=${pkgdir}/usr/bin \
              --libdir=${pkgdir}/usr/lib \
              --enable-libusb \
              --enable-libSDL
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" \
       install

  install -Dm644 ${srcdir}/99-serdisplib.rules "$pkgdir/usr/lib/udev/rules.d/99-serdisplib.rules"
}
