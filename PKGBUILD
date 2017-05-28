# Contributor: Ian Glen <ian@ianglen.me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

__pkgname=Mutate
pkgname=mutate
pkgver=2.4
pkgrel=5
pkgdesc='A simple launcher inspired by Alfred.'
arch=('i686' 'x86_64')
url="https://github.com/qdore/$__pkgname"
depends=('qt5-x11extras' 'gtk2' 'boost-libs' 'python' 'python2')
makedepends=('boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qdore/${__pkgname}/archive/v$pkgver.tar.gz"
        "fix-compile-error.patch")
md5sums=('faa7549f09f8aa38c812d7861eef8a99'
         '6c12e8abc592480619bee5191b877598')
install=${pkgname}.install
license=('MIT')

prepare() {
    cd "$srcdir/$__pkgname-$pkgver"

    # https://github.com/qdore/Mutate/commit/3c22938
    patch -p1 -i "$srcdir/fix-compile-error.patch"

    # https://github.com/qdore/Mutate/pull/133
    rm -rf include/boost
}

build() {
    cd "$srcdir/$__pkgname-$pkgver/src"
    qmake-qt5 PREFIX=$pkgdir/usr/bin
    make
}

package() {
    cd "$srcdir/$__pkgname-$pkgver/src"
    make DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir/usr/share/doc/mutate/config"
    cp -R "$srcdir/$__pkgname-$pkgver/config" "$pkgdir/usr/share/doc/mutate/"
    chmod -R a+x "$pkgdir/usr/share/doc/mutate/config/scripts"
    chmod -R a+w "$pkgdir/usr/share/doc/mutate/config"
    mkdir -p "$pkgdir/usr/share/icons"
    cp "$srcdir/$__pkgname-$pkgver/info/mutate.png" "$pkgdir/usr/share/icons"
    mkdir -p "$pkgdir/usr/share/applications"
    cp "$srcdir/$__pkgname-$pkgver/info/Mutate.desktop" "$pkgdir/usr/share/applications"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    find $pkgdir/usr/share/doc/mutate/config/ -exec chmod o-w {} \;
}
