# Maintainer: Sean E. Russell <ser@ser1.net> -> also the developer

pkgname=legume
pkgver=1.6.1
pkgrel=1
pkgdesc="A minimalist, distributed, database-free issue tracker using traditional TODO/FIXME code comments."
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://hg.sr.ht/~ser/legume"
license=(MIT)
depends=(glibc)
makedepends=('go>=1.24.0')
changelog=Changelog
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  CGO_ENABLED=0

  mkdir -p man1
  go generate
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=v${pkgver}" \
    -buildmode=pie \
    ./cmd/leg
  gzip -f man1/leg.1
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-v${pkgver}/leg "${pkgdir}"/usr/bin/legume
  install -Dm644 "${srcdir}"/${pkgname}-v${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}"/${pkgname}-v${pkgver}/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}"/${pkgname}-v${pkgver}/CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}"/${pkgname}-v${pkgver}/man1/leg.1.gz "${pkgdir}/usr/share/man/man1/legume.1.gz"
}
sha256sums=('509c0bfea2447a717c33fc793f0a7a3d2f9a8ebe48789d7d58591c647d0839b1')
