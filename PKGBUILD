# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=qrcp
pkgver=0.10.1
pkgrel=1
pkgdesc="Transfer files over Wi-Fi from your computer to a mobile device by scanning a QR code without leaving the terminal"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/claudiodangelis/qrcp"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('866344c247fbc2bd4def91e2b7fe395b81bc954b89dad4f32ebd8033bd2e6c7d')

build() {
    cd $pkgname-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode=external
            -X \"github.com/claudiodangelis/qrcp/version.version=$pkgver\"
            -X \"github.com/claudiodangelis/qrcp/version.date=$(date -d@"$SOURCE_DATE_EPOCH" +%Y-%m-%dT%H:%M:%SZ)\"" \

    ./qrcp completion bash | install -Dm644 /dev/stdin share/bash-completion/completions/qrcp
    ./qrcp completion zsh | install -Dm644 /dev/stdin share/zsh/site-functions/_qrcp
    ./qrcp completion fish | install -Dm644 /dev/stdin share/fish/vendor_completions.d/qrcp.fish
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    cp -r share/ "$pkgdir/usr"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
