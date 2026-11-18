# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=MasterDnsVPN
pkgname=masterdnsvpn
pkgver=2026.11.18.210322_7198b45
pkgrel=1
pkgdesc="Advanced DNS tunneling VPN for censorship bypass"
arch=("x86_64")
url="https://github.com/masterking32/MasterDnsVPN"
license=("MIT")
depends=()
makedepends=("git" "go")
source=("git+${url}.git#tag=v${pkgver//_/-}")
sha256sums=('8e7474b04270ee9867ac99caca26a58990982cd5b59019be6ce00a80bdb49e6f')

prepare() {
  cd "${srcdir}/${_pkgname}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${srcdir}/${_pkgname}"
  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  local _target
  for _target in client server; do
    go build -o "${srcdir}/${pkgname}-${_target}" \
      -buildmode=pie \
      -trimpath \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external \
                -X masterdnsvpn-go/internal/version.BuildVersion=v${pkgver//_/-} \
                -extldflags \"$LDFLAGS\"" \
      "./cmd/${_target}"
  done
}

# check() {
#   cd "${srcdir}/${_pkgname}"
#   export GOPATH="${srcdir}"
#   go test -mod=readonly ./...
# }

package() {
    cd "${srcdir}/${_pkgname}"

    local _target
    for _target in client server; do
      install -Dm 755 "${srcdir}/${pkgname}-${_target}" "${pkgdir}/usr/bin/${pkgname}-${_target}"
    done
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 README.MD "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 client_config.toml.simple server_config.toml.simple client_resolvers.simple \
      -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
