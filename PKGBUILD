# Maintainer: insmtr <insmtr@insmtr.cn>
pkgname=kortix-desktop
pkgver=0.14.5
pkgrel=1
pkgdesc='Kortix desktop application (official binary)'
arch=('x86_64')
url='https://kortix.com'
license=('Elastic-2.0')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs'
         'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxrandr' 'mesa' 'nspr' 'nss' 'pango')
optdepends=('xdg-utils: desktop integration')
options=('!strip' '!debug')
_image="Kortix-${pkgver}-x86_64.AppImage"
source=("https://github.com/kortix-ai/suna/releases/download/v${pkgver}/${_image}"
        "kortix-desktop"
        "LICENSE::https://raw.githubusercontent.com/kortix-ai/suna/v${pkgver}/LICENSE")
noextract=("${_image}")
sha256sums=('631304ade22226375c507e18427414da829f0dcd7bea734035bee90566ec805e'
            '405657a88ad27df88d5710e3024e68fe663081e063b8f79dc2f0072fcabe78d0'
            '48255018b41fc0e965b1115af7e6779bc218bb8a6747d561da800d5022622aa2')

prepare() {
  chmod +x "${_image}"
  "./${_image}" --appimage-extract
}

package() {
  cd squashfs-root
  install -dm755 "${pkgdir}/opt/kortix-desktop"
  cp -a . "${pkgdir}/opt/kortix-desktop/"
  find "${pkgdir}/opt/kortix-desktop" -type d -exec chmod 755 {} +

  # Use Chromium's setuid sandbox, never --no-sandbox.
  chmod 4755 "${pkgdir}/opt/kortix-desktop/chrome-sandbox"

  # AppRun's APPDIR autodetection mistakes a URL argument for a file path.
  # Set APPDIR explicitly and preserve every argument.
  install -Dm755 "${srcdir}/kortix-desktop" "${pkgdir}/usr/bin/kortix-desktop"

  install -Dm644 "@kortixdesktop-electron.desktop" "${pkgdir}/usr/share/applications/kortix-desktop.desktop"
  sed -i -E \
    -e 's|^Exec=.*|Exec=/usr/bin/kortix-desktop %U|' \
    -e 's|^Icon=.*|Icon=kortix-desktop|' \
    "${pkgdir}/usr/share/applications/kortix-desktop.desktop"

  # electron-builder places the application icon at the AppDir root.
  install -Dm644 "@kortixdesktop-electron.png" "${pkgdir}/usr/share/pixmaps/kortix-desktop.png"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
