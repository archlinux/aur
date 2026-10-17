# Maintainer: Shaun Lastra <shaun@lastra.us>
pkgname=tabctl
pkgver=2.3.1
pkgrel=1
pkgdesc="Command-line browser tab controller"
arch=('x86_64')
url="https://github.com/slastra/tabctl"
license=('MIT')
depends=('dbus')
makedepends=('go' 'git')
optdepends=(
    'firefox: Firefox browser support'
    'brave-bin: Brave browser support'
    'chromium: Chromium browser support'
    'google-chrome: Chrome browser support'
)
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/slastra/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e6675455dc0296088e9bd677382ca2f1d579c6a15910882187241237b1b77940')
install=tabctl.install

build() {
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    local ldflags="-linkmode=external -X github.com/tabctl/tabctl/internal/config.Version=$pkgver"
    go build -ldflags "$ldflags" -o tabctl ./cmd/tabctl
    go build -ldflags "$ldflags" -o tabctl-mediator ./cmd/tabctl-mediator

    # Build browser extensions from shared source (if available)
    if [[ -x scripts/build-extensions.sh ]]; then
        ./scripts/build-extensions.sh
    fi
}

package() {
    cd "$pkgname-$pkgver"

    # Install binaries
    install -Dm755 tabctl "$pkgdir/usr/bin/tabctl"
    install -Dm755 tabctl-mediator "$pkgdir/usr/bin/tabctl-mediator"

    # Install browser extensions
    install -dm755 "$pkgdir/usr/share/$pkgname/extensions"
    cp -r extensions/firefox "$pkgdir/usr/share/$pkgname/extensions/"
    cp -r extensions/chrome "$pkgdir/usr/share/$pkgname/extensions/"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}