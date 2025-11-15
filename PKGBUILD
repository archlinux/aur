# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=serdisplib
pkgver=2.02
pkgrel=1
pkgdesc="Library to drive displays with built-in controllers"
url="https://serdisplib.sourceforge.net/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL-2.0-or-later')
depends=('gd' 'libusb-compat' 'sdl')
source=("https://sourceforge.net/projects/serdisplib/files/serdisplib/$pkgver/$pkgname-$pkgver.tar.gz"
        'serdisplib-2.01-add-destdir-support.patch'
        '99-serdisplib.rules')
sha256sums=('447b74007dc157b0378044245649850b26432b9185b6540ff681fcb0765c4d8b'
            'f00cb2183d6dc447d0bbcc2e501732bfab7b61c3059c25dbbebe4a88012003e3'
            '6d3bb4bc9ddac58d5c1b188fcb71c154d26250a15c085e1b16adfd2f2a7887fc')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/serdisplib-2.01-add-destdir-support.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
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
