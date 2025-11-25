# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: ZachAR3 <Zach4R3@gmail.com>

_pkgname=Eden
pkgname="eden-preview-bin"
pkgver=0.0.4_rc
_upstreamver=v0.0.4-rc3 # private var used for download URL since "-" isn't valid in pkgver
pkgrel=3
pkgdesc="The Eden Nintendo Switch emulator AppImage for preview builds such as release candiates using the amd64-gcc-standard version."
arch=('x86_64')
url="https://git.eden-emu.dev/eden-emu/eden"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${_pkgname}-Linux-${pkgver}-amd64.AppImage"
source_x86_64=("${_appimage}::https://github.com/eden-emulator/Releases/releases/download/${_upstreamver}/${_pkgname}-Linux-${_upstreamver}-amd64-gcc-standard.AppImage")
sha256sums_x86_64=("1beb1316dc3c7153bf563d5a4924b4ed4cba1905e8403b9fadbbe8b24cfd72a8")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

# Fix .desktop file executable and icon
build() {
  sed -i \
    -e "s|^Exec=.*|Exec=/usr/bin/eden-preview|" \
    -e "s|^Icon=.*|Icon=eden-preview|" \
    -e "s|^TryExec=.*|TryExec=eden-preview|" \
    -e "s|^Name=.*|Name=Eden Preview|" \
    "squashfs-root/dev.eden_emu.eden.desktop"
}

package() {
    # Create the MIME type XML file (for file associations)
    cat > eden-preview.xml << EOF
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

  install -Dm644 eden-preview.xml "${pkgdir}/usr/share/mime/packages/eden-preview.xml"

  install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -Dm644 "squashfs-root/dev.eden_emu.eden.desktop" \
    "${pkgdir}/usr/share/applications/eden-preview.desktop"

  # copy icon
  install -Dm644 "squashfs-root/dev.eden_emu.eden.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/eden-preview.svg"

  install -dm755 "${pkgdir}/usr/bin"

  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/eden-preview"
}

# Update mime database for file associations
post_install() {
  update-mime-database /usr/share/mime || true
}

