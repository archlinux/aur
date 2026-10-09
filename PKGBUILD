# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=MasterDnsVPN
pkgname=masterdnsvpn
pkgver=2026.06.13.234407_7de2476
pkgrel=1
pkgdesc="Advanced DNS tunneling VPN for censorship bypass"
arch=("any")
url="https://github.com/masterking32/MasterDnsVPN"
license=("MIT")
depends=()
makedepends=("git" "go")
source=("git+${url}.git#tag=v${pkgver//_/-}")
sha256sums=('10a380657ff2502bfb8abeb373e36c9dec5e56fbf942bea3d512d2f9cc166403')

prepare() {
  cd "${srcdir}/${_pkgname}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -o masterdnsvpn-client-${pkgver//_/-}-${pkgrel} \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external \
              -extldflags \"$LDFLAGS\"" \
    ./cmd/client
  go build -o masterdnsvpn-server-${pkgver//_/-}-${pkgrel} \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external \
              -extldflags \"$LDFLAGS\"" \
    ./cmd/server
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -D -m 755 "masterdnsvpn-client-${pkgver//_/-}-${pkgrel}" "${pkgdir}/usr/bin/${pkgname}-client"
    install -D -m 755 "masterdnsvpn-server-${pkgver//_/-}-${pkgrel}" "${pkgdir}/usr/bin/${pkgname}-server"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
