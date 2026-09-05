# Maintainer: M0N7Y5
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=pipeasio
pkgver=1.6.0
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
b2sums=('4e218979a6ce6ce40300c4fa96e7040f4816f0920ca73485bc92d6f943335fed07dfc3249ce5502074781c1d5cc9ccfda808081b3ba8fae6abbe5e9441357d9f')

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
