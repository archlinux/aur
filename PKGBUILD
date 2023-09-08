# Maintainer: matt kasun <matt  at netmaker.io>
pkgname=netclient
pkgver=0.21.0
pkgrel=1
pkgdesc="netclient daemon - a platform for modern, blazing fast wireguard virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netclient'
license=('Apache')
makedepends=(go)

source=("${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9bce9a3b25ef686f513159503687bc2fd4f384c398939734fa71841405dc5c52')

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
