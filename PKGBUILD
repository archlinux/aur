# Maintainer: Roshless <pkg@roshless.me>
# Contributor: Jelle van der Waa <jelle@dwaa.nl>

pkgname=pushgateway
pkgver=1.11.4
pkgrel=1
pkgdesc="Prometheus push acceptor for ephemeral and batch jobs."
arch=('x86_64')
url="https://github.com/prometheus/pushgateway"
license=('Apache-2.0')

makedepends=('go')
options=('!lto')
source=("https://github.com/prometheus/pushgateway/archive/v${pkgver}.tar.gz"
	"pushgateway.service")

build() {
    cd $pkgname-$pkgver

    LDFLAGS="-extldflags \"$LDFLAGS\" \
	-X github.com/prometheus/common/version.Version=$pkgver \
	-X github.com/prometheus/common/version.Revision=$pkgver \
	-X github.com/prometheus/common/version.Branch=tarball"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external $LDFLAGS" \
    .
}

check() {
    cd $pkgname-$pkgver
    go test ./...
}

package() {
    install -Dm644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
}


sha512sums=('f3ba97119f90bf3f1a1e41f335aff6fd2c0671168ae46e4d7bd5732fd32794577905a9fa497b82f7101e2d299d6b85d17046c63e8afbbf28a48f7faf34d732ec'
	'040b30881bca83fdbfabb5f62285a165325ab793abd9fbb103b92062d36d373d0e466f0e553a7c2caa63370a93c0030fd047dad5759bc5fad3ea20e4a83d9c89')
