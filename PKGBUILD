# Maintainer: Argos Releases <releases@thothlab.tech>
#
# Generated from packaging/aur/argos-bin/PKGBUILD.template by
# .github/workflows/release-aur.yml on every release: published event.

pkgname=argos-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Fast, git-native API client (REST / GraphQL / WebSocket)"
arch=('x86_64')
url="https://argos.thothlab.tech"
license=('Apache-2.0')
provides=('argos')
conflicts=('argos')
# webkit2gtk-4.1 + gtk3 + libappindicator-gtk3 are Tauri's runtime
# trio. The AppImage bundles its own copies, but Arch pulls them in
# system-wide anyway and we run the AppImage as-is via FUSE.
depends=('fuse2' 'webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3')
options=('!strip' '!debug')
source=("Argos_${pkgver}_amd64.AppImage::https://github.com/thothlab/argos-app/releases/download/v${pkgver}/Argos_${pkgver}_amd64.AppImage")
noextract=("Argos_${pkgver}_amd64.AppImage")
sha256sums=('bb1c10a9f6e91f5b99caca1ad6df2a4745eb9f1ad1a0794e58e23f911894d795')

prepare() {
  chmod +x "Argos_${pkgver}_amd64.AppImage"
  # One full extract: AppImage's --appimage-extract with a pattern
  # re-creates squashfs-root from scratch, so two successive
  # pattern-extracts would clobber each other. The extra ~250 MB
  # of bundled libs stays on the builder, not in the package.
  ./"Argos_${pkgver}_amd64.AppImage" --appimage-extract >/dev/null

  # The bundled .desktop has `Exec=argos-desktop`, which only works
  # inside the AppImage's wrapped env. Repoint it at our wrapper.
  sed -i 's|^Exec=.*|Exec=/usr/bin/argos|' \
      squashfs-root/usr/share/applications/Argos.desktop
}

package() {
  # The AppImage stays whole — its bundled libs need their own
  # LD_LIBRARY_PATH set up by AppRun, easier to keep that boundary
  # than to re-implement it.
  install -Dm755 "Argos_${pkgver}_amd64.AppImage" \
      "${pkgdir}/opt/argos/argos.AppImage"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/argos" <<'WRAPPER'
#!/bin/sh
exec /opt/argos/argos.AppImage "$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/argos"

  install -Dm644 squashfs-root/usr/share/applications/Argos.desktop \
      "${pkgdir}/usr/share/applications/argos.desktop"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/128x128/apps/argos-desktop.png \
      "${pkgdir}/usr/share/icons/hicolor/128x128/apps/argos-desktop.png"
}
