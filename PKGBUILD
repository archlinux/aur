pkgname=pacutils
pkgdesc='alpm front-end tools'
url='https://github.com/andrewgregory/pacutils'
pkgver=0.3.0
pkgrel=3
arch=('i686' 'x86_64')
depends=('pacman>=5.0')
makedepends=('git')
license=('MIT')
source=("$pkgname::git://github.com/andrewgregory/pacutils.git#tag=v$pkgver"
        "mini.c::git://github.com/andrewgregory/mINI.c.git"
        "tap.c::git://github.com/andrewgregory/tap.c.git")
sha1sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    git submodule init
    git config submodule.ext/mini.c.url "$srcdir/mini.c"
    git config submodule.t/tap.c.url "$srcdir/tap.c"
    git submodule update

    # fix for SYSCONFDIR not getting passed through to pacreport
    GIT_COMMITTER_NAME=MAKEPKG \
        GIT_COMMITTER_EMAIL= \
        GIT_COMMITTER_DATE=2016-04-10T09:30:00 \
        git cherry-pick 0bb7b603afb3807f31536239b9daac48a58a9a45
}

build() {
    cd "$srcdir/$pkgname"
    make SYSCONFDIR=/etc LOCALSTATEDIR=/var
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
