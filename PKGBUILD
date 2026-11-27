# Maintainer: shbernal <shbernal.01@gmail.com>
# Issues and fixes: https://github.com/shbernal/aur-packages

_pkgname=kitty
pkgname=${_pkgname}-nightly-bin
pkgver=0.51.1.r202611262153.g1249898
pkgrel=1
pkgdesc='A modern, hackable, featureful, OpenGL-based terminal emulator (official nightly build)'
arch=('x86_64' 'aarch64')
url='https://sw.kovidgoyal.net/kitty/'
license=('GPL-3.0-only')
depends=('dbus' 'fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libgl' 'libx11' 'libxcb'
         'libxcursor' 'ncurses' 'util-linux-libs')
provides=("${_pkgname}=${pkgver}" "${_pkgname}-terminfo=${pkgver}" "${_pkgname}-shell-integration=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-terminfo" "${_pkgname}-shell-integration")
# Self-contained upstream bundle with its own Python and libraries
options=('!strip' '!debug')

# The nightly release is rebuilt in place under fixed names, so there is no stable
# checksum. Kovid Goyal's signature verifies the download instead, and the local
# names carry pkgver so a cached tarball from an older nightly is never reused.
_nightly=https://github.com/kovidgoyal/${_pkgname}/releases/download/nightly
source_x86_64=("${pkgname}-${pkgver}-x86_64.txz::${_nightly}/${_pkgname}-nightly-x86_64.txz"
               "${pkgname}-${pkgver}-x86_64.txz.sig::${_nightly}/${_pkgname}-nightly-x86_64.txz.sig")
source_aarch64=("${pkgname}-${pkgver}-aarch64.txz::${_nightly}/${_pkgname}-nightly-arm64.txz"
                "${pkgname}-${pkgver}-aarch64.txz.sig::${_nightly}/${_pkgname}-nightly-arm64.txz.sig")
sha256sums_x86_64=('SKIP' 'SKIP')
sha256sums_aarch64=('SKIP' 'SKIP')
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C') # Kovid Goyal
noextract=("${pkgname}-${pkgver}-${CARCH}.txz")

prepare() {
  rm -rf bundle
  mkdir bundle
  bsdtar -xf "${pkgname}-${pkgver}-${CARCH}.txz" -C bundle
}

package() {
  local opt=/opt/${pkgname}
  install -d "${pkgdir}${opt}" "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${_pkgname}"
  cp -a bundle/. "${pkgdir}${opt}/"

  ln -s "${opt}/bin/kitty" "${pkgdir}/usr/bin/kitty"
  ln -s "${opt}/bin/kitten" "${pkgdir}/usr/bin/kitten"
  ln -s "${opt}/lib/kitty/shell-integration" "${pkgdir}/usr/lib/${_pkgname}/shell-integration"

  # The HTML docs stay in the bundle, which opens them from there.
  install -d "${pkgdir}/usr/share"
  mv "${pkgdir}${opt}"/share/{applications,icons,man,terminfo} "${pkgdir}/usr/share/"
}
