# Maintainer: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="sysrescueusbwriter"
_pkgname="systemrescue-usbwriter"
pkgname="${_pkgname}-appimage"
pkgver=1.1.1
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
sha512sums=('31d9d38133dc5b9b2efb6ac8ca2ad043327f61b2cfea43252ce177e0b892eaa90bd7f2c657f392052113652290737a0a476bba4327af935e8dbe62055c1b5320')
sha512sums_x86_64=('1671b7fd052f7e96800822bc24bb485a90dce700fa6625bcd53797f904f618ea675ecad10d18ba9af0524e21199b6943240d825dcd1a1f25bbe656f9018bd677'
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
