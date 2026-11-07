# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=switchworks-git
pkgver=0.1.7.r2.g9962d21
pkgrel=1
pkgdesc="Control plane for coding agents across your machines (swk, tray icon, systemd units) (Git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/jm2/switchworks"
license=('GPL-3.0-or-later' 'OFL-1.1')
depends=('glibc' 'hicolor-icon-theme')
makedepends=('git' 'go')
optdepends=('gnome-shell-extension-appindicator: tray icon on GNOME')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# Arch Go package guidelines: the repository's go, never a downloaded
# toolchain, modules fetched in prepare(), and a PIE build linked externally
# so makepkg's CFLAGS/LDFLAGS (RELRO, etc.) apply.
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
  cd "${pkgname}"
  _goenv
  go mod download
}

build() {
  cd "${pkgname}"
  _goenv
  local _ldflags="-linkmode=external -X github.com/jm2/switchworks/internal/version.Version=$(git describe --tags)"
  mkdir -p build
  go build -ldflags "${_ldflags}" -o build/swk ./cmd/swk
  go build -ldflags "${_ldflags}" -o build/swk-tray ./cmd/swk-tray
}

check() {
  cd "${pkgname}"
  _goenv
  go test ./...
  ./build/swk version | grep -F "$(git describe --tags) "
}

package() {
  cd "${pkgname}"
  build-aux/linux/install-tree.sh "${pkgdir}" build /usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 internal/web/assets/fonts/OFL-Onest.txt internal/web/assets/fonts/OFL-JetBrainsMono.txt \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
