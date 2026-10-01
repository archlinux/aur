pkgname=hamconnect-bin
pkgver=25.12.0
pkgrel=7
pkgdesc='HamConnect is an application that connects your local logger with hamaward.cloud'
arch=('x86_64')
url='https://hamaward.cloud/'
license=('unknown')
depends=('brotli' 'bzip2' 'freetype2' 'glibc' 'harfbuzz'
         'hicolor-icon-theme' 'libgcc' 'libglvnd' 'libstdc++'
         'libx11' 'libxcb' 'zlib')
options=('!strip')
source_x86_64=("HamConnect-${pkgver}-linux.AppImage::https://hamaward.cloud/static/HC/HamConnect-${pkgver}-linux.AppImage")
sha256sums_x86_64=('293f0fd67cc6c3cfc6dffa9d80201d237d9a5eef8b6e0052574c98dab7fae44a')

prepare() {
  chmod +x "${srcdir}/HamConnect-${pkgver}-linux.AppImage"
  "${srcdir}/HamConnect-${pkgver}-linux.AppImage" --appimage-extract
}

package() {
  install -dm755 "${pkgdir}/opt/hamconnect"
  cp -a squashfs-root/. "${pkgdir}/opt/hamconnect/"
  rm "${pkgdir}/opt/hamconnect/HamConnect-${pkgver}-x86_64.AppImage"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/hamconnect/AppRun "${pkgdir}/usr/bin/hamconnect"

  install -Dm644 squashfs-root/appicon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/hamconnect.png"
  install -dm755 "${pkgdir}/usr/share/applications"
  sed -e 's|^Exec=.*|Exec=sh -c "exec hamconnect >/dev/null 2>\&1"|' \
      -e 's|^Icon=.*|Icon=hamconnect|' \
      -e 's|^Terminal=.*|Terminal=false|' \
      -e '/^X-AppImage-/d' \
      squashfs-root/HamConnect.desktop > "${pkgdir}/usr/share/applications/hamconnect.desktop"
}