# Maintainer: M0N7Y5
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=pipeasio-bin
_pkgname=pipeasio
pkgver=1.8.1
pkgrel=2
# Upstream tags use semver prerelease hyphens (v1.0.0-rc1); pkgver maps '-' to '_'.
_pkgtag="v${pkgver//_/-}"
pkgdesc='PipeWire-native ASIO driver for Wine, with a Qt install and settings manager (prebuilt)'
arch=('x86_64')
url='https://github.com/M0n7y5/pipeasio'
license=('GPL-3.0-or-later')
# pipewire is the daemon the driver connects to at run time. yaml-cpp,
# libarchive and zlib are linked by pipeasio-manage, the manager backend.
# libglvnd: the release build of pipeasio-settings links libGLX and libOpenGL.
depends=(
  'hicolor-icon-theme'
  'libarchive'
  'libgcc'
  'libglvnd'
  'libpipewire'
  'libstdc++'
  'pipewire'
  'qt6-base'
  'wine'
  'yaml-cpp'
  'zlib'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
# !strip: the PE halves are not ELF, and stripping the unixlibs breaks their
# Wine exports. !debug: nothing to split out of a prebuilt tarball.
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${_pkgtag}/${_pkgname}-${_pkgtag}-archlinux-x86_64.tar.gz")
b2sums_x86_64=('6a1a2abd843fdbec902dab9a8e02693e439afd5f4f8776374fac9a1b0a45d25f094dc58990d5e57bfbc6dd86012b496efa1ae8af5cbdb7bb553047a553787528')

package() {
  # The tarball is rooted at the install prefix: bin/, lib/, share/.
  install -dm755 "${pkgdir}/usr"
  cp -a --no-preserve=ownership bin lib share "${pkgdir}/usr/"

  # Records the exact Wine, glibc, PipeWire and MinGW the binaries were built
  # against; the driver may fail to load (c0000135) on an older glibc.
  install -Dm644 BUILD-INFO.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
