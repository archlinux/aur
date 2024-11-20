# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=fortunate
pkgver=1.0.3
pkgrel=1
pkgdesc="A fortune-mod powered motivational app that delivers uplifting quotes and thoughtful messages."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/fortunate"
license=('MIT')
makedepends=('make' 'go' 'gcc' 'pkg-config' 'xorg-server-devel' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi')
depends=('fortune-mod')
provides=("fortunate")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c70d01dffc0206b67a2b8795da1feb048874c5b888fb69b9c268b16dec951022')

build() {
  mkdir -p "${srcdir}/go/src/github.com/zquestz"
  export GOPATH="${srcdir}/go"
  export GOBIN="$GOPATH/bin"

  mv "$pkgname-$pkgver" "$GOPATH/src/github.com/zquestz/$pkgname"
  cd "$GOPATH/src/github.com/zquestz/$pkgname"

  make

  go clean -modcache
}

package() {
  cd "${srcdir}/go/src/github.com/zquestz/$pkgname"

  PREFIX="${pkgdir}/usr" make install

  install -Dm 644 "fortunes/appreciation" "${pkgdir}/usr/share/fortune/appreciation"
  install -Dm 644 "fortunes/appreciation.dat" "${pkgdir}/usr/share/fortune/appreciation.dat"
  install -Dm 644 "fortunes/inspiration" "${pkgdir}/usr/share/fortune/inspiration"
  install -Dm 644 "fortunes/inspiration.dat" "${pkgdir}/usr/share/fortune/inspiration.dat"
  install -Dm 644 "fortunes/motivation" "${pkgdir}/usr/share/fortune/motivation"
  install -Dm 644 "fortunes/motivation.dat" "${pkgdir}/usr/share/fortune/motivation.dat"

  install -Dm 644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
