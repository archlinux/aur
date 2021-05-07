# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>
# Contributor: Sergey Shatunov <me@prok.pw>

pkgname=matchbox
pkgdesc='Network boot and provision Fedora CoreOS and Flatcar Linux clusters.'
arch=(aarch64 arm x86_64)
url='https://matchbox.psdn.io/'
_url='https://github.com/poseidon/matchbox'
pkgver=0.9.0
pkgrel=1
license=('APACHE')
makedepends=(go)

source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3cb92acacacc7974a9565808ea525d2d13791fac99c6b1a8a4e7c09bd076f91b')
sha512sums=('9177893feb944d81c29d896d1881e9765b01823fe803755ccf07a65dc2ef23a436f50227edb87a9f685f06fac88978e213bf2c18e84690b63d00b86fa676f366')
b2sums=('cf2cd53340e4c0ccd58ad8e2578a6c062c7762211aef75ec67903b76bd1c42899aeb0668f9fb6630dcdcb1caae4cf4d69382e7557c4cff3c99fb86b8802a8213')
provides=($pkgname)
conflicts=($pkgname)

prepare() {
  mkdir -p "${pkgname}-${pkgver}/build"
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/ ./cmd/...
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
