pkgname=pacutils-git
pkgdesc='alpm front-end tools'
url='https://github.com/andrewgregory/pacutils'
pkgver=0.0.256
pkgrel=1
arch=('i686' 'x86_64')
depends=('pacman>=4.2')
makedepends=('git')
provides=("pacutils=$pkgver")
license=('MIT')
source=("$pkgname::git://github.com/andrewgregory/pacutils.git"
        "mini.c::git://github.com/andrewgregory/mINI.c.git"
        "tap.c::git://github.com/andrewgregory/tap.c.git")
sha1sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo "0.0.$(git rev-list --count HEAD)"
    #git describe --tags | sed 's/^v//; s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule init
    git config submodule.ext/mini.c.url "$srcdir/mini.c"
    git config submodule.t/tap.c.url "$srcdir/tap.c"
    git submodule update
}

build() {
    cd "$srcdir/$pkgname"
    make
}

check() {
    cd "$srcdir/$pkgname"
    make check
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
