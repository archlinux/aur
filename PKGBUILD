# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=soju-git
_pkgname=soju
pkgver=v0.5.2.r126.gd2067f74d84a
pkgrel=1
pkgdesc='A user-friendly IRC bouncer'
arch=('x86_64')
url='https://soju.im/'
license=('AGPL3')
depends=('sqlite' 'pam')
makedepends=('git' 'go' 'scdoc')
optdepends=(
    "postgresql: PostgreSQL support"
)
install=$_pkgname.install
provides=('soju')
conflicts=('soju')
source=(
    "$_pkgname::git+https://git.sr.ht/~emersion/${_pkgname}"
    "soju.sysusers"
    "soju.service"
    "soju.tmpfiles"
)
sha256sums=('SKIP'
            'c050d3f376f43e1cc22e75f445027862df8d09230e18cbb0913ab58ddced78aa'
            'a6335600217d5e46b38ec4358fcc6533070dd910bb572d481c499f43eb54d2d2'
            '7d9e772f42765a82be0459bcbded2074f68d450ab09c3627ca3b59978188b61b')
backup=('etc/soju/config')

pkgver() {
    cd "$srcdir/$_pkgname"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-tags=libsqlite3,pam -buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR=$pkgdir install
    install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm644 "$srcdir/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
    install -Dm644 "config.in" "$pkgdir/etc/soju/config"
}
