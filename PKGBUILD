# Maintainer: Tugdil Goldhand <aur@xosc.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Pierre-Paul Paquin <pierrepaulpaquin@gmail.com>
# Contributor: xduugu

_pkgname=mupdf
pkgname=${_pkgname}-nojs
pkgver=1.8
pkgrel=1
pkgdesc='Lightweight PDF and XPS viewer'
arch=('i686' 'x86_64')
url='http://mupdf.com'
license=('AGPL3')
depends=('curl' 'desktop-file-utils' 'freetype2' 'jbig2dec' 'libjpeg' 'libxext'
         'openssl' 'openjpeg2' 'mesa' 'libgl' 'libxcursor' 'libxrandr'
	 'libxinerama')
makedepends=('mesa-libgl')
install=mupdf.install
options=('staticlibs')
source=(http://mupdf.com/downloads/mupdf-${pkgver/_/}-source.tar.gz
        mupdf.desktop
        mupdf.xpm
        mupdf-1.5-openjpeg-2.1.0.patch)
md5sums=('3205256d78d8524d67dd2a47c7a345fa'
         '39b54f82a763aac54e352315a0ee9037'
         'f3f35e7320bafde331250de1c99186a1'
         '8e71587ad9b86e10c9144618ab43149b')

prepare() {
  cd $_pkgname-${pkgver/_/}-source
  rm -rf thirdparty/{curl,freetype,mujs,jpeg,zlib,jbig2dec,openjpeg}
  patch -p1 -i ../mupdf-1.5-openjpeg-2.1.0.patch

  sed '/^JBIG2DEC_CFLAGS :=/s|$| -I./include/mupdf|' -i Makethird
}

build() {
  CFLAGS+=' -fPIC'
  CXXFLAGS+=' -fPIC'

  cd $_pkgname-${pkgver/_/}-source
  make build=release CURL_LIBS='-lcurl -lpthread'
}

package() {
  cd $_pkgname-${pkgver/_/}-source
  make build=release prefix="$pkgdir"/usr install

  mv "$pkgdir"/usr/bin/mupdf-x11-curl "$pkgdir"/usr/bin/mupdf
  rm "$pkgdir"/usr/bin/mupdf-x11

  install -Dm644 ../mupdf.desktop "$pkgdir"/usr/share/applications/mupdf.desktop
  install -Dm644 ../mupdf.xpm "$pkgdir"/usr/share/pixmaps/mupdf.xpm

  find "$pkgdir"/usr/include "$pkgdir"/usr/share "$pkgdir"/usr/lib \
    -type f -exec chmod -v 0644 {} +
}
