# Maintainer: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=3.5.1
pkgrel=1
pkgdesc="In-depth subdomain enumeration written in Go"
arch=('any')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go' 'git')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/v${pkgver}.tar.gz)
sha512sums=('f96f9e195f2f629adb8ff1e52973fc1e4d6b159522f0fb3efbf00103166b214ba90db449b9d2a0864df372aee48d7f1a5eac1da7b36adb2154d0ee92cccf93c3')

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
