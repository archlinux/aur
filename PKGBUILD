# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=sampler
pkgver=1.0.0
pkgrel=1
pkgdesc='A tool for shell commands execution, visualization and alerting. Configured with a simple YAML file.'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://sampler.dev'
license=('custom:Fair Source License')
makedepends=('go-pie' 'alsa-lib')
conflicts=("${pkgname}-git")
source=("https://github.com/sqshq/sampler/archive/v${pkgver}.tar.gz")
sha256sums=('de9065e76d950166fd5e355b1610a3e0697caa4dc3ee5f2877e9da0cd52fc942')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
  env GO111MODULE=on go build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  unset GOFLAGS
  env GO111MODULE=on go test -v ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE"    "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
