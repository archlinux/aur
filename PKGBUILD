# Maintainer: jin <mail@nvimer.org>
pkgname=deepseek-reasonix-tui
_pkgname=reasonix
pkgver=2.45.0
pkgrel=1
pkgdesc="Cache-first DeepSeek coding agent for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
makedepends=('go')
provides=("$_pkgname")
conflicts=("$_pkgname")
# The release build deliberately strips Go symbols with -s -w, so makepkg
# cannot produce a useful split debug package.
options=('!debug')
_commit=56795d8913cc5ec27344d5c30ffe28b7435af4e5
source=("$_pkgname-$pkgver.tar.gz::https://github.com/esengine/DeepSeek-Reasonix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7c46330b3bf7e7e69b475af7c9b70bac727c81ebab4ae0f8535b8893c2999354')

build() {
    cd "DeepSeek-Reasonix-$pkgver"
    export CGO_ENABLED=0
    local _build_time
    _build_time="$(date -u -d "@${SOURCE_DATE_EPOCH:-0}" +%Y-%m-%dT%H:%M:%SZ)"
    local _docs="-X reasonix/internal/tools/productdocs.linkedVersion=v$pkgver -X reasonix/internal/tools/productdocs.linkedRevision=$_commit"
    go build -buildvcs=false -trimpath \
        -ldflags "-s -w -X main.version=v$pkgver -X main.gitCommit=${_commit:0:12} -X main.buildTimeUTC=$_build_time $_docs" \
        -o "$_pkgname" ./cmd/reasonix
}

package() {
    cd "DeepSeek-Reasonix-$pkgver"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
