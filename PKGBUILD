# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: Thiago Almeida <thiago.almeida@topgolf.com>
pkgname=hcledit
url=https://github.com/minamijoyo/hcledit
pkgver=0.2.6
pkgrel=1
pkgdesc="A command line editor for HCL"
arch=('any')
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!lto')
changelog="${pkgname}.changelog"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/minamijoyo/hcledit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('92f71e91948b1e60f673a2a3112a326a168bf47de8f51d6ddca80a772a9e86b51ea32937086f12ba45ae88dcc8bfb89ee2c838f923e3daa3a9668e8995adcf3f')


prepare() {
  cd "${pkgname}-${pkgver}"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build \
    .
}

package() {
  cd "${pkgname}-${pkgver}"

  install -vDm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
