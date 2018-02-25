# Maintainer: Hexchain Tong <i at hexchain dot org>

pkgname=tpm2-tss-git
pkgver=1.1.0.r495.g3a38292
_pkgname=tpm2-tss
pkgrel=1
pkgdesc="TPM (Trusted Platform Module) 2.0 Software Stack (TSS)"
arch=('i686' 'x86_64')
provides=('tpm2-tss')
conflicts=('tpm2-tss')
url="https://github.com/tpm2-software/tpm2-tss"
license=('custom')
makedepends=('git' 'cmocka' 'autoconf-archive')
depends=('libgcrypt' 'uriparser')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    ./bootstrap
    ./configure --prefix=/usr --sbindir=/usr/bin --disable-static
    make
}

check() {
    cd "$srcdir/$_pkgname"
    make -k check
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
