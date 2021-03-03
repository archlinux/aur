# Maintainer: Roshless <pkg@roshless.me>
# Contributor: Jelle van der Waa <jelle@dwaa.nl>

pkgname=pushgateway
pkgver=1.4.0
pkgrel=1
pkgdesc="Prometheus push acceptor for ephemeral and batch jobs."
arch=('any')
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


sha512sums=('4e28d8f4dbec38517ddcccb8a7f09bdab35870b183b3971c23ee8d6df92bc25abe42a242178941246edec73255172821509185eaa2b829ebdc3c2fbde4f9a227'
            'baf8f41a9643b7c8e9bdf59a38c6275df8861ed4c033de3ef3dd80ed8687d001724f43cad968d5f6c2d4c3541aa4d8b84d7c3a266f149e780c7168074b37f711')
