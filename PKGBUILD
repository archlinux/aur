# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=tuxpuck
pkgver=0.8.2
pkgrel=6
pkgdesc="Airhockey with tux (Shufflepuck Cafe clone)"
arch=('i686' 'x86_64')
url="http://home.no.net/munsuun/tuxpuck/"
license=('GPL2')
depends=('libjpeg' 'sdl' 'libpng' 'libvorbis')
makedepends=('freetype2')
options=('!makeflags')
source=("http://ftp.de.debian.org/debian/pool/main/t/${pkgname}/${pkgname}_$pkgver.orig.tar.gz"
        "$pkgname-$pkgver-ldflags.patch"
        "$pkgname-$pkgver-libpng15.patch")
sha256sums=('62d9604ed69c27b9ca2be1312bc705b36de8ed509c539c6d81193e7846272f18'
            '0a5f8610ef0001b5c98834f850ec9a3ade5437703ea04cb363f7cc6f5b39fec5'
            'cf9a3a51876fd00e1b4fd34afe1ca79763facd6b0326628186b342da0fd9b68f')

prepare() {
  cd $pkgname-$pkgver

  # fix path
  sed 's|usr/man|usr/share/man|' -i Makefile
  # do not abort on error
  sed 's/-Werror//' -i utils/Makefile
  # do not use hardcoded gcc binary
  sed '/^CC/d' -i Makefile utils/Makefile data/Makefile
  # add our ldflags
  patch -Np0 < ../$pkgname-$pkgver-ldflags.patch
  # allow building with newer libpng
  patch -Np0 < ../$pkgname-$pkgver-libpng15.patch
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
