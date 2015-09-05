# Maintainer: 10sr <8slashes+arch [at] gmail [dot] com>

pkgname=nvi
pkgver=1.79
pkgrel=1
pkgdesc="The Berkeley Vi Editor"
arch=('i686' 'x86_64')
url="https://sites.google.com/a/bostic.com/keithbostic/vi"
license=('BSD')
depends=('libtool' 'ncurses')
source=("https://sites.google.com/a/bostic.com/keithbostic/files/$pkgname-$pkgver.tar.gz"
       "fixerrors.patch")
md5sums=('765e2153f5fc4f21793f2edc2647305a'
         'c57d0dfb738d292d95a547029b6f6c86')


prepare(){
    # http://www.yansite.jp/jnvi.html
    cd "$srcdir"/"$pkgname"-"$pkgver"
    patch -p1 <../fixerrors.patch
    cd "$srcdir"/"$pkgname"-"$pkgver"/build
    cp -pf /usr/share/libtool/build-aux/config.guess .
    cp -pf /usr/share/libtool/build-aux/config.sub .
}

build(){
    export CPPFLAGS="${CPPFLAGS} -U_FORTIFY_SOURCE"
    cd "$srcdir"/"$pkgname"-"$pkgver"/build
    ./configure --prefix="$pkgdir"/usr --program-prefix=n \
                --disable-curses --disable-re
    make
}

package(){
    cd "$srcdir"/"$pkgname"-"$pkgver"/build

    make install

    # license
    install -Dm644 "$srcdir"/"$pkgname"-"$pkgver"/LICENSE \
            "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
