# Maintainer: Hexchain Tong <i at hexchain dot org>

pkgname=tpm2-tools-git
pkgver=2.0.0.r254.ga635550
pkgrel=1
pkgdesc="TPM (Trusted Platform Module) 2.0 tools based on TPM2.0-TSS"
arch=('i686' 'x86_64')
url="https://github.com/01org/tpm2.0-tools"
license=('custom')
provides=('tpm2-tools')
conflicts=('tpm2-tools')
makedepends=('git' 'autoconf-archive')
depends=('tpm2-abrmd' 'curl')
source=("$pkgname::git+https://github.com/01org/tpm2.0-tools.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$pkgname"
    ./bootstrap
    ./configure --prefix=/usr --sbindir=/usr/bin --disable-static
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    make DESTDIR="$pkgdir" install
}
