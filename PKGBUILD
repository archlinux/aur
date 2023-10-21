# Maintainer: Sean E. Russell <ser@ser1.net> -> also the developer

pkgname=legume
pkgver=1.4.2
pkgrel=1
pkgdesc="A minimalist, distributed, database-free issue tracker using traditional TODO/FIXME code comments."
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://hg.sr.ht/~ser/legume"
license=(MIT)
depends=(glibc)
makedepends=(go)
changelog=Changelog
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  CGO_ENABLED=0

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main._version=v${pkgver} -extldflags ${LDFLAGS}" \
    -buildmode=pie \
    ./cmd/leg
  gzip -f docs/leg.1
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-v${pkgver}/leg "${pkgdir}"/usr/bin/legume
  install -Dm644 "${srcdir}"/${pkgname}-v${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}"/${pkgname}-v${pkgver}/CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 "${srcdir}"/${pkgname}-v${pkgver}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}"/${pkgname}-v${pkgver}/docs/leg.1.gz "${pkgdir}/usr/share/man/man1/legume.1.gz"
}
sha256sums=('4708cc9d6f4b280241630986094624415dcbd968c66bc8c5737823dde5b9a116')
