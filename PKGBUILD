# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname=konwert
pkgver=1.8
debrel=13
pkgrel=1
pkgdesc="Charset conversion for files or terminal I/O"
arch=('i686' 'x86_64')
url="https://packages.debian.org/stable/konwert"
license=('GPL')
depends=(perl)
#makedepends=()
#optdepends=()
source=('http://deb.debian.org/debian/pool/main/k/konwert/konwert_$pkgver.orig.tar.gz'
        'http://deb.debian.org/debian/pool/main/k/konwert/konwert_$pkgver-$debrel.debian.tar.xz')
md5sums=('838e73ec911ebf25816135cbfd0f7a04'
         '5b3541ccc205dfa399169c3e306f292b') #generate with 'makepkg -g'

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    for p in $(cat ../debian/patches/series); do
        patch -p1 < ../debian/patches/$p
    done
}

CPPFLAGS=""
CXXFLAGS="-O2"
LDFLAGS=""

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make clean
    
    chmod +x filters/UTF8-prn7pl
    make CXXFLAGS="$(CXXFLAGS)" CPPFLAGS="$(CPPFLAGS)" LDFLAGS="$(LDFLAGS)" prefix=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make install prefix=$pkgdir/usr nofixmanconfig=1 mandir=$pkgdir/usr/share/man

    mkdir -p $pkgdir/usr/share/doc
    mv $pkgdir/usr/doc/* $pkgdir/usr/share/doc/
    rmdir $pkgdir/usr/doc

    # Remove development files
    rm -r $pkgdir/usr/share/konwert/devel
    rm -r $pkgdir/usr/lib/konwert/devel
}

