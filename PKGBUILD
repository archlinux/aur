# Maintainer: Neboer <rubinposter@gmail.com>
# Contributor: Neboer <rubinposter@gmail.com>

_pkgname=yggoverlay-cni-plugin

pkgname=yggoverlay
pkgver=0.3

pkgrel=3
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
            'd15aee9da83ccce926d0beb3f6bb3d9099fd011f13d04961b4001f77b8e6337e'
            'a22f562997565f011e2f9a2b2ebc40e5b77006aef7f56c3f63f95715379788c4')

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
