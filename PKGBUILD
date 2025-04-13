# Maintainer: Roshless <pkg@roshless.me>
# Contributor: Jelle van der Waa <jelle@dwaa.nl>

pkgname=pushgateway
pkgver=1.11.1
pkgrel=0
pkgdesc="Prometheus push acceptor for ephemeral and batch jobs."
arch=('x86_64')
url="https://github.com/prometheus/pushgateway"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
options=('!lto')
source=("https://github.com/prometheus/pushgateway/archive/v${pkgver}.tar.gz"
	"pushgateway.service")

build() {
    cd $pkgname-$pkgver

    LDFLAGS="-extldflags \"$LDFLAGS\" \
	-X github.com/prometheus/common/version.Version=$pkgver \
	-X github.com/prometheus/common/version.Revision=$pkgver \
	-X github.com/prometheus/common/version.Branch=tarball \
	-X github.com/prometheus/common/version.BuildUser=someone@builder \
	-X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)"

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


sha512sums=('e26311bddf6b9d8419aa1ec2ee5204c4ee8c6b0ae95a1be6f3bd3bc5a8eb7302c59b21b12ea0f3824fef4513dc871e56b1573529275cb4eae531e6dad29946a7'
            'baf8f41a9643b7c8e9bdf59a38c6275df8861ed4c033de3ef3dd80ed8687d001724f43cad968d5f6c2d4c3541aa4d8b84d7c3a266f149e780c7168074b37f711')
