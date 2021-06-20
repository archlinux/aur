# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=srhtctl
pkgver=0.5.0
pkgrel=1
pkgdesc='CLI for interacting with the sr.ht API'
arch=('x86_64')
url='https://hub.xenrox.net/~xenrox/srhtctl/'
license=('GPL3')
makedepends=('go')
source=(
    "$pkgname-$pkgver.tar.gz::https://git.xenrox.net/~xenrox/${pkgname}/archive/${pkgver}.tar.gz"
    "https://git.xenrox.net/~xenrox/${pkgname}/refs/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.sig"
)
sha256sums=('be955c97a378b43798d960662dea90eda6daf6c81b420ae2ca7b89207b8a9ec2'
            'SKIP')
validpgpkeys=('BBC78A8FF5467A292893AE702698363BB3DBBAEE')

check() {
    cd "$srcdir/$pkgname-$pkgver"
    go test ./...
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o srhtctl
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install

    "$pkgdir/usr/bin/srhtctl" completionBASH | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/srhtctl"
    "$pkgdir/usr/bin/srhtctl" completionZSH | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_srhtctl"
}
