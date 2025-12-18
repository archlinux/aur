# Maintainer: a821
# Contributor: agp
# Contributor: Johannes Löthberg
pkgname=pacutils-git
pkgver=0.15.0
pkgrel=2
pkgdesc='Helper tools for libalpm'
url='https://github.com/andrewgregory/pacutils'
arch=('x86_64')
depends=('pacman')
makedepends=('git' 'perl')
conflicts=('pacutils')
provides=("pacutils")
license=('MIT')
source=("git+${url}"
         0001-pacutils-pacman-7.1-compatibility.patch
         0002-Support-new-DisableSandbox-configuration-options.patch)
sha256sums=('SKIP'
            'b9956e9593f27c354998b5728a534756ef7c2fd222eee36664d7f8a2d3a21093'
            '00acaa2e2d41324e351d9850deefc40b349a8251b125c298d6451144a13f64f1')

prepare() {
    cd pacutils
    # https://github.com/andrewgregory/pacutils/pull/83
    git apply -3 ../0001-pacutils-pacman-7.1-compatibility.patch
    git apply -3 ../0002-Support-new-DisableSandbox-configuration-options.patch
}

pkgver() {
    cd pacutils
    git describe --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd pacutils
    make CFLAGS="$CFLAGS $LDFLAGS" SYSCONFDIR=/etc LOCALSTATEDIR=/var
}

check() {
    cd pacutils
    make check
}

package() {
    cd pacutils
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
