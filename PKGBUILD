# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>

pkgname=miru-zoom-git
_pkgname=miru
pkgver=0.1.0.r0.g1234567 # Dynamically updated by pkgver() below
pkgrel=1
pkgdesc="A Wayland-based zoom daemon and control utility (development branch)"
arch=('x86_64' 'aarch64')
url="https://github.com/Vaishnav-Sabari-Girish/miru"
license=('unknown')
depends=('wayland')
makedepends=('git' 'cmake' 'ninja' 'pkgconf' 'wayland-protocols')
provides=('miru-zoom')
conflicts=('miru-zoom')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # Generates a clean version string based on your git tags and commit count
  (
    set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cmake -B build -S "${_pkgname}" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  install -Dm755 build/miru-daemon "${pkgdir}/usr/bin/miru-daemon"
  install -Dm755 build/miructl "${pkgdir}/usr/bin/miructl"
}
