# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=srhtctl
pkgver=0.4.0
pkgrel=3
pkgdesc='CLI for interacting with the sr.ht API'
arch=('x86_64')
url='https://hub.xenrox.net/~xenrox/srhtctl/'
license=('GPL3')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://git.xenrox.net/~xenrox/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b513f29fad270445156fd034ffa3da8d2ccf9bfcee70dbb9c7c70cbe8e608657')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install

    "$pkgdir/usr/bin/srhtctl" completionBASH | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/srhtctl"
    "$pkgdir/usr/bin/srhtctl" completionZSH | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_srhtctl"
    patch --forward --strip=1 --input="$srcdir/$pkgname-$pkgver/assets/srhtctl.patch" --directory="$pkgdir"
}
