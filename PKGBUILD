# Maintainer: pqatsi <aur@leonardoamaral.com.br>
pkgname=chlink
pkgver=5.0.0
pkgrel=1
pkgdesc='Companion PC CLI for Checkpoint wireless save transfer.'
arch=('x86_64' 'aarch64')
url="https://github.com/BernardoGiordano/Checkpoint"
license=('GPL-3.0')
makedepends=('go')
source=("checkpoint-${pkgver}.tar.gz::https://github.com/BernardoGiordano/Checkpoint/archive/v${pkgver}.tar.gz")
sha256sums=('709c5104246586b72df48d938bb366bcc26ae1cac803dda0aca72e67a3b3c314')

prepare() {
  cd "${srcdir}/Checkpoint-${pkgver}/tools/chlink/"
  mkdir -p build/
}

build() {
  cd "${srcdir}/Checkpoint-${pkgver}/tools/chlink/"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath "\'"-ldflags=-linkmode=external -X=main.version=${pkgver}"\'" -mod=readonly -modcacherw"
  go build -o build .
}

package() {
  cd "${srcdir}/Checkpoint-${pkgver}/tools/chlink/"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
