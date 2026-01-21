# Maintainer: Neboer <rubinposter@gmail.com>
# Contributor: Neboer <rubinposter@gmail.com>

_pkgname=yggoverlay-cni-plugin

pkgname=yggoverlay
pkgver=0.1

pkgrel=1
pkgdesc='CNI plugin for containerd to manage yggdrasil overlay network for VPN connection between containers'

arch=('any')
url="https://github.com/Neboer/yggoverlay-cni-plugin"
license=('MIT')
depends=(glibc)
makedepends=(go)
provides=('yggoverlay')
backup=('etc/cni/net.d/30-man8br0-ygg.conflist' 'etc/cni/net.d/40-man8br1.conflist')

source=(
    $url/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz 
    30-man8br0-ygg.conflist 
    40-man8br1.conflist 
)

sha256sums=('02674e225f9e6d36112711c66091766fccdf1dd167a926814f5fe8ec965b3857'
            'ac9dd814ef5e6753fd11efbe0e3ad5569f8778a7605e2c09806d66d0f8aa51eb'
            'c89d902c56b7bf2b4b44b843781e1205811783ee8842e765b1ca708e0a7ddc38')

build() {
    cd "$_pkgname-$pkgver"
    mkdir -p build
    go build -o build/ .
}

package() {
    mkdir -p -m 700 "$pkgdir/etc/cni/net.d/"
    install -vDm644 "30-man8br0-ygg.conflist" -t "$pkgdir/etc/cni/net.d/"
    install -vDm644 "40-man8br1.conflist" -t "$pkgdir/etc/cni/net.d/"

    install -vDm755 "$srcdir/$_pkgname-$pkgver/build/$_pkgname" -t "$pkgdir/opt/cni/bin/"
}
