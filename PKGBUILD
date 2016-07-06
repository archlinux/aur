# Maintainer: Michael Straube <michael_straube web de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko
pkgver=0.7.14
pkgrel=4
pkgdesc="Free version of the german card game Doppelkopf"
arch=('i686' 'x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
depends=('gtkmm' 'gnet' 'freealut')
makedepends=('asciidoc' 'texlive-latexextra')
source=("http://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.src.zip"
        "freedoko-$pkgver-archlinux.patch")
sha1sums=('178d351adf7cf70f5c5fa132a2b468645dac670d'
          '33f2c8d1cfbecb3b1d86b694535a333b644c72fa')

prepare() {
  cd FreeDoko_$pkgver

  # convert line endings from DOS to Unix
  sed -i 's/\r$//' src/Makefile.local.template

  # patch Makefiles for building an Arch package
  patch -p0 < "$srcdir/freedoko-$pkgver-archlinux.patch"
}

build() {
  cd FreeDoko_$pkgver

  make compile
  make documentation
}

package() {
  cd FreeDoko_$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 bin/FreeDoko.desktop \
    "$pkgdir/usr/share/applications/freedoko.desktop"

  rm "$pkgdir"/usr/share/doc/freedoko/de/{Windows,SuSE,Windows.kompilieren}
  rm "$pkgdir"/usr/share/doc/freedoko/{en/Windows,hpux.required_libs-ia64.txt}
}
