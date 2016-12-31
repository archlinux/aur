# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko
pkgver=0.7.15
pkgrel=1
pkgdesc="Free version of the german card game Doppelkopf"
arch=('i686' 'x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
depends=('gtkmm3' 'gnet' 'freealut')
makedepends=('asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix')
source=("https://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.src.zip"
        "freedoko-$pkgver-archlinux.patch")
sha256sums=('73a61078fa114faae0b764e4c7e81a6c8b6e8201ee17a79fdcdf03424f74f723'
            'a18a6378aa69f77eabdaf5af658a99cd3f120ac4049ca429a578401c2c6d541c')

prepare() {
  cd FreeDoko_$pkgver

  # patch Makefiles
  patch -p1 -i ../freedoko-$pkgver-archlinux.patch
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
    "$pkgdir"/usr/share/applications/freedoko.desktop

  cp -r manual "$pkgdir"/usr/share/doc/freedoko/
  find "$pkgdir"/usr/share/doc -type f -exec chmod 644 {} \;

  find "$pkgdir"/usr/share/doc -type f \( -name Makefile -o -name *.sh \
    -o -name Windows -o -name SuSE -o -name hpux* \) -delete
}
