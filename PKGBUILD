#!/bin/bash
# Maintainer: Swapnil Ingle <ingleswapnil2004@gmail.com>
pkgname=quazaar
pkgver=0.1.4
pkgrel=1
pkgdesc="A cross-platform LAN media control system using WebSockets"
arch=('x86_64')
provides=('Quazaar')
conflicts=('Quazaar')
replaces=('Quazaar')
maintainer="Swapnil Ingle <ingleswapnil2004@gmail.com>"
url="https://github.com/codershubinc/quazaar"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('934414414af02881b1b5ce1f1c86cec9a82a484320ab48f151966c2a10e32299')

build() {
    # Current directory at runtime is $srcdir — avoid an extra "src/" prefix.
    cd "$pkgname-$pkgver" 2>/dev/null || cd "${pkgname^}-$pkgver" 2>/dev/null || cd "${pkgname,}-$pkgver" 2>/dev/null || return 1
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -o quazaar ./cmd/server
}

package() {
    cd "$pkgname-$pkgver" 2>/dev/null || cd "${pkgname^}-$pkgver" 2>/dev/null || cd "${pkgname,}-$pkgver" 2>/dev/null || return 1
    
    # Install the binary
    install -Dm755 quazaar "$pkgdir/usr/bin/quazaar"

    # Install the license (Arch policy requires this)
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
