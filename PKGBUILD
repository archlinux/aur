# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=soju-git
_pkgname=soju
pkgver=r503.c994ce7
pkgrel=1
pkgdesc='A user-friendly IRC bouncer'
arch=('x86_64')
url='https://soju.im/'
license=('AGPL3')
makedepends=('git' 'go' 'scdoc')
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
    'bdaac5cbbb59a9e8a73fa9956196412315d5fb6ba69abde3a5649cef7028e2f2'
    '8ad78b224cf570e09c7f95d2a4e89c83449c9715ceaaecedcc81c56be812ee77')

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
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build ./cmd/soju
    go build ./cmd/sojuctl

    scdoc <doc/soju.1.scd >doc/soju.1
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR=$pkgdir install
    install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm644 "$srcdir/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
