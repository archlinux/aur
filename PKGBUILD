#Maintainer: NiNjA <heinep at gmail dot com>

_pkgname=julius
pkgname=$_pkgname-game
pkgver=1.1.0
pkgrel=2
pkgdesc="Open source re-implementation of Caesar III (Original copy required)"
arch=('i686' 'x86_64')
url="https://github.com/bvschaik/julius"
license=('AGPL')
makedepends=('cmake')
depends=('sdl2' 'sdl2_mixer')
install="$pkgname.install"
source=($pkgname.desktop $pkgname.install fix_build_with_sdl2_2.0.10.patch add_filename_macro.patch $url/archive/v$pkgver.zip)
sha256sums=('d44482503d890ab62e64f607c67b5c9686de68e17411920d3c02d54d468ac2a2'
            '903b97f1a07bf4fa8495166c00e45fd1c2ec5fba4d25169cf5f810e51781ac40'
            '5b3efd9802b9b630fd9fbaf84da2f6708ef22e841600b0078e04bacc37de32e0'
            '86d1468c89d8c6624224207fb3b864d54ce82889302766934859d2eb6c8c99b8'
            'dfb66d15713592c02f3564e8359f55117b2b4365181f62d877cd26c50f092ed3')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    patch -p1 < ../fix_build_with_sdl2_2.0.10.patch
    patch -p0 < ../add_filename_macro.patch
    sed -i 's#__FILE__#__FILENAME__#g' ext/libsmacker/* # replace full path in symbol table with base name
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    cmake .
    make
}

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver/$_pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm664 "$srcdir/$_pkgname-$pkgver/res/julius_48.png" "$pkgdir/usr/share/pixmaps/julius_48.png"
    install -Dm664 "$srcdir/$_pkgname-$pkgver/res/julius_256.png" "$pkgdir/usr/share/pixmaps/julius_256.png"
    install -Dm664 "$srcdir/$_pkgname-$pkgver/res/julius_512.png" "$pkgdir/usr/share/pixmaps/julius_512.png"
    install -Dm664 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
