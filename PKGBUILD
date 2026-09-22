# Maintainer: jin <mail@nvimer.org>
pkgname=deepseek-reasonix-tui
_pkgname=reasonix
pkgver=1.38.11
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
_commit=11f9705f083819f1dc9ad764d8352013a86ebd44
source=("$_pkgname-$pkgver.tar.gz::https://github.com/esengine/DeepSeek-Reasonix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1fd0f9e23cf0c927af9e287ff00816ff78fa142c6c98be59e507c93d52379368')

build() {
    cd "DeepSeek-Reasonix-$pkgver"
    export CGO_ENABLED=0
    local _build_time
    _build_time="$(date -u -d "@${SOURCE_DATE_EPOCH:-0}" +%Y-%m-%dT%H:%M:%SZ)"
    local _docs="-X reasonix/internal/productdocs.linkedVersion=v$pkgver -X reasonix/internal/productdocs.linkedRevision=$_commit"
    go build -buildvcs=false -trimpath \
        -ldflags "-s -w -X main.version=v$pkgver -X main.gitCommit=${_commit:0:12} -X main.buildTimeUTC=$_build_time $_docs" \
        -o "$_pkgname" ./cmd/reasonix
}

package() {
    cd "DeepSeek-Reasonix-$pkgver"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
