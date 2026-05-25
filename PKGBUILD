# Maintainer: KOWX712 <leecc0503@gmail.com>

pkgname=visual2-bin
pkgver=1.7.0
pkgrel=1
pkgdesc='User-friendly Educational Assembler and Simulator for ARM UAL'
arch=('x86_64')
url='https://github.com/scc416/Visual2'
license=('MIT')
depends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("VisUAL2.${pkgver}.AppImage::https://github.com/scc416/Visual2/releases/download/${pkgver}/VisUAL2.${pkgver}.AppImage")
sha256sums=('cb9ed95eae76c8f71636db642642f58f0b4f8d5a66cfa661f0222e1ea71e424a')

package() {
  cd "${srcdir}"

  # Extract the AppImage
  chmod +x "VisUAL2.${pkgver}.AppImage"
  "./VisUAL2.${pkgver}.AppImage" --appimage-extract > /dev/null

  # Install main binary
  install -Dm755 squashfs-root/visual "${pkgdir}/usr/lib/visual2/visual"

  # Install Electron resources
  cp -r squashfs-root/resources "${pkgdir}/usr/lib/visual2/"
  cp -r squashfs-root/locales "${pkgdir}/usr/lib/visual2/"
  for f in icudtl.dat natives_blob.bin snapshot_blob.bin resources.pak \
           chrome_100_percent.pak chrome_200_percent.pak v8_context_snapshot.bin; do
    install -Dm644 "squashfs-root/$f" "${pkgdir}/usr/lib/visual2/$f"
  done

  # Install bundled libraries
  install -Dm755 squashfs-root/libEGL.so "${pkgdir}/usr/lib/visual2/libEGL.so"
  install -Dm755 squashfs-root/libGLESv2.so "${pkgdir}/usr/lib/visual2/libGLESv2.so"
  install -Dm755 squashfs-root/libffmpeg.so "${pkgdir}/usr/lib/visual2/libffmpeg.so"
  install -Dm755 squashfs-root/libVkICD_mock_icd.so "${pkgdir}/usr/lib/visual2/libVkICD_mock_icd.so"

  # Install swiftshader libraries
  install -d "${pkgdir}/usr/lib/visual2/swiftshader"
  install -m755 squashfs-root/swiftshader/libEGL.so "${pkgdir}/usr/lib/visual2/swiftshader/libEGL.so"
  install -m755 squashfs-root/swiftshader/libGLESv2.so "${pkgdir}/usr/lib/visual2/swiftshader/libGLESv2.so"

  # Install bundled system libraries
  for lib in libappindicator.so.1 libgconf-2.so.4 libindicator.so.7 \
             libnotify.so.4 libXss.so.1 libXtst.so.6; do
    install -Dm755 "squashfs-root/usr/lib/$lib" "${pkgdir}/usr/lib/visual2/$lib"
  done

  # Create wrapper script
  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/visual2" << 'WRAPPER'
#!/bin/sh
export LD_LIBRARY_PATH="/usr/lib/visual2${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
exec /usr/lib/visual2/visual "$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/visual2"

  # Install desktop file with corrected paths
  install -d "${pkgdir}/usr/share/applications"
  sed 's|Exec=AppRun|Exec=visual2|; s|Icon=visual|Icon=visual2|' \
    squashfs-root/visual.desktop > "${pkgdir}/usr/share/applications/visual2.desktop"

  # Install icons (renamed from visual -> visual2 for namespace)
  for size in 16 24 32 48 64 96 128 256; do
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/visual.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/visual2.png"
  done
}
