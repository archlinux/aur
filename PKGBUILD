# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgbase=gun-git
pkgname=(gun-proxy-git gun-sip003-git gun-docs-git)
pkgdesc="PoC of tunneling traffic via gRPC CDNs"
pkgver=0.2.0.r8.g3c4c562
pkgrel=1
arch=(x86_64 aarch64)
url="https://github.com/Qv2ray/gun"
license=('MIT')
depends=(gcc-libs)
makedepends=(go git)
source=("${pkgbase%-git}::git+$url")
b2sums=(SKIP)

pkgver() {
    cd "$srcdir"/"${pkgbase%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir"/"${pkgbase%-git}"
    go build -v \
        -buildmode=pie -trimpath -mod=readonly -modcacherw \
        -ldflags="-s -w -extldflags=-Wl,-z,now,-z,relro" \
        -o gun github.com/Qv2ray/gun/cmd
    go build -v \
        -buildmode=pie -trimpath -mod=readonly -modcacherw \
        -ldflags="-s -w -extldflags=-Wl,-z,now,-z,relro" \
        -o gun-sip003 github.com/Qv2ray/gun/cmd/sip003
}

package_gun-proxy-git() {
	pkgdesc="PoC of tunneling traffic via gRPC CDNs"
	arch=(x86_64 aarch64)
	provides=(gun-proxy)
	conflicts=(gun-proxy)
	
	cd "$srcdir"/"${pkgbase%-git}"
	install -Dm755 gun -t "$pkgdir"/usr/bin/
}

package_gun-sip003-git() {
	pkgdesc="PoC of tunneling traffic via gRPC CDNs (Shadowsocks SIP003 Plugin)"
    arch=(x86_64 aarch64)
    provides=(gun-sip003)
	conflicts=(gun-sip003)
	optdepends=('shadowsocks-rust: shadowsocks sip003 host'
                'shadowsocks-libev: shadowsocks sip003 host')
	
    cd "$srcdir"/"${pkgbase%-git}"
    install -Dm755 gun-sip003 -t "$pkgdir"/usr/bin/
}

package_gun-docs-git() {
    pkgdesc="PoC of tunneling traffic via gRPC CDNs (Documentations)"
    arch=(any)
    provides=(gun-docs)
    conflicts=(gun-docs)
    
    cd "$srcdir"/"${pkgbase%-git}"
    install -Dm644 README.md branding.png -t "$pkgdir"/usr/share/doc/gun/
    install -Dm644 cmd/sip003/README         "$pkgdir"/usr/share/doc/gun/README-SIP003
}
