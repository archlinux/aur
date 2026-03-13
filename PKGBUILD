# Maintainer: Romain Bertrand <romaintb@noreply.codeberg.org>
pkgname=fgj
pkgver=0.3.0
pkgrel=1
pkgdesc="A command-line tool for working with Forgejo instances (including Codeberg.org)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://codeberg.org/romaintb/fgj"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/romaintb/fgj/archive/v${pkgver}.tar.gz")
sha256sums=('aedc01b046ecc1657b89d187a4ad208c2b9d92bd4f9bbffffdd93cda3c7b552f')

prepare() {
  cd "${pkgname}"
  mkdir -p build
}

build() {
  cd "${pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/${pkgname} .
}

check() {
  cd "${pkgname}"
  go test ./...
}

package() {
  cd "${pkgname}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
