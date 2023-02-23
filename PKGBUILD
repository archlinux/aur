# Maintainer: matt kasun <matt  at netmaker.io>
pkgname=netclient
pkgver=0.18.1
pkgrel=0
pkgdesc="netclient daemon - a platform for modern, blazing fast wireguard virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netclient'
license=('Apache')
makedepends=(go)

source=("${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8c0e1ba3c16d26213f11d47b1ed69bb7564a16e891115bf8fa154c3a8ff6fa52')

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
