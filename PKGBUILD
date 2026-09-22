# Maintainer: M0N7Y5
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=pipeasio
pkgver=1.8.0
pkgrel=1
# Upstream tags use semver prerelease hyphens (v1.0.0-rc1); pkgver maps '-' to '_'.
_pkgtag="v${pkgver//_/-}"
pkgdesc="ASIO driver for Wine that talks directly to PipeWire (no libjack dependency)"
arch=('x86_64')
url="https://github.com/M0n7y5/pipeasio"
license=('GPL-3.0-or-later')
# libpipewire carries the linked libpipewire-0.3.so.0; pipewire is the daemon
# the driver connects to at runtime.
depends=(wine libpipewire pipewire qt6-base hicolor-icon-theme)
makedepends=(cmake ninja)
# !lto: winebuild reads symbols from the .o files; LTO bytecode objects break it.
options=('!strip' '!debug' '!lto')
_pkgsrc="${pkgname}-${_pkgtag#v}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${_pkgtag}.tar.gz")
b2sums=('e8382d45f4ab8b976f283924a909b24abc653cf710c4ac8487683172ac3f346117a2cdbd889e77fc7010e9ff50b3d386607674067d7f40ae3f6c0877383474d5')

build() {
  cd "${srcdir}/${_pkgsrc}"
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SETTINGS_PANEL=ON \
    -DBUILD_TESTS=OFF
  cmake --build build
}

package() {
  cd "${srcdir}/${_pkgsrc}"

  # Upstream installs the Wine arch layout, both unified-name symlinks, the
  # register helper, the panel, its desktop entry and icon.
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
