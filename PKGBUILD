# Maintainer: database64128 <free122448@hotmail.com>

pkgname=mediamtx
pkgver=1.21.4
pkgrel=1
pkgdesc="Ready-to-use RTSP / RTMP / LL-HLS / WebRTC server and proxy that allows to read, publish and proxy video and audio streams"
arch=('x86_64' 'aarch64')
url="https://github.com/bluenviron/$pkgname"
license=('MIT')
makedepends=('git' 'go')
backup=("etc/$pkgname/mediamtx.yml")
source=(
    "$pkgname::git+$url.git#tag=v$pkgver"
    "$pkgname.service"
    "$pkgname@.service"
)
b2sums=('53675f45ba1068f066788dda9b7aa74ae797a6a4d910a74cad9b62b3c819cf7b7ac96408a5642d2c8645f31335d96ea94df48070d2e8446a86a3c00adea152a6'
        '452d8717c0f1a6465eb87b6a3082ed81e5f3b0dd7c866e760580a0973c3713835c8ce78f75e1d639f5e0de169ff62d8ee56f9181aa0277a75afa90b9ce93cfe7'
        '187b650102763a259ada04e3728d475444dc1e659e454aa8fe7dc471cec17daae1bf16105ba75c48566344adf77de02098fc5d21fb164195f298b7f9901c2a56')

build() {
    cd $pkgname
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath"
    go generate ./...
    go build -ldflags='-s -w -linkmode=external'
}

package() {
    install -Dm644 $pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
    install -Dm644 $pkgname@.service "$pkgdir"/usr/lib/systemd/system/$pkgname@.service
    cd $pkgname
    install -d "$pkgdir"/etc/$pkgname
    install -Dm644 $pkgname.yml "$pkgdir"/etc/$pkgname/$pkgname.yml
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
