# Maintainer: M0N7Y5
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=pipeasio
pkgver=1.0.0_rc1
pkgrel=1
# Upstream tags use semver prerelease hyphens (v1.0.0-rc1); pkgver maps '-' to '_'.
_pkgtag="v${pkgver//_/-}"
pkgdesc="ASIO driver for Wine that talks directly to PipeWire (no libjack dependency)"
arch=('x86_64')
url="https://github.com/M0n7y5/pipeasio"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=(wine pipewire qt6-base)
makedepends=(cmake ninja)
# !lto: winebuild reads symbols from the .o files; LTO bytecode objects break it.
options=('!strip' '!debug' '!lto')
_pkgsrc="${pkgname}-${_pkgtag#v}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${_pkgtag}.tar.gz")
b2sums=('cff1a68105d255718b1a0c5567d970af5b07eda0946eb49cdf0fffca1421993cbbf8e5ae02b3faba34e6716e21485bfef32b4f6443a178856f1d62df5a4a7820')

build() {
  cd "${srcdir}/${_pkgsrc}"
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SETTINGS_PANEL=ON \
    -DBUILD_TESTS=OFF
  cmake --build build
}

package() {
  cd "${srcdir}/${_pkgsrc}"

  # Wine arch layout; the unified-name symlinks satisfy Wine 10+ lookup.
  install -Dm644 build/pipeasio64.dll -t "${pkgdir}/usr/lib/wine/x86_64-windows"
  install -Dm755 build/pipeasio64.dll.so -t "${pkgdir}/usr/lib/wine/x86_64-unix"
  ln -s pipeasio64.dll "${pkgdir}/usr/lib/wine/x86_64-windows/pipeasio.dll"
  ln -s pipeasio64.dll.so "${pkgdir}/usr/lib/wine/x86_64-unix/pipeasio.dll.so"

  install -Dm755 pipeasio-register -t "${pkgdir}/usr/bin"
  install -Dm755 build/gui/pipeasio-settings -t "${pkgdir}/usr/bin"

  # rc1 ships COPYING.LIB/COPYING.GUI; master relicensed to GPL-3.0-or-later
  # with a single COPYING. Install whichever exist so version bumps don't break.
  local _license
  for _license in COPYING COPYING.LIB COPYING.GUI; do
    [[ -f "${_license}" ]] && install -Dm644 "${_license}" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  done
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
