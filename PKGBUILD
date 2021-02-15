pkgbase=trojan-go-git
#pkgname=(trojan-go-git trojan-go-docs-git)
pkgname=(trojan-go-git)
_pkgname=trojan-go
pkgver=0.8.2.r0.gd051cf4
pkgrel=1
makedepends=(go git hugo)
arch=(x86_64)
url="https://github.com/p4gefau1t/trojan-go"
license=(GPL3)
source=("$_pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir"/$_pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {    
    # NOTE: uncomment this if you are in mainland china
    # export GOPROXY="https://goproxy.cn,direct"
    export CGO_ENABLED=1
    export GO111MODULE=on

    # Build Trojan-Go
    cd "$srcdir"/$_pkgname
    go build -v \
        -buildmode=pie -trimpath -mod=readonly -modcacherw \
        -tags "full" \
        -ldflags="-s -w -extldflags=-Wl,-z,now,-z,relro" \
        -o trojan-go .
    
#    # Build Trojan-Go Documentation
#    cd "$srcdir"/$_pkgname/docs/
#    make hugo-build
}

package_trojan-go-git() {
    pkgdesc="A Trojan proxy written in Go (git version)."
    depends=(glibc v2ray-geoip v2ray-domain-list-community)
    provides=(trojan-go)
    conflicts=(trojan-go)

    sed -i "10s/bin/lib/g" "$srcdir"/$_pkgname/example/trojan-go.service
    
    install -Dm755 "$srcdir"/$_pkgname/trojan-go -t "$pkgdir"/usr/lib/trojan-go/
    install -Dm644 "$srcdir"/$_pkgname/example/{{client,server}.json,trojan-go{,@}.service} -t "$pkgdir"/etc/trojan-go/example/
    
    mkdir -p "$pkgdir"/usr/bin
    ln -sf /usr/lib/trojan-go/trojan-go "$pkgdir"/usr/bin/trojan-go
    ln -sf /usr/share/v2ray/geosite.dat "$pkgdir"/usr/lib/trojan-go/geosite.dat
    ln -sf /usr/share/v2ray/geoip.dat "$pkgdir"/usr/lib/trojan-go/geoip.dat
}

#package_trojan-go-docs-git() {
#    pkgdesc="Offline Documentation for Trojan-Go."
#    depends=()
#    provides=(trojan-go-docs)
#    conflicts=(trojan-go-docs)
#
#    mkdir -p "$pkgdir"/usr/share/doc/trojan-go
#    cp -rv "$srcdir"/$_pkgname/docs/public/* "$pkgdir"/usr/share/doc/trojan-go/
#}
