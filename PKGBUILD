# Maintainer: Fijxu <fijxu at nadeko dot net>

pkgname=routedns-git
_pkgname=routedns
pkgver=0.1.80.r0.g53bf18e
pkgrel=1
pkgdesc="DNS stub resolver, proxy and router (git version)"
arch=('any')
url="https://github.com/folbricht/routedns"
license=('BSD')
makedepends=('git' 'go')
provides=('routedns')
install=$pkgname.install
source=("git+https://github.com/folbricht/routedns"
        "routedns.service"
        "config.toml.example")
sha512sums=("SKIP"
            "2f7fdd0d64df3907750e80d925ec4bed36c6d856305c651757949e3631f64179c0a51d35f075be885241caec4b2427e6ef79e94cc25ff64080257b57ecd065b2"
            "8c80fef519c88b098bb86effcb087ff02e6c39779696776292d9a91b62c4089fb16401032a700a2a84f877c570f93c2ffbe51a42f9071e5feed37c0a63d56378")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
    cd "$srcdir/$_pkgname/cmd/routedns"
	export GO111MODULE=on
    go get -u
    go mod tidy
    go build -v
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir"/etc/routedns
    install -Dm755 cmd/routedns/routedns "$pkgdir"/usr/bin/routedns
    install -Dm644 LICENSE "$pkgdir"/usr/share/license/routedns/LICENSE
    install -Dm644 README.md "$pkgdir"/usr/share/doc/routedns/README.md
    cp -r cmd/routedns/example-config "$pkgdir"/usr/share/doc/routedns/ && chmod 644 -R "$pkgdir"/usr/share/doc/routedns/example-config
    install -Dm644 $srcdir/config.toml.example "$pkgdir"/usr/share/doc/routedns/example-config/config.toml.example
    install -Dm644 $srcdir/routedns.service "$pkgdir"/usr/lib/systemd/system/routedns.service
}

