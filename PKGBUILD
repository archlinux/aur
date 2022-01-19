# Maintainer: CodingKoala <lesy.dimitri+aur@gmail.com>
# Contributor: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=3.16.0
pkgrel=1
pkgdesc="In-depth Attack Surface Mapping and Asset Discovery"
arch=('any')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go' 'git')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/v${pkgver}.tar.gz)
sha512sums=('89135cc746b97dc9b560667c8cd003753216969ae0aecc6576b7520247b5af869aa4d73dbb06463ce85415977eccdc86b183a58bc24025eaf54283eb36c0754d')

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
  find "${pkgdir}/usr/share/${pkgname}/examples" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share/${pkgname}/examples" -type f -exec chmod 644 {} \;
}
