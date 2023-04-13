# Maintainer: CodingKoala <lesy.dimitri+aur@gmail.com>
# Contributor: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=3.22.2
pkgrel=3
pkgdesc="In-depth Attack Surface Mapping and Asset Discovery"
arch=('any')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go' 'git')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/v${pkgver}.tar.gz)
sha512sums=('35292913cca5648155c6c62304b0d92a724785273022da53102df775d3c7f38ec6644863d9caaed30e23183c92219e4f6478bc426229c176879648c15e86ab30')

build() {
  cd "amass-$pkgver"

  mkdir bin
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -v -o bin/ ./cmd/...
}

check() {
  cd "amass-$pkgver"

  go test ./...

  # Remove golang mod cache otherwise makepkg clean doesn't work due to perms
  go clean -modcache
}

package() {
  cd "amass-$pkgver"

  install -dm 755 "${pkgdir}/usr/share/${pkgname}"
  install -Dm 755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  cp -a --no-preserve=ownership "examples/" "${pkgdir}/usr/share/${pkgname}"
  find "${pkgdir}/usr/share/${pkgname}/examples" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share/${pkgname}/examples" -type f -exec chmod 644 {} \;
}
