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
conflicts=('mupdf')
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
sha256sums=('a2a3c64d8b24920f87cf4ea9339a25abf7388496440f13b37482d1403c33c206'
         '70f632e22902ad4224b1d88696702b3ba4eb3c28eb7acf735f06d16e6884a078'
         'a435f44425f5432c074dee745d8fbaeb879038ec1f1ec64f037c74662f09aca8'
         '6ea44355ac1309cbd6605a8478e7245f2c0f17f61b30bb72d8ec79f65732452d')

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
