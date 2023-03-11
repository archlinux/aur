# Maintainer: CodingKoala <lesy.dimitri+aur@gmail.com>
# Contributor: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=3.22.0
pkgrel=1
pkgdesc="In-depth Attack Surface Mapping and Asset Discovery"
arch=('any')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go' 'git')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/v${pkgver}.tar.gz)
sha512sums=('df97627ac078e8f12904aad73fc9367177dce0239ce065d3ef22e3f58f375db6f920822992d8ce2f630f35da6e95474c9d67726ec46bcc428aa09414585350d5')

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
