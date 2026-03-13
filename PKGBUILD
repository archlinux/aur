# Maintainer: @kjlsai <zhangjian@sipeed.com>
pkgname=picoclaw
pkgver=0.2.2
pkgrel=1
pkgdesc="Ultra-Efficient AI Assistant in Go"
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64' 'loong64')
url="https://github.com/sipeed/picoclaw"
license=('MIT')
options=('!debug')
install=picoclaw.install
depends=('glibc' 'ca-certificates')
makedepends=('go>=1.25' 'nodejs' 'pnpm')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/sipeed/picoclaw/archive/refs/tags/v${pkgver}.tar.gz"
    'picoclaw.service'
)
sha256sums=(
    '67696e0d13d22f33ed00b603ce889616e504e2b03adb3e9f75d1ea212f2f0e73'
    '91430fbf2b30369c7665fb4be1a3b8979de3b3c7b48b4c9fbdfe36996802b56c'
)

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export CGO_ENABLED=0
    local build_time
    local go_version
    local ldflags

    build_time="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
    go_version="$(go version | awk '{print $3}')"
    ldflags="-s -w -X github.com/sipeed/picoclaw/pkg/config.Version=v${pkgver} -X github.com/sipeed/picoclaw/pkg/config.GitCommit=v${pkgver} -X github.com/sipeed/picoclaw/pkg/config.BuildTime=${build_time} -X github.com/sipeed/picoclaw/pkg/config.GoVersion=${go_version}"

    go generate ./...

    pushd web/frontend >/dev/null
    pnpm install --frozen-lockfile
    pnpm build:backend
    popd >/dev/null

    go build -buildvcs=false -trimpath -tags stdjson -ldflags "$ldflags" -o picoclaw ./cmd/picoclaw
    go build -buildvcs=false -trimpath -tags stdjson -ldflags "-s -w" -o picoclaw-launcher ./web/backend
    go build -buildvcs=false -trimpath -tags stdjson -ldflags "-s -w" -o picoclaw-launcher-tui ./cmd/picoclaw-launcher-tui
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 picoclaw "$pkgdir/usr/bin/picoclaw"
    install -Dm755 picoclaw-launcher "$pkgdir/usr/bin/picoclaw-launcher"
    install -Dm755 picoclaw-launcher-tui "$pkgdir/usr/bin/picoclaw-launcher-tui"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 config/config.example.json "$pkgdir/usr/share/$pkgname/examples/config.example.json"
    install -Dm644 web/picoclaw-launcher.desktop "$pkgdir/usr/share/applications/picoclaw-launcher.desktop"
    install -Dm644 web/picoclaw-launcher.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/picoclaw-launcher.png"

    install -Dm644 "$srcdir/picoclaw.service" "$pkgdir/usr/lib/systemd/user/picoclaw.service"
}
