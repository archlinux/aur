# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=switchworks
pkgver=0.1.7
pkgrel=1
pkgdesc="Control plane for coding agents across your machines (swk, tray icon, systemd units)"
arch=('x86_64' 'aarch64')
url="https://github.com/jm2/switchworks"
license=('GPL-3.0-or-later' 'OFL-1.1')
depends=('glibc' 'hicolor-icon-theme')
makedepends=('go')
optdepends=('gnome-shell-extension-appindicator: tray icon on GNOME')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ef1ae092087341ee838d88904c5db0b000aa2d2668d380ddd7d6c30011ab1962')

# Arch Go package guidelines: the repository's go, never a downloaded
# toolchain (go.mod pins go1.27.3), modules fetched in prepare(), and a PIE
# build linked externally so makepkg's CFLAGS/LDFLAGS (RELRO, etc.) apply.
_goenv() {
  export GOTOOLCHAIN=local
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
}

prepare() {
  cd "${pkgname}-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  _goenv
  local _ldflags="-linkmode=external -X github.com/jm2/switchworks/internal/version.Version=v${pkgver}"
  mkdir -p build
  go build -ldflags "${_ldflags}" -o build/swk ./cmd/swk
  go build -ldflags "${_ldflags}" -o build/swk-tray ./cmd/swk-tray
}

check() {
  cd "${pkgname}-${pkgver}"
  _goenv
  go test ./...
  ./build/swk version | grep -F "v${pkgver} "
}

package() {
  cd "${pkgname}-${pkgver}"
  # Upstream's installer: binaries, user/system units, sysusers.d entry for
  # the coordinator account (created by pacman's hook), desktop entry, icons.
  build-aux/linux/install-tree.sh "${pkgdir}" build /usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 internal/web/assets/fonts/OFL-Onest.txt internal/web/assets/fonts/OFL-JetBrainsMono.txt \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
