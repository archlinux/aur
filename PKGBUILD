# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: ZachAR3 <Zach4R3@gmail.com>

_pkgname=Eden
pkgname="eden-bin"
pkgver=0.0.3
pkgrel=1
pkgdesc="The Eden Nintendo Switch emulator AppImage."
arch=('x86_64')
url="https://git.eden-emu.dev/eden-emu/eden"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${_pkgname}-Linux-${pkgver}-amd64.AppImage"
source_x86_64=("${_appimage}::https://github.com/eden-emulator/Releases/releases/download/v${pkgver}/${_pkgname}-Linux-v${pkgver}-amd64.AppImage")
sha256sums_x86_64=("3f6432d55752bca5ef3cd24acf32332f132e992e4143bf5b382d054e0147322c")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

# Fix .desktop file executable and icon
build() {
  sed -i \
    -e "s|^Exec=.*|Exec=/usr/bin/eden|" \
    -e "s|^Icon=.*|Icon=eden|" \
    -e "s|^TryExec=.*|TryExec=eden|" \
    -e "s|^Name=.*|Name=Eden|" \
    "squashfs-root/dev.eden_emu.eden.desktop"
}

package() {
    # Create the MIME type XML file (for file associations)
    cat > eden.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-nx-nro">
    <comment>Nintendo Switch NRO Executable</comment>
    <glob pattern="*.nro"/>
  </mime-type>
  <mime-type type="application/x-nx-nso">
    <comment>Nintendo Switch NSO Executable</comment>
    <glob pattern="*.nso"/>
  </mime-type>
  <mime-type type="application/x-nx-nsp">
    <comment>Nintendo Switch NSP Package</comment>
    <glob pattern="*.nsp"/>
  </mime-type>
  <mime-type type="application/x-nx-xci">
    <comment>Nintendo Switch XCI Cartridge Image</comment>
    <glob pattern="*.xci"/>
  </mime-type>
</mime-info>
EOF

  install -Dm644 eden.xml "${pkgdir}/usr/share/mime/packages/eden.xml"

  install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -Dm644 "squashfs-root/dev.eden_emu.eden.desktop" \
    "${pkgdir}/usr/share/applications/eden.desktop"

  # copy icon
  install -Dm644 "squashfs-root/dev.eden_emu.eden.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/eden.svg"

  install -dm755 "${pkgdir}/usr/bin"

  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/eden"
}

# Update mime database for file associations
post_install() {
  update-mime-database /usr/share/mime || true
}
