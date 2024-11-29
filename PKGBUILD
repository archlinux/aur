# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=digitalclock5
_pkgname=DigitalClock5
pkgver=5.0.4
pkgrel=1
pkgdesc="A modern digital clock application"
arch=('x86_64')
url="https://github.com/Kolcha/DigitalClock5"
license=('GPL3')
depends=('qt6-base' 'ninja' 'cmake')
makedepends=('git')
source=("git+https://github.com/Kolcha/DigitalClock5.git#tag=${pkgver}" digitalclock5.desktop)
sha256sums=('ab17b51ffdef57de7927a0f103aef012e9b1171a4efd3024512a846de9d190e8'
            '353cab3b079779c5ad3255fe3ffae21c28f4140e1e1c92f5b1c860c6f06e24e8')

prepare() {
  # Initialize submodules
  git -C "${_pkgname}" submodule init

  # Update the submodules and ensure they are pulled from the correct branches
  git -C "${_pkgname}" -c protocol.file.allow='always' submodule update

  # (Optional) Configure submodules explicitly if needed
  git -C "${_pkgname}" config --local "submodule.third_party/GradientDialog.url" "https://github.com/Kolcha/GradientDialog.git"
  git -C "${_pkgname}" config --local "submodule.third_party/paletteicon.url" "https://github.com/Kolcha/paletteicon.git"
  git -C "${_pkgname}" config --local "submodule.third_party/QHotkey.url" "https://github.com/Skycoder42/QHotkey.git"

  # Pull the latest changes for the submodules (in case you need the latest updates)
  git -C "${_pkgname}" submodule update --remote
}

build() {
  cd "${_pkgname}"
  cmake \
    -B build \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr/share/digitalclock5
  cmake --build build --target update_translations
  cmake --build build

}

package() {
  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 digitalclock5.desktop "${pkgdir}/usr/share/applications/"
  cd "${_pkgname}"

  cmake --install build --prefix="${pkgdir}/usr" #does nothing
  install -dm755 "${pkgdir}/usr/share/digitalclock5"
  cp -r app/res "${pkgdir}/usr/share/digitalclock5/"
  cp -r build/skins "${pkgdir}/usr/share/digitalclock5/"
  cp -r build/textures "${pkgdir}/usr/share/digitalclock5/"

  install -dm755 "${pkgdir}/usr/share/digitalclock5/plugins"
  cp -r build/plugins/* "${pkgdir}/usr/share/digitalclock5/plugins/"
  #
  # Install shared libraries
  install -Dm755 "${srcdir}/src/DigitalClock5/build/3rdparty/paletteicon/libpaletteicon.so" \
    "${pkgdir}/usr/share/digitalclock5/libpaletteicon.so"
  install -Dm755 "${srcdir}/src/DigitalClock5/build/clock_common/libClockCommon.so" \
    "${pkgdir}/usr/share/digitalclock5/libClockCommon.so"
  install -Dm755 "${srcdir}/src/DigitalClock5/build/plugin_core/libPluginCore.so" \
    "${pkgdir}/usr/share/digitalclock5/libPluginCore.so"
  install -Dm755 "${srcdir}/src/DigitalClock5/build/skin_engine/libSkinEngine.so" \
    "${pkgdir}/usr/share/digitalclock5/libSkinEngine.so"

  install -Dm755 "build/app/${_pkgname}" "${pkgdir}/usr/bin/digitalclock5"
  install -Dm644 "app/res/icons/clock.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/digitalclock5.svg"
}
# vim:set ts=2 sw=2 et:
