# Maintainer: Sean E. Russell <ser@ser1.net> -> also the developer

pkgname=legume
pkgver=1.5.0
pkgrel=1
pkgdesc="A minimalist, distributed, database-free issue tracker using traditional TODO/FIXME code comments."
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://hg.sr.ht/~ser/legume"
license=(MIT)
depends=(glibc)
makedepends=(go)
changelog=Changelog
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "claphelp.tar.gz::https://hg.sr.ht/~ser/claphelp/archive/v2.3.3.tar.gz"
)

prepare() {
  cd "${srcdir}/claphelp-v2.3.3"
  go build -o "${srcdir}/${pkgname}-v${pkgver}"/makeclapman ./cmd/makeclapman
}

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  CGO_ENABLED=0

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=v${pkgver} -extldflags ${LDFLAGS}" \
    -buildmode=pie \
    ./cmd/leg
  CLAPTRAP_USAGE_JSON=true ./leg |\
    ./makeclapman --author "Sean E. Russell" --description "$pkgdesc"
  gzip -f leg.1
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-v${pkgver}/leg "${pkgdir}"/usr/bin/legume
  install -Dm644 "${srcdir}"/${pkgname}-v${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}"/${pkgname}-v${pkgver}/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}"/${pkgname}-v${pkgver}/CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}"/${pkgname}-v${pkgver}/leg.1.gz "${pkgdir}/usr/share/man/man1/legume.1.gz"
}
sha256sums=('337e0ca876557f3dc52401f36c24cd64c8119c1cdfa23869b48a9d87101eb673'
            'd8721700bb8f1f09bf9334c353eae1023a1cc1b341f2b6723799ddc779ae12c7')
