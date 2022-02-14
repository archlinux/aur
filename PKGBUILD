# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Sean E. Russell <ser@ser1.net> -> also the program developer
# Contributor: Caleb Bassi <calebjbassi@gmail.com>

pkgname=gotop
pkgver=4.1.3
pkgrel=1
pkgdesc="A terminal based graphical activity monitor inspired by gtop and vtop"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/xxxserxxx/gotop"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c0a02276e718b988d1220dc452063759c8634d42e1c01a04c021486c1e61612d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CGO_ENABLED=0

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=v${pkgver} -extldflags ${LDFLAGS}" \
    -buildmode=pie \
    ./cmd/gotop
  go run ./cmd/gotop --create-manpage > gotop.8
  gzip gotop.8
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/gotop "${pkgdir}"/usr/bin/gotop
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/gotop.8.gz "${pkgdir}"/usr/share/man/man8/gotop.8.gz
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/layouts/htop "${pkgdir}"/etc/gotop/htop
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
