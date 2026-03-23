# Maintainer: bstee615 <benjaminjsteenhoek at gmail dot com>
pkgname=rrun
pkgver=0.1.0
pkgrel=1
pkgdesc="Sync git-tracked files to a remote machine and run commands there"
arch=('x86_64' 'aarch64')
url="https://github.com/bstee615/rrun"
license=('MIT')
depends=('openssh' 'rsync' 'git')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bstee615/rrun/archive/v$pkgver.tar.gz")
sha256sums=('cc0deaa110a33ed5a777fdffb6763e1a3a87233bf697900a243a286db5301df4')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build \
        -buildvcs=false \
        -ldflags "-linkmode=external -s -w -X github.com/bstee615/rrun/cmd.version=$pkgver" \
        -o "$pkgname" .
}

check() {
    cd "$pkgname-$pkgver"
    export GOPATH="${srcdir}"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname"        "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md         "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md      "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 LICENSE           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
