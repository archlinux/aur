# Maintainer: 7White <sevenwhite10@gmail.com>

pkgname=ai-toolbox-bin
pkgver=0.3.7
pkgrel=2
pkgdesc="AI Toolbox (binary AppImage release)"
arch=('x86_64')
url="https://github.com/coulsontl/ai-toolbox"
license=('LicenseRef-upstream-license-missing')
depends=('bash' 'fuse2' 'hicolor-icon-theme')
options=('!strip')

_appimage="AI.Toolbox_${pkgver}_amd64.AppImage"

source=(
  "${_appimage}::https://github.com/coulsontl/ai-toolbox/releases/download/v${pkgver}/${_appimage}"
)
sha256sums=('c9756e34916352fe4f4869500f555930e61d4969637a8a699c3bbcb7ec319f1b')

prepare() {
  chmod +x "${_appimage}"

  # Extract AppImage (creates squashfs-root/)
  "./${_appimage}" --appimage-extract >/dev/null

  # Some AppImages ship a desktop file under different names; keep everything in place for package()
}

package() {
  # 1) Install AppImage payload
  install -Dm755 "${_appimage}" "${pkgdir}/usr/lib/ai-toolbox/ai-toolbox.AppImage"

  # 2) Wrapper
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ai-toolbox" <<'WRAP'
#!/bin/sh
exec /usr/lib/ai-toolbox/ai-toolbox.AppImage "$@"
WRAP

  # 3) Desktop file from AppImage (prefer upstream-provided)
  #    Most AppImages have exactly one .desktop in squashfs-root/usr/share/applications/
  if compgen -G "squashfs-root/usr/share/applications/*.desktop" > /dev/null; then
    desktop_src="$(ls -1 squashfs-root/usr/share/applications/*.desktop | head -n 1)"

    # Install then patch Exec/Icon to match wrapper + our icon name
    install -Dm644 "$desktop_src" "${pkgdir}/usr/share/applications/ai-toolbox.desktop"

    # Force Exec to our wrapper (avoid AppRun paths)
    sed -i 's|^Exec=.*|Exec=ai-toolbox|g' "${pkgdir}/usr/share/applications/ai-toolbox.desktop"

    # Force Icon name to a stable value we install below
    sed -i 's|^Icon=.*|Icon=ai-toolbox|g' "${pkgdir}/usr/share/applications/ai-toolbox.desktop"
  else
    # Fallback minimal desktop
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/ai-toolbox.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=AI Toolbox
Exec=ai-toolbox
Icon=ai-toolbox
Categories=Development;
Terminal=false
DESKTOP
  fi

  # 4) Icons from AppImage
  # Prefer hicolor icons if present
  if [ -d "squashfs-root/usr/share/icons/hicolor" ]; then
    # Copy common sizes (ignore missing)
    for size in 16 24 32 48 64 128 256 512; do
      for ext in png svg; do
        src="squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps"
        if [ -d "$src" ]; then
          # Try to find a plausible app icon file
          icon_file="$(find "$src" -maxdepth 1 -type f \( -iname "*toolbox*.${ext}" -o -iname "*ai*.${ext}" -o -iname "*AIToolbox*.${ext}" \) | head -n 1)"
          if [ -n "$icon_file" ]; then
            install -Dm644 "$icon_file" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/ai-toolbox.${ext}"
          fi
        fi
      done
    done
  fi

  # If no hicolor icon was found/installed, try .DirIcon at the AppImage root
  if ! compgen -G "${pkgdir}/usr/share/icons/hicolor/*/apps/ai-toolbox.*" > /dev/null; then
    if [ -f "squashfs-root/.DirIcon" ]; then
      install -Dm644 "squashfs-root/.DirIcon" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ai-toolbox.png"
    fi
  fi

  # 5) License notice (since upstream doesn't ship license text)
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'LIC'
Upstream README mentions "MIT", but the upstream repository/release assets do not currently ship a LICENSE file containing the full license text.
This package therefore cannot provide the complete license terms. Please check the upstream project page for licensing updates.
LIC
}
