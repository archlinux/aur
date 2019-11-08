# Maintainer: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=3.2.3
pkgrel=1
pkgdesc="In-depth subdomain enumeration written in Go"
arch=('any')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go-pie' 'git')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/v${pkgver}.tar.gz)
sha512sums=('0c2c82d7c6f19980fbbfb79528a5ba77542b7d19c5725eecf364b2dfea8bef92e6de143df586d8e15c06eaee04840e9a3568de542ab36208a9e8845d64ef7e3d')

build() {
  cd "Amass-$pkgver"

  mkdir bin
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -v -o bin/ ./cmd/...
}

check() {
  cd "Amass-$pkgver"

  go test ./...

  # Remove golang mod cache otherwise makepkg clean doesn't work due to perms
  go clean -modcache
}

package() {
  cd "Amass-$pkgver"

  install -dm 755 "${pkgdir}/usr/share/${pkgname}"
  install -Dm 755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  cp -a --no-preserve=ownership "examples/" "${pkgdir}/usr/share/${pkgname}"
  chmod 644 "${pkgdir}/usr/share/${pkgname}/examples/"*
}
