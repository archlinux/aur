# Maintainer: matt kasun <matt  at netmaker.io>
pkgname=netclient
pkgver=0.20.4
pkgrel=0
pkgdesc="netclient daemon - a platform for modern, blazing fast wireguard virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netclient'
license=('Apache')
makedepends=(go)

source=("${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e8196f89401cdfaf3de4fd51378e6bdcface07d24f27e9276b6a91c42b6a4c6e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CGO_ENABLED=0

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-s -w  -extldflags ${LDFLAGS}" \
    -tags headless \
    .
}

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
