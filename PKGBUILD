# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=f4
_tag=v0.3.0-beta
pkgver=0.3.0beta
pkgrel=1
pkgdesc='Dual-pane Far Manager / far2l-style file manager with TUI and GUI'
arch=('x86_64' 'aarch64')
url="https://github.com/unxed/f4"
license=('BSD-3-Clause' 'MIT')
depends=('glibc' 'hicolor-icon-theme')
makedepends=('go')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_tag.tar.gz")
sha256sums=('ca7b2c711cc3d4dc14e63a0b08b0098e58e0c40b75441e44f828a8ec7ae1b4be')

prepare() {
    cd "$pkgname-${_tag#v}"
    go mod download
}

build() {
    cd "$pkgname-${_tag#v}"
    # goffi (purego FFI) needs the internal linker, so no cgo
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-bindnow -X github.com/unxed/f4/internal/app.buildVersion=$_tag" -o f4 ./cmd/f4
}

package() {
    cd "$pkgname-${_tag#v}"
    install -Dm755 f4 "$pkgdir/usr/bin/f4"
    install -Dm644 packaging/linux/f4.desktop "$pkgdir/usr/share/applications/f4.desktop"
    for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "internal/gui/assets/icon/generated/f4-$size.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.github.unxed.f4.png"
    done
    install -Dm644 internal/gui/assets/icon/f4.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.unxed.f4.svg"
    install -Dm644 f4.example.ini "$pkgdir/usr/share/doc/$pkgname/f4.example.ini"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 plugins/visren/LICENSE.upstream "$pkgdir/usr/share/licenses/$pkgname/VisRen-BSD-3-Clause.txt"
    install -Dm644 plugins/ios/LICENSE.go-ios "$pkgdir/usr/share/licenses/$pkgname/go-ios-MIT.txt"
}
