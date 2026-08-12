# Maintainer: M0N7Y5
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=pipeasio-bin
pkgver=1.4.3
pkgrel=1
# Upstream tags use semver prerelease hyphens (v1.0.0-rc1); pkgver maps '-' to '_'.
_pkgtag="v${pkgver//_/-}"
pkgdesc="ASIO driver for Wine that talks directly to PipeWire (no libjack dependency) (official prebuilt binaries)"
arch=('x86_64')
url="https://github.com/M0n7y5/pipeasio"
license=('GPL-3.0-or-later')
depends=(wine libpipewire pipewire qt6-base hicolor-icon-theme)
provides=("pipeasio=${pkgver}")
conflicts=(pipeasio)
# !strip: the PE halves are not ELF, and stripping the .so halves breaks the
# Wine unixlib exports. !debug: nothing to split out of a prebuilt tarball.
options=('!strip' '!debug')
# The release tarball ships no licence text, so take it from the same tag.
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${_pkgtag}/pipeasio-${_pkgtag}-archlinux-x86_64.tar.gz"
        "${pkgname}-${pkgver}-COPYING::${url}/raw/${_pkgtag}/COPYING")
noextract=()
b2sums=('422e60991e5fa765eab904c72e0d53d45fa49122e5e90146adb7527ba7d07ff92a07e4f8aafc5060a115c132e45963ad1c550f8e526110b9fff6abe5574aa0d0'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')

package() {
  cd "${srcdir}"

  # The tarball is rooted at the install prefix: bin/, lib/, share/.
  # cp -a keeps the pipeasio.dll / pipeasio.dll.so symlinks Wine 10+ looks up.
  install -dm755 "${pkgdir}/usr"
  cp -a --no-preserve=ownership bin lib share "${pkgdir}/usr/"

  install -Dm644 "${pkgname}-${pkgver}-COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Records the exact Wine, glibc, PipeWire and MinGW the binaries were built
  # against; the driver may fail to load (c0000135) on an older glibc.
  install -Dm644 BUILD-INFO.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
