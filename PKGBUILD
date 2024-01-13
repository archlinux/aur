# Maintainer: Fijxu <fijxu <at> zzls <dot> xyz>
pkgname=dnsproxy-git
pkgver=v0.62.0.r0.gf1ceef0
pkgrel=1
pkgdesc="Simple DNS proxy with DoH, DoT, DoQ and DNSCrypt support (git version)"
arch=('any')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
makedepends=('git' 'go')
provides=('dnsproxy')
conflicts=(dnsproxy-bin dnsproxy-adguard)
backup=(etc/dnsproxy/dnsproxy.yaml)
install=$pkgname.install
source=("dnsproxy-git::git+https://github.com/AdguardTeam/dnsproxy.git"
        "dnsproxy.yaml"
        "dnsproxy.service")
sha256sums=("SKIP"
        "35804d7b72453889bce6cf3bc03a499481f0c2f85fb2b02e272a1b5c061b0823"
        "565eea9808589ecafa81f2229ac1f85b39028e26d488a9a7c0b51afc43d7f42b")
_conf=etc/dnsproxy/dnsproxy.yaml    

pkgver() {
    cd "$srcdir/$pkgname"
		git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
		go mod vendor
    make build
}

# Thanks "5long" for the package(), configuration files and systemd service
package() {
    cd "$srcdir/$pkgname"
    install -Dm755 dnsproxy "$pkgdir"/usr/bin/dnsproxy
    install -Dm644 LICENSE "$pkgdir"/usr/share/license/dnsproxy/LICENSE
    install -Dm644 README.md "$pkgdir"/usr/share/doc/dnsproxy/README.md
    install -Dm644 $srcdir/dnsproxy.yaml "$pkgdir/$_conf"
    install -Dm644 $srcdir/dnsproxy.service "$pkgdir"/usr/lib/systemd/system/dnsproxy.service
}

