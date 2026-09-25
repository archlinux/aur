# Maintainer: M0N7Y5
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=pipeasio-git
_pkgname=pipeasio
pkgver=1.8.1.r1.ga2bce56
pkgrel=2
pkgdesc='PipeWire-native ASIO driver for Wine, with a Qt install and settings manager (git master)'
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
  'git'
  'mingw-w64-gcc'
  'ninja'
)
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
# !strip: the PE halves are not ELF, and stripping the unixlibs breaks their
# Wine exports. !debug: nothing is left to split once stripping is off.
# !lto: winebuild reads symbols from the .o files; LTO bytecode breaks it.
options=('!strip' '!debug' '!lto')
source=("${_pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --abbrev=7 --tags 2>/dev/null \
    | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g' \
    || printf '0.r%s.g%s' "$(git -C "${_pkgname}" rev-list --count HEAD)" \
      "$(git -C "${_pkgname}" rev-parse --short=7 HEAD)"
}

build() {
  local cmake_options=(
    -B build
    -S "${_pkgname}"
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
  install -Dm644 "${_pkgname}"/{README,CHANGELOG}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
