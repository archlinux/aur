# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="sysrescueusbwriter"
pkgname="systemrescue-usbwriter"
pkgver=1.0.2
pkgrel=3
pkgdesc="Tool to write SystemRescue to a USB memory stick"
arch=('any')
url="https://gitlab.com/systemrescue/${pkgname}"
license=('GPL-3.0-or-later')
depends=('bash' 'fuse2' 'isomd5sum' 'libisoburn' 'syslinux')
optdepends=('dialog: for TUI operation (always pass -c|--cli if not desired)'
            'sudo: for privilege elevation (preferred)'
            'polkit: for privilege elevation'
            'less: for viewing license information with -l|--licenses'
            'nnn: for viewing license information with -l|--licenses')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/-/archive/${pkgver}/${_pkgsrc}.tar.gz"
        "${pkgname}_no_appimage.patch")
sha256sums=('b2decf6ae54d4cefd3234fe015a1fb668bcbd958079a43eeab178c5fa8d4a562'
            '505cde7c224cee62cbb71c40771c6ed5ea0b337719435a568d67c42fd81161ff')

build() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_no_appimage.patch"

  cd "AppDirSrc/usr/bin"
  sed -e 's/${APPDIR}//g' \
      -e 's|$("${BINDIR}/cat" "/usr/share/versions/sysrescueusbwriter")|'"${pkgver}|g" \
      -e 's|$("${BINDIR}/cat" "/usr/share/versions/sysrescueusbwriter-builddate")|'"$(date +%Y-%m-%d)|g" \
      -e 's@$("${BINDIR}/cat" "/usr/share/versions/syslinux")@$(pacman -Q syslinux | sed -e "s#syslinux \\(.*\\)#\\1#")@g' \
      -i "${_name}"
      # -e '1i#!/bin/bash' \
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  cd "AppDirSrc/usr"
  find "bin" -type f -exec install -vDm755 "{}" "${pkgdir}/usr/{}" \;

  cd "share"
  find "applications" "metainfo" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/{}" \;

  cd "icons/hicolor/64x64/apps"
  install -vDm644 "${_name}.png" "${pkgdir}/usr/share/pixmaps/${_name}.png"
}
