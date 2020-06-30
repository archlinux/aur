# Maintainer: Terin Stock <terinjokes@gmail.com>

pkgname=gojq
pkgver=0.10.4
pkgrel=1
pkgdesc='Pure go implementation of jq'
arch=('x86_64')
url="https://github.com/itchyny/gojq"
license=('MIT')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/itchyny/gojq/archive/v${pkgver}.tar.gz")
sha256sums=('ae1cd847becf85bf4a6e4d710043ec369cc9670d06fc3e1056eebc7af641151f')

prepare(){
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go build -o build ./cmd/gojq
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 _gojq "${pkgdir}/usr/share/zsh/site-functions/_gojq"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
