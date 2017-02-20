# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko
pkgver=0.7.16
pkgrel=1
pkgdesc="Free version of the german card game Doppelkopf"
arch=('i686' 'x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
depends=('gtkmm3' 'gnet' 'freealut')
makedepends=('asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix')
source=("https://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.src.zip"
        "freedoko-$pkgver-archlinux.patch")
sha256sums=('6fdcee22b3e9a76d44d8c3a582d068452290ec4c24f8f2f9e4498adf4daf40af'
            '329b77525f18d3c1837b78d1b4bd1c8446afb9cd530458345e23a39423f9598b')

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

  tar -c --exclude={*.sh,Makefile} manual |
    tar -x -C "$pkgdir"/usr/share/doc/freedoko

  find "$pkgdir"/usr/share/doc/freedoko/manual -type f -exec chmod 644 {} \;
  rm "$pkgdir"/usr/share/doc/freedoko/{de/Windows,de/SuSE,en/Windows,hpux*}
}
