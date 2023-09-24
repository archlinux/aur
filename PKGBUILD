# Maintainer: database64128 <free122448@hotmail.com>

pkgname=mediamtx
pkgver=1.1.1
pkgrel=1
pkgdesc="Ready-to-use RTSP / RTMP / LL-HLS / WebRTC server and proxy that allows to read, publish and proxy video and audio streams"
arch=('x86_64' 'aarch64')
url="https://github.com/bluenviron/$pkgname"
license=('MIT')
makedepends=('go')
backup=("etc/$pkgname/mediamtx.yml")
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname.service"
    "$pkgname@.service"
)
b2sums=(
    'ffd6c3577701f61d7f5d0db16218e1b60a456cd4e6e1e92496bd4b66f14b57dfac2aed5f9f4832cb7c39c2a05f8a939fe62834187f708187f6a04dccadd1a4b0'
    '636b7c89aec0e54a471464d013fd13fd83bebb21c3ebef9c0259fdea21185e3317ced09ef1c821ed253a62c3825f00cced19e42cdd175d1ddaecdef9800eeb4f'
    '280cab48cc4d513d20952c82aab7474b9eb474dcb37a2b9d559a7caa8cd5ab6527a293c77b8ab7c64f02564c42c91b7141756020adef8ddb54316e8fcea6d0bf'
)

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath"
    go build -ldflags="-s -w -linkmode=external -X github.com/bluenviron/mediamtx/internal/core.version=v$pkgver"
}

package() {
    install -Dm644 $pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
    install -Dm644 $pkgname@.service "$pkgdir"/usr/lib/systemd/system/$pkgname@.service
    cd "$pkgname-$pkgver"
    install -d "$pkgdir"/etc/$pkgname
    install -Dm644 $pkgname.yml "$pkgdir"/etc/$pkgname/$pkgname.yml
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
