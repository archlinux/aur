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

source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
        matchbox.sysusers)
sha256sums=('3cb92acacacc7974a9565808ea525d2d13791fac99c6b1a8a4e7c09bd076f91b'
            '4d859fd270cc4ef99f7c21aa30e2a055f993edbf7b7b16adb883ea794cde61af')
sha512sums=('9177893feb944d81c29d896d1881e9765b01823fe803755ccf07a65dc2ef23a436f50227edb87a9f685f06fac88978e213bf2c18e84690b63d00b86fa676f366'
            'b3f8b96d01fc280b6126761ad813d726ad542d40041068a5a07fcd8a10cc369a5c48620dd14bb0f26b22ba33cbd48c1a9236db79d979776d8dd5aa988b763765')
b2sums=('cf2cd53340e4c0ccd58ad8e2578a6c062c7762211aef75ec67903b76bd1c42899aeb0668f9fb6630dcdcb1caae4cf4d69382e7557c4cff3c99fb86b8802a8213'
        '42ea1dff8715b6f1ab94c98bac8c9f60d4cb57de4a4733e878c47ae8b6741f252b8c8c87b64b1ce6908d178dcc4ff4e6fdc62f83e7388ade17c0b26eac792cdd')
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
  mkdir -p "${pkgdir}"/var/lib/matchbox/assets

  install -Dm644 "${srcdir}/matchbox.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "contrib/systemd/matchbox.service" "$pkgdir/usr/lib/systemd/system/matchbox.service"
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
