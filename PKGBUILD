# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="sysrescueusbwriter"
_pkgname="systemrescue-usbwriter"
pkgname="${_pkgname}-git"
pkgver=1.0.2.r4.g82bb482
pkgrel=2
pkgdesc="Tool to write SystemRescue to a USB memory stick"
arch=('any')
url="https://gitlab.com/systemrescue/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('bash' 'dialog' 'fuse2' 'isomd5sum' 'libisoburn' 'syslinux')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgsrc}/AppDirSrc/usr/bin"
  sed -e 's/${APPDIR}//g' \
      -e 's|$("${BINDIR}/cat" "/usr/share/versions/sysrescueusbwriter")|'"${pkgver}|g" \
      -e 's|$("${BINDIR}/cat" "/usr/share/versions/sysrescueusbwriter-builddate")|'"$(date +%Y-%m-%d)|g" \
      -e 's@$("${BINDIR}/cat" "/usr/share/versions/syslinux")@$(pacman -Q syslinux | sed -e "s#syslinux \\(.*\\)#\\1#")@g' \
      -i "${_name}"
      # -e '1i#!/bin/bash' \
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  
  cd "AppDirSrc/usr"
  find "bin" -type f -exec install -vDm755 "{}" "${pkgdir}/usr/{}" \;

  cd "share"
  find "applications" "metainfo" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/{}" \;

  cd "icons/hicolor/64x64/apps"
  install -vDm644 "${_name}.png" "${pkgdir}/usr/share/pixmaps/${_name}.png"
}
