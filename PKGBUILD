# Maintainer: ml <ml@visu.li>
pkgname=ksd
pkgver=1.0.6
pkgrel=2
pkgdesc='kubernetes secret decoder'
arch=('x86_64' 'i686')
url='https://github.com/mfuentesg/ksd'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('90d1b0bc68de22b2acf7f24f53aaa6756cecb4122dd646949118c2d9bcd7eed0')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o "$pkgname" -ldflags="-linkmode=external -X main.version=v${pkgver}"
}

check() {
  cd "${pkgname}-${pkgver}"
  go test
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "$pkgname"
  install -Dm755 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
