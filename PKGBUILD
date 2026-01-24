# Maintainer: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="sysrescueusbwriter"
_pkgname="systemrescue-usbwriter"
pkgname="${_pkgname}-appimage"
pkgver=1.1.0
pkgrel=1
pkgdesc="Tool to write SystemRescue to a USB memory stick"
arch=(
  'x86_64'
)
url="https://gitlab.com/systemrescue/${_pkgname}"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'glibc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
options=(
  '!strip'
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/-/raw/${pkgver}/README.md?ref_type=tags&inline=false"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.AppImage::https://fastly-cdn.system-rescue.org/download/usbwriter/${pkgver}/${_name}-x86_64.AppImage"
  "${_pkgsrc}-x86_64.AppImage.asc::https://fastly-cdn.system-rescue.org/download/usbwriter/${pkgver}/${_name}-x86_64.AppImage.asc"
)
sha512sums=('dae313e88882d43bee05ace02faafe763dccd47f1ae711187609b60454ef7792ef171464f0c9df2142807a0dee66631d8badd3bcea95c6a7366dd95838ba5dae')
sha512sums_x86_64=('d8b705266d1a20e0752aa0ac61d111a15198ba75379d1bcc1bf386603b28358c6d0e37a3105cb04144e585fefdc80d87c6f3797952b502406a71e7becfec9a7c'
                   'SKIP')
validpgpkeys=(
  '0FF11AF081E98345594812037091115F8320B897' # Francois Dupoux 20210704 (Generated on 20210704)
)

prepare() {
  cd "${srcdir}"
  chmod +x "${_pkgsrc}-${CARCH}.AppImage"
  ./"${_pkgsrc}-${CARCH}.AppImage" --appimage-extract > /dev/null
  rm -rf "${_pkgsrc}-${CARCH}"
  mv -f "squashfs-root" "${_pkgsrc}-${CARCH}"
}

# pkgver() {
#   cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/versions"
#   cat "${_name}"
# }

build() {
  cd "${srcdir}"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX "${_pkgsrc}-${CARCH}"/
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}.AppImage" "${pkgdir}/opt/${_name}/${_name}.AppImage"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  install -vDm644 "${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
  install -vDm644 "${_name}.png"     "${pkgdir}/usr/share/pixmaps/${_name}.png"

  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/licenses/${_name}"
  install -vDm644 "GPL-3.0-or-later" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/metainfo"
  install -vDm644 "org.system_rescue.systemrescue_usb_writer.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/org.system_rescue.systemrescue_usb_writer.metainfo.xml"

  install -vdm755 "${pkgdir}/usr/bin"
  ln -vs "/opt/${_name}/${_name}.AppImage" "${pkgdir}/usr/bin/${_name}"
}
