# Maintainer: Michael Gebetsroither <m.gebetsr@gmail.com>
pkgname=cert-viewer
pkgver=0.9.0
pkgrel=1
pkgdesc='Admin toolkit to check x509 certs'
arch=('x86_64' 'aarch64')
url='https://github.com/mgit-at/cert-viewer'
license=('Apache')
makedepends=('go' 'git')
source=("https://github.com/mgit-at/cert-viewer/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f192aee928388b3bc6c78f49b43f777f51175b7331692457d6673055b85704bb')

build() {
    local _commit
    _commit="$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)"
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0

    go build -ldflags "-s -w -extldflags -static -X github.com/mgit-at/$pkgname/version.GitCommit=$_commit" \
        -tags nolegacy -trimpath -o build/
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin"
}
