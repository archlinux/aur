# Maintainer:  Carlos Pita <carlosjosepita@gmail.com>

pkgname=readline-devel-git
pkgdesc='GNU readline library (Development version)'
pkgver="7.`date +%G%m%d`"
pkgrel=1
url='http://savannah.gnu.org/git/?group=readline'
arch=('i686' 'x86_64')
license=('GPL')
backup=('etc/inputrc')
options=('!emptydirs')
install=readline.install
depends=('glibc' 'ncurses')
makedepends=('git')
conflicts=('readline')
provides=("readline=$pkgver")
source=(inputrc)
md5sums=('58d54966c1191db45973cb3191ac621a')

build() {
    branch="readline-7.0-testing"
    cd "$srcdir"
    git clone --depth 1 --branch $branch git://git.savannah.gnu.org/readline.git
    cd readline
    git checkout $branch
    git apply ../../abi-compat.patch
    [[ $CARCH == "x86_64" ]] && CFLAGS="$CFLAGS -fPIC"
    ./configure --prefix=/usr
    make SHLIB_LIBS=-lncurses
}

package() {
    cd "$srcdir/readline"
    make DESTDIR="$pkgdir" install
    cd "$pkgdir"
    install -Dm644 ../../inputrc etc/inputrc
    ln -s libreadline.so.7.0 usr/lib/libreadline.so.6
    ln -s libreadline.so.7.0 usr/lib/libreadline.so.6.3
}
