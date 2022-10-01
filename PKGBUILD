# Maintainer: CodingKoala <lesy.dimitri+aur@gmail.com>
# Contributor: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=3.20.0
pkgrel=1
pkgdesc="In-depth Attack Surface Mapping and Asset Discovery"
arch=('any')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go' 'git')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/v${pkgver}.tar.gz)
sha512sums=('08e93b15cbe460ec15aea5a3e6b07e2d0154ee0dba5ea2d985874c8a3e5e0d524814d2ef756cf32b51c6efda3c65f8d6387857278736369ae57f04931ff09089')

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
