# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=soju
pkgver=0.1.1
pkgrel=1
pkgdesc='A user-friendly IRC bouncer'
arch=('x86_64')
url='https://soju.im/'
license=('AGPL3')
depends=('sqlite')
makedepends=('go' 'scdoc')
install=$pkgname.install
source=(
    "https://git.sr.ht/~emersion/${pkgname}/refs/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.sig}
    "soju.sysusers"
    "soju.service"
    "soju.tmpfiles"
)
sha256sums=('0bfc766b54d67bdfa29a7ce5f99503a5c5d539e8a1e59b36ed5568728bcd1ab5'
            'SKIP'
            'c050d3f376f43e1cc22e75f445027862df8d09230e18cbb0913ab58ddced78aa'
            'd90c047f5f27a06d45840698a0caa9940fc02c75187c04348882f20359655c2b'
            '7d9e772f42765a82be0459bcbded2074f68d450ab09c3627ca3b59978188b61b')
backup=('etc/soju/config')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48')

build() {
    cd "$srcdir/$pkgname-$pkgver"
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
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR=$pkgdir install
    install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
