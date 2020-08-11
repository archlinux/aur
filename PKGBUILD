# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lite
pkgver=1.11
pkgrel=2
pkgdesc='A lightweight text editor written in Lua'
arch=('x86_64')
url="https://github.com/rxi/$pkgname"
license=('MIT')
depends=('sdl2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-path-fix.patch")
sha256sums=('2fd9466663182da56a36a557d05925d226dc1c5de6fb24e423a7b0056db2eec4'
            'a874de709bf2201816f96807aa50f6b1a15a19aa7989084f01422dd5fe488055')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < "$srcdir/$pkgname-path-fix.patch"
    sed -i -e '/^cflags=/s/"/"$CFLAGS /' \
           -e '/^lflags=/s/"/"$LDFLAGS /' build.sh
}

build() {
    cd "$pkgname-$pkgver"
    ./build.sh
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" $pkgname
    install -d "$pkgdir/usr/share/$pkgname"
    cp -a data/* "$pkgdir/usr/share/$pkgname/"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
