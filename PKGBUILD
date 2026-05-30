# Maintainer: Alexander Aleschenko <alex.aleschenko@gmail.com>

pkgname=disk-commander-bin
pkgver=2.6.3
pkgrel=1
pkgdesc="Disk image viewer/editor for retro computers. AppImage release"
arch=('x86_64')
url="https://github.com/Ptr314/dsk_commander"
depends=()
optdepends=('fuse2: mount AppImage without extraction')
options=('!strip')
_appimage="DISK_Commander-${pkgver}-linux-x86_64.AppImage"
source=("${_appimage}::https://github.com/Ptr314/dsk_commander/releases/download/${pkgver}/${_appimage}"
        "shortcut.desktop")
sha256sums=('41b0141b2a52f5f1684832184e31bd8321b334df4d83670b65f4669c5a41204c'
            '5c49d02bb70cba3945ecdffad01f5416be779718a740a4b667df8b87ec1d8ac9')
noextract=("${_appimage}")

prepare() {
  chmod +x "${srcdir}/${_appimage}"
  "${srcdir}/${_appimage}" --appimage-extract
}

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  install -m755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/squashfs-root/3floppy_unmount.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/sh
export DESKTOPINTEGRATION=0
exec /opt/${pkgname}/${_appimage} "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/shortcut.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
