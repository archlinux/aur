# Maintainer: Argos Releases <releases@thothlab.tech>
#
# Template — `0.1.3` and `c79480fe8b00a423f32ee9d44efdbb60694efa970f4bf41615cab5a09524b9fe` placeholders are substituted by
# .github/workflows/release-aur.yml before this file is pushed to AUR.
# Edit-by-hand on a release is fine; just keep both placeholders intact.

pkgname=argos-bin
pkgver=0.1.3
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
sha256sums=('c79480fe8b00a423f32ee9d44efdbb60694efa970f4bf41615cab5a09524b9fe')

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
