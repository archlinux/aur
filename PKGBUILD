# Maintainer: Roshless <pkg@roshless.me>
# Contributor: Jelle van der Waa <jelle@dwaa.nl>

pkgname=pushgateway
pkgver=1.6.2
pkgrel=1
pkgdesc="Prometheus push acceptor for ephemeral and batch jobs."
arch=('x86_64')
url="https://github.com/prometheus/pushgateway"
license=('Apache')
depends=('glibc')
makedepends=('go' 'git')
source=("https://github.com/prometheus/pushgateway/archive/v${pkgver}.tar.gz"
	"pushgateway.service")

build() {
    cd $pkgname-$pkgver

    LDFLAGS="-extldflags $LDFLAGS \
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


sha512sums=('a090169d3639443d53df74bf2651fd0ed206b1e17f068cc6f16b93f0911f724cedf20a3d5c0639e36352516836bb11e1badbc70933d63ae94c5bc0af8c3bc366'
            'baf8f41a9643b7c8e9bdf59a38c6275df8861ed4c033de3ef3dd80ed8687d001724f43cad968d5f6c2d4c3541aa4d8b84d7c3a266f149e780c7168074b37f711')
