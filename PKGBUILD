pkgname=trojan-go-git
_pkgname=trojan-go
pkgver=0.6.0.r0.gb93b95f
pkgrel=1
pkgdesc="A Trojan proxy written in Go (git version)."
arch=(x86_64)
url="https://github.com/p4gefau1t/trojan-go"
license=(GPL3)
depends=(glibc v2ray-geoip v2ray-domain-list-community)
makedepends=(go golang-golang-x-crypto golang-golang-x-net)
provides=(trojan-go)
conflicts=(trojan-go)
source=("$_pkgname::git+$url.git")
sha512sums=('SKIP')

# You may change this setting if you're not from mainland China.
_goproxy="https://goproxy.cn,direct"

pkgver() {
    cd "$srcdir"/$_pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export GOPATH="$srcdir/$_pkgname/build:/usr/share/gocode"
    mkdir -p "$srcdir/$_pkgname/build"
    
    cd "$srcdir"/$_pkgname
    export CGO_ENABLED=0
    export GO111MODULE=on
    export GOPROXY=$_goproxy
    go build -v -tags "full" -ldflags="-s -w" -o trojan-go .
}

package() {
    cd "$srcdir"/$_pkgname
    install -Dm755 "$srcdir"/$_pkgname/trojan-go -t "$pkgdir"/usr/lib/trojan-go/
    ln -sf /usr/lib/v2ray/geosite.dat "$pkgdir"/usr/lib/trojan-go/geosite.dat
    ln -sf /usr/lib/v2ray/geoip.dat "$pkgdir"/usr/lib/trojan-go/geoip.dat
    mkdir -p "$pkgdir"/usr/bin
    ln -sf /usr/lib/trojan-go/trojan-go "$pkgdir"/usr/bin/trojan-go
}
