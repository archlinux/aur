# Maintainer: M0N7Y5
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=pipeasio
pkgver=1.8.1
pkgrel=1
# Upstream tags use semver prerelease hyphens (v1.0.0-rc1); pkgver maps '-' to '_'.
_pkgtag="v${pkgver//_/-}"
pkgdesc="ASIO driver for Wine that talks directly to PipeWire (no libjack dependency)"
arch=('x86_64')
url="https://github.com/M0n7y5/pipeasio"
license=('GPL-3.0-or-later')
# libpipewire carries the linked libpipewire-0.3.so.0; pipewire is the daemon
# the driver connects to at runtime. yaml-cpp, libarchive and zlib are linked by
# pipeasio-manage, the manager backend the panel runs.
depends=(wine libpipewire pipewire qt6-base hicolor-icon-theme yaml-cpp libarchive zlib)
# mingw-w64-gcc builds the PE front end and the installation probe.
makedepends=(cmake ninja mingw-w64-gcc)
# !lto: winebuild reads symbols from the .o files; LTO bytecode objects break it.
options=('!strip' '!debug' '!lto')
_pkgsrc="${pkgname}-${_pkgtag#v}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${_pkgtag}.tar.gz")
b2sums=('ebf76da912028320c669f7d7b24cf3eb8080943992e8f09625bc1f48c52ee6b0f897da6fb4bf4d1ae0644e0736d975fa63d80e21d0f9fdc7765ccad6e1eeedb1')

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

  # Upstream installs the Wine arch layout, the register helper, the manager
  # backend and its installation probe, the panel, its desktop entry and icon.
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
