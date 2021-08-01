# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Michael Straube <michael.straubej@gmail.com>
# Contributor: Loui Chang <louipc dot ist at no spam gmail company>

pkgname=tomatoes
pkgver=1.55
pkgrel=17
pkgdesc="I Have No Tomatoes - tomato smashing game"
url="https://tomatoes.sourceforge.net"
license=('ZLIB')
arch=('i686' 'x86_64' 'aarch64')
depends=('sdl_image' 'sdl_mixer' 'glu')
makedepends=('gendesk')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-linux-src-$pkgver.tar.bz2"
        "https://downloads.sourceforge.net/$pkgname/$pkgname-linux-1.5.tar.bz2"
        "0001-tomatoes-1.55-makefile-compile-flags.patch"
        "0002-tomatoes-1.55-Quell-const-char-conversion-warnings.patch"
        "0003-tomatoes-1.55-config-hiscore-file-saving-loading.patch")
sha256sums=('126d001532ee5b81cc95e1a86a274d11669b8c8f65c8235ae2e9b8fbdfab4a60'
            '69a3af1994cb58409be9b469e1aa4bdb91c405d99071c7431526640ec53d1300'
            '61c03349398ba56a9781a79a9c8ae962f870b25d9b0ddeb36f5e662a6cb90ff2'
            '4f9e72fcb3d4427ec633d9ce6f3bb73179cfac1dba55f1ff7f68725f63f1d55d'
            '0dcab19428d4904d1d5ab0099b23f6d9f3f53399303166ad3cea6e743efcd9bf')

prepare() {
  cd $pkgname-$pkgver

  patch -p1 -i ../0001-tomatoes-1.55-makefile-compile-flags.patch
  patch -p1 -i ../0002-tomatoes-1.55-Quell-const-char-conversion-warnings.patch
  patch -p0 -i ../0003-tomatoes-1.55-config-hiscore-file-saving-loading.patch

  sed -n '7,27p' README-src > LICENSE

  gendesk -f -n --pkgname=$pkgname --pkgdesc="$pkgdesc"
}

build() {
  cd $pkgname-$pkgver

  make \
    MPKDIR=/usr/share/tomatoes/ \
    MUSICDIR=/usr/share/tomatoes/music/ \
    CONFIGDIR=/usr/share/tomatoes/ \
    OVERRIDEDIR=./
}

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir"/usr/share/tomatoes
  cp -r ../tomatoes-1.5/* "$pkgdir"/usr/share/tomatoes

  install -Dm755 tomatoes "$pkgdir"/usr/bin/tomatoes
  install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/tomatoes.png
  install -Dm644 tomatoes.desktop "$pkgdir"/usr/share/applications/tomatoes.desktop
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
