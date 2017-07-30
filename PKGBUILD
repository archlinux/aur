# Maintainer: hexchain <i at hexchain.org>

pkgname="tpm2-abrmd-git"
pkgver=1.1.0.r2.ga9368b2
pkgrel=1
pkgdesc="TPM2 Access Broker & Resource Manager"
license=('BSD')
arch=('x86_64')
depends=('glib2' 'tpm2-tss')
makedepends=('git' 'autoconf-archive' 'automake' 'cmocka')
provides=("tpm2-abrmd")
conflicts=("tpm2-abrmd")
url="https://github.com/01org/tpm2-abrmd"
_gitname="tpm2-abrmd"
source=("git+$url.git"
        "tss.sysusers")
sha256sums=('SKIP'
            '67d89be143dc129a95b0c1a42b3e92367a151289fb6c0655c054fccd62cd9a0e')

pkgver() {
    cd "$srcdir/$_gitname"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_gitname"
    ./bootstrap
    ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --disable-static --with-pic
}

check() {
    msg2 "Skipping check for now..."
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "$srcdir"
    install -Dm644 "tss.sysusers" "$pkgdir/usr/lib/sysusers.d/tss.conf"
}
