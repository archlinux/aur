# Maintainer: Ivan  <vantu5z@mail.ru>

pkgname=wireproxy
pkgver=1.0.4
pkgrel=1
arch=(x86_64)
license=(ISC)
url="https://github.com/octeep/wireproxy"
pkgdesc="Wireguard client that exposes itself as a socks5 proxy"
depends=()
makedepends=('go>=2:1.18' 'go<2:1.19')
source=("https://github.com/octeep/wireproxy/archive/refs/tags/v${pkgver}.tar.gz"
        "wireproxy.service"
        "wireproxy@.service"
        "wireproxy-user.service"
        "wireproxy-user@.service")
sha256sums=('c600a8cd3d45e006afd0bdc5052730731f50997c85c1fa75112ce7ac6e9e1465'
            '2ad52b7d158fef9c5bd468042e6c7cdc1130a3bde65015bee8107c0a6a422c0d'
            'e3f169d0f814c5c8d0e1a9d4af9ff7f86566f4239d00fffedb804c862202b264'
            'f3510b14b2993d53c3fda4e19bfb13f7f17ebc85d81a2144e0e9a1e47241e041'
            '8a8d6e8fd35e4d0798b0c701a54238d8fb6cdcbbf2ae6efccb827e455d7b658f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external"
  go build -o wireproxy ./cmd/wireproxy
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 "wireproxy" "${pkgdir}/usr/bin/wireproxy"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 "${srcdir}/wireproxy.service" "${srcdir}/wireproxy@.service" -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm0644 "${srcdir}/wireproxy-user.service" "${pkgdir}/usr/lib/systemd/user/wireproxy.service"
  install -Dm0644 "${srcdir}/wireproxy-user@.service" "${pkgdir}/usr/lib/systemd/user/wireproxy@.service"
}
