# Maintainer: M0N7Y5
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=pipeasio
pkgver=1.2.1
pkgrel=1
# Upstream tags use semver prerelease hyphens (v1.0.0-rc1); pkgver maps '-' to '_'.
_pkgtag="v${pkgver//_/-}"
pkgdesc="ASIO driver for Wine that talks directly to PipeWire (no libjack dependency)"
arch=('x86_64')
url="https://github.com/M0n7y5/pipeasio"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=(wine pipewire qt6-base hicolor-icon-theme)
makedepends=(cmake ninja)
# !lto: winebuild reads symbols from the .o files; LTO bytecode objects break it.
options=('!strip' '!debug' '!lto')
_pkgsrc="${pkgname}-${_pkgtag#v}"
# Desktop entry + icon are local sources until the next upstream release;
# master installs them via CMake (gui/pipeasio-settings.desktop, docs/icon.svg)
# so they can be dropped from here at the next pkgver bump.
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${_pkgtag}.tar.gz"
        "pipeasio-settings.desktop"
        "pipeasio.svg")
b2sums=('467a1e4afa9902a3b5fa749aa078749ab82bd41ecfc14d1388f80b32404366b15e1fee29187bb1f48770700b25f5ef0d245c4b6f0252f91dce112eb2ef835720'
        'f39b3eaaaf0dadb3920fb3133fcd6936ced4fa42a14962e32b3acf1c2f7fde61f1321bab86b1ff21595152c9369e5393c60f82e1a3b445fc7c20a1de47d08757'
        'ca65da2d37c6a301e651b2acdf227afb549a13c1decc335c7dfd1103272824f4a87a50af736c2d94db2603bee86523ba5fcb2688e32f0a8d559fda30d023bee1')

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

  install -Dm644 "${srcdir}/pipeasio-settings.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/pipeasio.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pipeasio.svg"

  # rc1 ships COPYING.LIB/COPYING.GUI; master relicensed to GPL-3.0-or-later
  # with a single COPYING. Install whichever exist so version bumps don't break.
  local _license
  for _license in COPYING COPYING.LIB COPYING.GUI; do
    [[ -f "${_license}" ]] && install -Dm644 "${_license}" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  done
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
