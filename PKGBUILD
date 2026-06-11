# Maintainer: Neboer <rubinposter@gmail.com>
# Contributor: Neboer <rubinposter@gmail.com>

_pkgname=yggoverlay-cni-plugin

pkgname=yggoverlay
pkgver=0.3

pkgrel=2
pkgdesc='CNI plugin for containerd to manage yggdrasil overlay network for VPN connection between containers'

arch=('any')
url="https://github.com/Neboer/yggoverlay-cni-plugin"
license=('MIT')
depends=(glibc)
makedepends=(go)
provides=('yggoverlay')
install=yggoverlay.install

source=(
    $url/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz 
    30-man8br0-ygg-v4only.conflist 
    30-man8br0-ygg-v6.conflist 
)

sha256sums=('7d2dfc15785ee16d7e6b4692a57cc517233c3d61dace41f60ab9419a0c1f2fb7'
            'ef4bdca9439911829f08a5ba09da573c81ed956a1b69275e33d5d0b20ad729b2'
            '24aff186e14db1329004ed9b4b8670456bd1866b5a3dc8c7cd0327edbd3c6831')

build() {
    cd "$_pkgname-$pkgver"
    export LDFLAGS="-X github.com/containernetworking/plugins/pkg/utils/buildversion.BuildVersion=v$pkgver"
    make build
}

package() {
    install -vDm644 "30-man8br0-ygg-v4only.conflist" -t "$pkgdir/usr/share/yggoverlay/"
    install -vDm644 "30-man8br0-ygg-v6.conflist" -t "$pkgdir/usr/share/yggoverlay/"

    install -vDm755 "$srcdir/$_pkgname-$pkgver/out/yggoverlay" "$pkgdir/opt/cni/bin/yggoverlay"
}
