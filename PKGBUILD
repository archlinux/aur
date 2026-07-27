# Maintainer: M0N7Y5
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=pipeasio-git
pkgver=1.2.3.r2.gb4c004b
pkgrel=1
pkgdesc="ASIO driver for Wine that talks directly to PipeWire (no libjack dependency) (git master)"
arch=('x86_64')
url="https://github.com/M0n7y5/pipeasio"
license=('GPL-3.0-or-later')
depends=(wine pipewire qt6-base hicolor-icon-theme)
# mingw-w64-gcc builds the opt-in 32-bit WoW64 PE front end, matching the
# official release tarballs.
makedepends=(git cmake ninja mingw-w64-gcc)
provides=("pipeasio=${pkgver%%.r*}")
conflicts=(pipeasio)
# !lto: winebuild reads symbols from the .o files; LTO bytecode objects break it.
options=('!strip' '!debug' '!lto')
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --abbrev=7 --tags 2>/dev/null \
    | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g' \
    || printf '0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SETTINGS_PANEL=ON \
    -DBUILD_WOW64_32=ON \
    -DBUILD_TESTS=OFF
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}"

  # master installs the Wine arch layout, both unified-name symlinks, the
  # register helper, the panel, its desktop entry and icon.
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
