# Maintainer: Jelle van der Waa <jelle@dwaa.nl>

pkgname=prometheus-pushgateway
pkgver=1.0.0
pkgrel=1
pkgdesc="Prometheus push acceptor for ephemeral and batch jobs."
arch=('x86_64')
url="https://github.com/prometheus/pushgateway"
license=('Apache')
depends=(glibc)
makedepends=(go-pie git)
source=(https://github.com/prometheus/pushgateway/archive/v${pkgver}.tar.gz prometheus-pushgateway.service)
sha512sums=('0662b3caefa053c8478b3c3fcaba3298ad69d7f7f195acc3b5b932d1f2004cd3df0276156650b0a6022dc529b4b53c2ee4d33f510937c98a1ca4c95e1c087581'
            'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e')

check() {
  cd pushgateway-$pkgver
  go test ./...
}

build() {
  cd pushgateway-$pkgver
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS} \
      -X github.com/prometheus/common/version.Version=$pkgver \
      -X github.com/prometheus/common/version.Revision=$pkgver \
      -X github.com/prometheus/common/version.Branch=tarball \
      -X github.com/prometheus/common/version.BuildUser=someone@builder \
      -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    .
}

package() {
  install -Dm644 prometheus-pushgateway.service "$pkgdir"/usr/lib/systemd/system/prometheus-pushgateway.service
  cd pushgateway-$pkgver
  install -Dm755 pushgateway "$pkgdir"/usr/bin/prometheus-pushgateway
}
