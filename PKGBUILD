# Maintainer: dec05eba <dec05eba@protonmail.com>
# Based on proton-ge-custom-bin from the AUR

pkgname=proton-ge-phoenix-bin
pkgver=GE_Proton11_11
pkgrel=1
pkgdesc='GE-Proton with vkd3d-proton patched for HDR on X11'
arch=('x86_64')
url='https://github.com/dec05eba/vkd3d-proton/tree/x11-30-bit'
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
depends=('python')
optdepends=(
  'vk-hdr-layer-phoenix: HDR in games on X11'
  'xorg-server-phoenix: HDR on X11'
  'steam: use proton with steam like intended'
  'vulkan-driver: driver to be used by dxvk and vkd3d-proton'
  'lib32-vulkan-icd-loader: dxvk dependency for 32bit prefixes'
  'winetricks: protonfixes backend'
)
options=(!strip emptydirs)
install=proton-ge-phoenix.install

_gever=${pkgver//_/-}
_srcdir=${_gever}-x86_64
_vkd3dver=ge-proton11-11-x11-30-bit
_protondir=usr/share/steam/compatibilitytools.d/proton-ge-phoenix
_licensedir=usr/share/licenses/${pkgname}

source=(
  "${_gever}-x86_64.tar.gz::https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${_gever}/${_gever}-x86_64.tar.gz"
  "vkd3d-proton-${_vkd3dver}.tar.zst::https://github.com/dec05eba/vkd3d-proton/releases/download/${_vkd3dver}/vkd3d-proton-${_vkd3dver}.tar.zst"
)
sha512sums=(
  '45721a7b625b2404d8896bb5e2a8b87fc9623a394873a6dd6b900c839681d5c01ec694ca00d003fc9c733c5f6c5648af8171985656f9fa47e20999fbebdbe235'
  '8cd4eda0a0c1914276857d7e1d9442153f5f4f5988ddc089ccdf50f32371a72da57b11fa4e4df0161c751d7e9629f21aec1805c60ed578cb8d1ae650e9fff99e'
)

prepare() {
  local vkd3d_dir="${srcdir}/vkd3d-proton-${_vkd3dver}"
  local wine_dir="${srcdir}/${_srcdir}/files/lib/wine/vkd3d-proton"

  install -m755 "${vkd3d_dir}"/x64/d3d12{,core}.dll "${wine_dir}/x86_64-windows/"
  install -m755 "${vkd3d_dir}"/x86/d3d12{,core}.dll "${wine_dir}/i386-windows/"

  sed -i -r 's|"GE-Proton[^"]*"|"Proton-GE Phoenix"|g' "${srcdir}/${_srcdir}/compatibilitytool.vdf"
}

package() {
  install -d "${pkgdir}/${_protondir}" "${pkgdir}/${_licensedir}"

  install -m644 "${srcdir}/${_srcdir}/LICENSE" "${pkgdir}/${_licensedir}/license"
  install -m644 "${srcdir}/${_srcdir}/LICENSE.OFL" "${pkgdir}/${_licensedir}/license_OFL"
  install -m644 "${srcdir}/${_srcdir}/PATENTS.AV1" "${pkgdir}/${_licensedir}/license_AV1"

  cp -a "${srcdir}/${_srcdir}/." "${pkgdir}/${_protondir}/"
}
