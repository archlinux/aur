# Maintainer: Paul Goessmann <paul.goessmann@proton.me>
pkgname=pvpn-go
pkgver=0.2.0
pkgrel=1
pkgdesc='Proton VPN client with TUI for Linux (WireGuard + Stealth)'
arch=('x86_64' 'aarch64')
url='https://github.com/YourDoritos/pVPN'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go>=1.22' 'git')
install=pvpn-go.install
backup=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

_srcdir="pVPN-${pkgver}"

prepare() {
  cd "${_srcdir}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-modcacherw"
  go mod download
}

build() {
  cd "${_srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  local _ldflags="-s -w -X main.version=${pkgver}"

  go build -ldflags "${_ldflags}" -o pvpnd  ./cmd/pvpnd
  go build -ldflags "${_ldflags}" -o pvpn   ./cmd/pvpn
  go build -ldflags "${_ldflags}" -o pvpnctl ./cmd/pvpnctl
}

package() {
  cd "${_srcdir}"
  install -Dm755 pvpnd   "${pkgdir}/usr/bin/pvpnd"
  install -Dm755 pvpn    "${pkgdir}/usr/bin/pvpn"
  install -Dm755 pvpnctl "${pkgdir}/usr/bin/pvpnctl"

  sed 's|ExecStart=/usr/local/bin/pvpnd|ExecStart=/usr/bin/pvpnd|' \
    dist/pvpnd.service | install -Dm644 /dev/stdin \
    "${pkgdir}/usr/lib/systemd/system/pvpnd.service"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
