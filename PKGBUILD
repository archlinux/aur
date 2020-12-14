# Maintainer: somini <dev@somini.xyz>

pkgname=tls-redirector
pkgver=2.4
pkgrel=4
pkgdesc='Tiny service for port 80 that rewrites URLs to HTTPS'
arch=('x86_64' 'aarch64')
url='https://git.sr.ht/~ancarda/tls-redirector'
license=('GPL3')
makedepends=('go')
optdepends=(
  'certbot: For automatic TLS certificate provision'
)
install=tls-redirector.install
source=(
  "https://git.sr.ht/~ancarda/tls-redirector/archive/${pkgver}.tar.gz"
  'tls-redirector.service'
  'tls-redirector.socket'
  'tls-redirector.tmpfiles.conf'
  'tls-redirector.install'
)

sha512sums=('4966c7ce7fbe32ae1e96db41666e1b3a7086d5fb9a6e7f89e099f9743ca515d0b27d7680b0f9751ad15f2ac7451aed88e591d05c820a488fe0a7fa477044bcc8'
            '51e46d9eec50fc48bd4a2f151d338497316e48d0f82db75a2c51201db1fc8a8d525c90c98166df1bd82138c1bc49582ac3f02ffc197b5dd1fa3c1efd812e07cb'
            '8e624b47c4968c10153554fee09867140c336710abf64b87667efcdf8f91476af461c55ec9ddd72b3ef164cdcffbed311c77fd4fa29d33ff2114efe9c80e38e1'
            'b5979192c35595202603947d14d8adc9c39b8db481a7fa356d535f3f33427d3d5acbf3d5f2798ca27df3c7ca657693a46266ecb557839911e34d2df62248b122'
            '081fcd12edbb1f3a069c0b4bcd101db5ba5f432fc456d00a6f47ffa6a446603d087f9a8eab459cffd92f8b3ac1587d8059b561217c5b170f2d3fca4c7b60d902')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go generate ./...
  # Build with optional SystemD activation
  go build -v -tags systemd
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755  "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # SystemD
  install -Dm644 "../${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "../${pkgname}.socket" "${pkgdir}/usr/lib/systemd/system/${pkgname}.socket"
  install -Dm644 "../${pkgname}.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
