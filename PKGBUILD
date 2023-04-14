# Maintainer: Fijxu <fijxu <at> zzls <dot> xyz>
pkgname=dnsproxy-git
pkgver=0.48.3.r753.5864a87
pkgrel=1
pkgdesc="Simple DNS proxy with DoH, DoT, DoQ and DNSCrypt support (git version)"
arch=('any')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
makedepends=('git' 'go')
provides=('dnsproxy')
conflicts=(dnsproxy-bin dnsproxy-adguard)
source=("dnsproxy-git::git+https://github.com/AdguardTeam/dnsproxy.git"
        "dnsproxy.yaml"
        "dnsproxy.service")
sha256sums=("SKIP"
        "9d8a7088bb101114397dd299c19d690f0356a6787844c2b4ca7358612dd1b594"
        "565eea9808589ecafa81f2229ac1f85b39028e26d488a9a7c0b51afc43d7f42b")
_conf=etc/dnsproxy/dnsproxy.yaml    

pkgver() {
    cd "$srcdir/$pkgname"
    printf "0.48.3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    go build -mod=vendor -v
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

