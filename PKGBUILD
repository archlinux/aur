# Maintainer: somini <dev@somini.xyz>

pkgname=tls-redirector
pkgver=2.4
pkgrel=1
pkgdesc='Tiny service for port 80 that rewrites URLs to HTTPS'
arch=('x86_64' 'aarch64')
url='https://git.sr.ht/~ancarda/tls-redirector'
license=('GPL3')
makedepends=('go')
source=(
  "https://git.sr.ht/~ancarda/tls-redirector/archive/${pkgver}.tar.gz"
)

sha512sums=('4966c7ce7fbe32ae1e96db41666e1b3a7086d5fb9a6e7f89e099f9743ca515d0b27d7680b0f9751ad15f2ac7451aed88e591d05c820a488fe0a7fa477044bcc8')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go generate ./...
  go build -v
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755  "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # SystemD
  install -Dm644 "systemd/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "systemd/${pkgname}.socket" "${pkgdir}/usr/lib/systemd/system/${pkgname}.socket"
}
