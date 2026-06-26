# Maintainer: Michael Placzek <mplaczek99@users.noreply.github.com>

pkgname=hyprsunset-tui
pkgver=1.1.0
pkgrel=2
pkgdesc='Terminal user interface for managing hyprsunset on Hyprland'
arch=('x86_64')
url='https://github.com/mplaczek99/hyprsunset-tui'
license=('GPL-3.0-only')
options=('!debug')
provides=('hstui')
conflicts=('hstui')
replaces=('hstui')
depends=('glibc' 'hyprland' 'hyprsunset' 'libnotify' 'uwsm')
makedepends=('git' 'go')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode=external -extldflags \"${LDFLAGS}\" -s -w" \
    -o "${pkgname}" .
}

check() {
  cd "${pkgname}"

  go test ./...
}

package() {
  cd "${pkgname}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
