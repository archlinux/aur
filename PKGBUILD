# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
_pkgname=imgcat
pkgname=$_pkgname-git
pkgver=r168.37fa9d9
pkgrel=1
pkgdesc="It's like cat, but for images"
arch=('any')
url="https://github.com/eddieantonio/imgcat"
license=('ISC')
depends=('git' 'ncurses' 'termcap')
#backup=()
source=("$_pkgname::git+https://github.com/eddieantonio/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    autoconf
    ./configure
    sed -i 's/LDLIBS = $(LIBS) -ltermcap -lm -lpthread/LDLIBS = $(LIBS) -ltermcap -lm -lpthread -lcurses/' Makefile
    make 

    make install PREFIX="$pkgdir/"

    # Move bin to usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    find "$pkgdir/bin" -type f -exec mv '{}' "$pkgdir/usr/bin/" \;
    rm -r "$pkgdir/bin"

    # Move share to usr/share
    mkdir -p "${pkgdir}/usr/share/man/man1"
    find "$pkgdir/share" -type f -exec mv '{}' "$pkgdir/usr/share/man/man1" \;
    rm -r "$pkgdir/share"
}