# Maintainer: Roshless <pkg@roshless.me>
# Contributor: Jelle van der Waa <jelle@dwaa.nl>

pkgname=pushgateway
pkgver=1.3.0
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


sha512sums=('c87442142b54c916d86eea451717cfaf64fba79f1f1103ab38c307267981cefe3ec5299a0c7bc68f40817e3c9f0df67af32adc642b04b55760aa54c3cf092cc8'
            '94c46a5969529d48b0a4f7b0e673d8d393dd2692d1c97d725aa0c9d90c4157969cca8d379591d4bbe5b454d2ecb26750193f0eeb9e221dcdc5619d4dfffbf147')
