# Maintainer: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="sysrescueusbwriter"
_pkgname="systemrescue-usbwriter"
pkgname="${_pkgname}-appimage"
pkgver=1.0.2
pkgrel=4
pkgdesc="Tool to write SystemRescue to a USB memory stick"
arch=('x86_64')
url="https://gitlab.com/systemrescue/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('fuse2' 'glibc' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_name}-${pkgver}"
source=("README-${pkgver}.md::${url}/-/raw/${pkgver}/README.md?ref_type=tags&inline=false")
source_x86_64=("${_pkgsrc}-x86_64.AppImage::https://fastly-cdn.system-rescue.org/download/usbwriter/${pkgver}/${_name}-x86_64.AppImage"
               "${_pkgsrc}-x86_64.AppImage.asc::https://fastly-cdn.system-rescue.org/download/usbwriter/${pkgver}/${_name}-x86_64.AppImage.asc")
sha512sums=('8cb01264048d83973be047fd36dea3519f63c7d91c9ca600b100a82746adae046afcfd61acd9986915d0111697e11cb5c5c95dbbf06d38206e8c6f800b0aaff2')
sha512sums_x86_64=('833e08858feaf6b874f2642421843b3996878f34141f4606d911e6f9fec9e6a5ab7afc943a45799d907efdb50a114d1e8dffdcf4a38f1e7c2b9da58fd7268f1f'
                   'SKIP')
validpgpkeys=('0FF11AF081E98345594812037091115F8320B897') # Francois Dupoux 20210704 (Generated on 20210704)
options=('!strip')

prepare() {
  cd "${srcdir}"
  rm -rf "${_pkgsrc}-${CARCH}"
  mkdir -p "${_pkgsrc}-${CARCH}"

  chmod +x "${_pkgsrc}-${CARCH}.AppImage"
  ./"${_pkgsrc}-${CARCH}.AppImage" --appimage-extract > /dev/null

  mv -f "squashfs-root"/* "${_pkgsrc}-${CARCH}"
  rm -rf "squashfs-root"
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/versions"
  cat "${_name}"
}

build() {
  cd "${srcdir}"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX "${_pkgsrc}-${CARCH}"/
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}.AppImage" "${pkgdir}/opt/${_name}/${_name}.AppImage"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

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
