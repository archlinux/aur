# Maintainer: Paul Goessmann <paul.goessmann@proton.me>
pkgname=pvpn-go
pkgver=0.2.6
pkgrel=1
pkgdesc='Proton VPN client with TUI for Linux (WireGuard + Stealth)'
arch=('x86_64' 'aarch64')
url='https://github.com/YourDoritos/pVPN'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go>=1.26' 'git')
install=pvpn-go.install
backup=('etc/pvpn/config.toml')
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

  # When the system Go is older than go.mod's directive (common for
  # users with mise/asdf/conda overriding /usr/bin/go), the bootstrap
  # auto-downloads golang.org/toolchain@v0.0.1-go${ver} into the
  # gopath modcache and marks the entire tree 0555/0444. Yay's
  # cleanup on the next upgrade then fails with hundreds of
  # "Permission denied" warnings, leaving the user stuck.
  #
  # GOFLAGS=-modcacherw fixes regular module downloads but does NOT
  # apply to the toolchain bootstrap, so we walk gopath and force
  # everything writable at the end of build() instead.
  if [[ -d "${srcdir}/gopath" ]]; then
    chmod -R u+w "${srcdir}/gopath" || true
  fi
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
