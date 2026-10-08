# Maintainer: Lucas Saavedra Vaz <lucasssvaz@users.noreply.github.com>
pkgname=traygolin-git
_pkgname=traygolin
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Unofficial Linux tray app for the Pangolin VPN client (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/lucasssvaz/traygolin"
license=('Apache-2.0' 'MIT')
depends=('glib2' 'glibc' 'gtk4' 'libadwaita>=1.9' 'gobject-introspection' 'polkit' 'hicolor-icon-theme')
makedepends=('go' 'git')
optdepends=('pangolin-cli: official Pangolin VPN CLI (pangolin on PATH)')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make VERSION="${pkgver}" GO_LDFLAGS="-linkmode=external"
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr LICENSEDIR="/usr/share/licenses/${pkgname}" install
}
