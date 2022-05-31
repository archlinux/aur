# Maintainer: Dirk Wilden <dirk.wilden@device-insight.com>

pkgname=kafkactl
pkgver=2.3.0
pkgrel=1
pkgdesc="Command Line Tool for managing Apache Kafka"
url="https://github.com/deviceinsight/kafkactl/"
arch=("i686" "x86_64" "aarch64")
license=("APACHE")
depends=("glibc")
makedepends=('go>=1.16')
optdepends=('kubectl: for kafka running in Kubernetes cluster',
'bash-completion: auto-completion for kafkactl in Bash',
'zsh-completions: auto-completion for kafkactl in ZSH')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/deviceinsight/kafkactl/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  3074ee02c3c087f0198120178ab1a14f79f72fb09c67cedd35b9b631050e108c
)

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  go build -ldflags "-linkmode=external -X github.com/deviceinsight/kafkactl/cmd.Version=v${pkgver}" -o ${pkgname} .
}

check() {
  cd "${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  "${pkgdir}/usr/bin/${pkgname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  "${pkgdir}/usr/bin/${pkgname}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  "${pkgdir}/usr/bin/${pkgname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
