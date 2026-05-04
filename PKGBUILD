# Maintainer: Omyac <packages@omy.ac>

pkgname=kafkactl-aws-plugin
pkgver=1.3.1
pkgrel=1
pkgdesc="AWS plugin for kafkactl"
url="https://github.com/deviceinsight/kafkactl-plugins/"
arch=("i686" "x86_64" "aarch64")
license=("APACHE")
depends=("glibc")
makedepends=('go>=1.24')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/deviceinsight/kafkactl-plugins/archive/v${pkgver}.tar.gz"
)

sha256sums=(
  f7f5b961061c863131a9f84e8a6aa7d7273a16b1c3ad4fb86888edebda345eb1
)

build() {
  cd "kafkactl-plugins-${pkgver}/aws"
  export CGO_LDFLAGS="$LDFLAGS"
  export module=$(go list -m)
  go build -ldflags "-linkmode=external -X ${module}/cmd.Version=v${pkgver}" -o ${pkgname} .
}

check() {
  cd "kafkactl-plugins-${pkgver}/aws"
  go test -v -short ./...
}

package() {
  cd "kafkactl-plugins-${pkgver}/aws"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
