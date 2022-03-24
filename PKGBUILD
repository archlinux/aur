# Maintainer: CodingKoala <lesy.dimitri+aur@gmail.com>
# Contributor: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=3.18.2
pkgrel=1
pkgdesc="In-depth Attack Surface Mapping and Asset Discovery"
arch=('any')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go' 'git')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/v${pkgver}.tar.gz)
sha512sums=('43545f984ce8f408fed73eb644b4f603fa657c09d4f70bcb82e0465a2121ebca03c05e7b0eee94b43e790098f46670f2eac451683f80bf9f81dd97062eb4ca73')

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
