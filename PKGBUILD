# Maintainer: M0N7Y5
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=pipeasio
pkgver=1.8.1
pkgrel=2
# Upstream tags use semver prerelease hyphens (v1.0.0-rc1); pkgver maps '-' to '_'.
_pkgtag="v${pkgver//_/-}"
_pkgsrc="${pkgname}-${_pkgtag#v}"
pkgdesc='PipeWire-native ASIO driver for Wine, with a Qt install and settings manager'
arch=('x86_64')
url='https://github.com/M0n7y5/pipeasio'
license=('GPL-3.0-or-later')
# pipewire is the daemon the driver connects to at run time. yaml-cpp,
# libarchive and zlib are linked by pipeasio-manage, the manager backend.
depends=(
  'hicolor-icon-theme'
  'libarchive'
  'libgcc'
  'libpipewire'
  'libstdc++'
  'pipewire'
  'qt6-base'
  'wine'
  'yaml-cpp'
  'zlib'
)
# mingw-w64-gcc builds the PE front ends and the installation probes.
makedepends=(
  'cmake'
  'mingw-w64-gcc'
  'ninja'
)
# !strip: the PE halves are not ELF, and stripping the unixlibs breaks their
# Wine exports. !debug: nothing is left to split once stripping is off.
# !lto: winebuild reads symbols from the .o files; LTO bytecode breaks it.
options=('!strip' '!debug' '!lto')
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${_pkgtag}.tar.gz")
b2sums=('ebf76da912028320c669f7d7b24cf3eb8080943992e8f09625bc1f48c52ee6b0f897da6fb4bf4d1ae0644e0736d975fa63d80e21d0f9fdc7765ccad6e1eeedb1')

build() {
  local cmake_options=(
    -B build
    -S "${_pkgsrc}"
    -G Ninja
    -Wno-dev
    # Release is the configuration upstream builds and tests its releases in.
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_SETTINGS_PANEL=ON
    # The experimental 32-bit WoW64 front end, as in the release tarball.
    -D BUILD_WOW64_32=ON
    # Off explicitly: these cross-build whenever clang, lld and aarch64 Wine
    # import libraries happen to be installed.
    -D BUILD_ARM64=OFF
    -D BUILD_TESTS=OFF
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_pkgsrc}"/{README,CHANGELOG}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
