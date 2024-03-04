# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=mediamtx
pkgname=$_pkgname-git
pkgver=1.6.0.r0.gdec395c
pkgrel=1
pkgdesc="Ready-to-use RTSP / RTMP / LL-HLS / WebRTC server and proxy that allows to read, publish and proxy video and audio streams"
arch=('x86_64' 'aarch64')
url="https://github.com/bluenviron/$_pkgname"
license=('MIT')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/mediamtx.yml")
source=(
    "$pkgname::git+$url.git"
    "$_pkgname.service"
    "$_pkgname@.service"
)
b2sums=(
    'SKIP'
    '636b7c89aec0e54a471464d013fd13fd83bebb21c3ebef9c0259fdea21185e3317ced09ef1c821ed253a62c3825f00cced19e42cdd175d1ddaecdef9800eeb4f'
    '280cab48cc4d513d20952c82aab7474b9eb474dcb37a2b9d559a7caa8cd5ab6527a293c77b8ab7c64f02564c42c91b7141756020adef8ddb54316e8fcea6d0bf'
)

pkgver() {
    cd $pkgname
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
    install -Dm644 $_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
    install -Dm644 $_pkgname@.service "$pkgdir"/usr/lib/systemd/system/$_pkgname@.service
    cd $pkgname
    install -d "$pkgdir"/etc/$_pkgname
    install -Dm644 $_pkgname.yml "$pkgdir"/etc/$_pkgname/$_pkgname.yml
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
