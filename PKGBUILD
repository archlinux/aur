# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Loui Chang <louipc dot ist at no spam gmail company>

pkgname=tomatoes
pkgver=1.55
pkgrel=14
pkgdesc="How many tomatoes can you smash in ten short minutes?"
url="http://tomatoes.sourceforge.net"
license=('ZLIB')
arch=('i686' 'x86_64')
depends=('sdl_image' 'sdl_mixer' 'glu')
makedepends=('gendesk')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-linux-src-$pkgver.tar.bz2"
        "https://downloads.sourceforge.net/$pkgname/$pkgname-linux-1.5.tar.bz2"
        "0001-tomatoes-1.55-makefile-Append-to-compile-flags.patch"
        "0002-tomatoes-1.55-Quell-const-char-conversion-warnings.patch"
        "0003-tomatoes-1.55-config-hiscore-file-saving-loading.patch")
sha256sums=('126d001532ee5b81cc95e1a86a274d11669b8c8f65c8235ae2e9b8fbdfab4a60'
            '69a3af1994cb58409be9b469e1aa4bdb91c405d99071c7431526640ec53d1300'
            '49b2944b268efcfc660da682dfbc2404558e52ba034cc39d310e8c74ed89646c'
            '4f9e72fcb3d4427ec633d9ce6f3bb73179cfac1dba55f1ff7f68725f63f1d55d'
            '0dcab19428d4904d1d5ab0099b23f6d9f3f53399303166ad3cea6e743efcd9bf')

prepare() {
  cd $pkgname-$pkgver

  patch -p1 < ../0001-tomatoes-1.55-makefile-Append-to-compile-flags.patch
  patch -p1 < ../0002-tomatoes-1.55-Quell-const-char-conversion-warnings.patch
  patch -p0 < ../0003-tomatoes-1.55-config-hiscore-file-saving-loading.patch

  sed -n '7,27p' README-src > LICENSE

  gendesk -f -n --pkgname=$pkgname --comment="I Have No Tomatoes" \
    --categories="Application;Game;ArcadeGame;"
}

build() {
  cd $pkgname-$pkgver

  LDFLAGS=/usr/lib/libSDL-1.2.so.0

  make \
    MPKDIR=/usr/share/tomatoes/ \
    MUSICDIR=/usr/share/tomatoes/music/ \
    CONFIGDIR=/usr/share/tomatoes/ \
    OVERRIDEDIR=./
}

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir"/usr/share/$pkgname
  cp -r ../$pkgname-1.5/* "$pkgdir"/usr/share/$pkgname

  install -Dm755 tomatoes "$pkgdir"/usr/bin/tomatoes
  install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/tomatoes.png
  install -Dm644 tomatoes.desktop "$pkgdir"/usr/share/applications/tomatoes.desktop
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
