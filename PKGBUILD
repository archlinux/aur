# Maintainer: database64128 <free122448@hotmail.com>

pkgname=mediamtx
pkgver=1.2.0
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
    '5563ce064fe5ef230d47ad06c26331cbca74d1a3ecc6992727cab883830739f74991c5f9f44dc38c08dc0f4a7aafa123505aef5452611bfad80f3ec5d441c79f'
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
