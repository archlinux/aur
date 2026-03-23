# Maintainer: bstee615 <benjaminjsteenhoek at gmail dot com>
pkgname=rrun
pkgver=0.1.0
pkgrel=1
pkgdesc="Sync git-tracked files to a remote machine and run commands there"
arch=('x86_64' 'aarch64')
url="https://github.com/bstee615/rrun"
license=('MIT')
depends=('openssh' 'rsync' 'git')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bstee615/rrun/archive/v$pkgver.tar.gz")
sha256sums=('a9d28b40341b50e1e287e2fa9437ed4408be40e9076c18f3a066f7523ac7958c')

prepare() {
    cd "$pkgname-$pkgver"
    go mod download
}

build() {
    cd "$pkgname-$pkgver"
    go build \
        -trimpath \
        -buildvcs=false \
        -ldflags "-s -w -X rrun/cmd.version=$pkgver" \
        -o "$pkgname" .
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname"   "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md    "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 LICENSE      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
