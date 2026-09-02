# Maintainer: wundervrc <wunderburst@gmail.com>

## Credits — this package ships other people's work:
##   CachyOS Proton   https://github.com/CachyOS/proton-cachyos
##   Proton-RTSP      https://github.com/SpookySkeletons/proton-rtsp
##   RTSP patchset    Torge / Reyka Matthies (openglfreak)
##   Proton / Wine    Valve, CodeWeavers, the Wine project

pkgdesc='CachyOS Proton with the Proton-RTSP patchset, for VRChat livestream (RTSP/VRCDN) playback'
_pkgname=proton-cachyos-rtsp
pkgname=${_pkgname}-bin
pkgver=11.0_20260703
pkgrel=1
arch=('x86_64')
url='https://github.com/wundervrc/proton-cachyos-rtsp'
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
provides=('proton' "${_pkgname}=${pkgver/_/.}")
conflicts=("${_pkgname}")

## SLR build (runs inside Steam Linux Runtime 4.0), so this list is conservative
## rather than minimal -- mirrors proton-rtsp-bin. All from official repos, no AUR deps.
depends=('python'
  'vulkan-icd-loader'
  'lib32-vkd3d'
  # libav support
  'lib32-libva'
  'lib32-libtheora'
  'lib32-libvdpau'
  # gstreamer support
  'gst-plugins-bad-libs'
  'libjpeg-turbo'
  'graphene'
  'lib32-libjpeg-turbo'
  'lib32-libgudev'
  # other
  'lib32-openssl'
  'lib32-libusb')

optdepends=('steam: use proton with steam like intended'
  'lib32-vulkan-icd-loader: dxvk dependency for 32bit prefixes'
  'vulkan-driver: driver to be used by dxvk'
  'winetricks: protonfixes backend - highly recommended'
  'wine: support for 32bit prefixes'
  'kdialog: KDE splash dialog support'
  'zenity: GNOME splash dialog support')

## Proton ships prebuilt PE/ELF binaries; stripping them breaks the build.
options=(!strip emptydirs)

_srcdir=${_pkgname}-${pkgver//_/-}-${pkgrel}
_protondir=usr/share/steam/compatibilitytools.d/${_pkgname}
_licensedir=usr/share/licenses/${pkgname}

source=("${_srcdir}.tar.xz::${url}/releases/download/${_srcdir}/${_srcdir}.tar.xz")
sha512sums=('f5be7df016f258425e6674b2650b33918da321c9ba6e44a42658789fc15e68794952bfc8396345311664d6f90fd524dd1844bc1d0d3bd29958b4a4ee5e0efa47')

package() {
  install -d "${pkgdir}/${_protondir}"
  install -d "${pkgdir}/${_licensedir}"

  ## licenses
  mv "${_srcdir}/LICENSE"      "${pkgdir}/${_licensedir}/license"
  mv "${_srcdir}/LICENSE.OFL"  "${pkgdir}/${_licensedir}/license_OFL"
  mv "${_srcdir}/PATENTS.AV1"  "${pkgdir}/${_licensedir}/license_AV1"

  ## the build itself
  mv "${_srcdir}"/* "${pkgdir}/${_protondir}/"
}
