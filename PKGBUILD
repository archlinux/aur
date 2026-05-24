# Maintainer: TSMaitryDotDev <hexshell@example.invalid>
#
# Hexshell — Electron-based sci-fi terminal. The -bin package wraps the
# pre-built AppImage from the GitHub release. We extract its contents and
# install them under /opt, then expose `/usr/bin/hexshell` and a desktop
# entry. Building Electron from source on the AUR is impractical for users
# (multi-hour build + 10+ GB scratch space), so a -bin package is standard.

pkgname=hexshell-bin
_pkgname=hexshell
pkgver=0.1.0
pkgrel=2
pkgdesc="Fullscreen sci-fi terminal with its own interactive shell (hexsh)"
arch=('x86_64')
url="https://github.com/TSMaitryDotDev/hexshell"
license=('MIT')

# Runtime dependencies. Electron's bundled Chromium needs these shared libs;
# leaving them implicit would make the package "work on the maintainer's
# machine" only.
depends=(
  'libnotify'
  'nss'
  'libxtst'
  'util-linux-libs'
  'at-spi2-core'
  'libdrm'
  'libxkbcommon'
  'libsecret'
  'glibc'
  'gcc-libs'
  'fontconfig'
  'libxss'
  'alsa-lib'
)

# We provide a generic `hexshell` so a future from-source `hexshell` AUR
# entry can replace this one cleanly.
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

options=(!strip !debug)

# Source URL must match what electron-builder writes to the GitHub release.
# The actual asset name is `Hexshell-<ver>-x86_64.AppImage` (lowercase 's',
# `-x86_64` arch suffix). If you change either in CI, update here.
source=(
  "${_pkgname}-${pkgver}-x86_64.AppImage::https://github.com/TSMaitryDotDev/hexshell/releases/download/v${pkgver}/Hexshell-${pkgver}-x86_64.AppImage"
)

# `SKIP` lets users install without us pinning a hash. To pin: replace
# with the SHA256 from the release's SHA256SUMS file and bump pkgrel.
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}"
  local appimage="${_pkgname}-${pkgver}-x86_64.AppImage"
  # AppImages are squashfs payloads with a stub. `--appimage-extract`
  # unpacks into ./squashfs-root/ without needing fuse.
  chmod +x "./${appimage}"
  "./${appimage}" --appimage-extract >/dev/null
}

package() {
  cd "${srcdir}/squashfs-root"

  # 1. App payload -> /opt/Hexshell. /opt is the convention for vendored
  #    binaries on Arch (see `electron`, `slack-desktop`, `discord`).
  install -dm755 "${pkgdir}/opt/Hexshell"
  cp -a --no-preserve=ownership ./* "${pkgdir}/opt/Hexshell/"

  # 2. Strip the .desktop the AppImage carries; we install our own.
  rm -f "${pkgdir}/opt/Hexshell/"*.desktop

  # 3. Wrapper on $PATH.
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/hexshell" <<'EOF'
#!/bin/sh
exec /opt/Hexshell/hexshell "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/hexshell"

  # 4. Icon. electron-builder packs it under usr/share/icons/hicolor/...
  #    inside the AppImage; we relocate. Two paths to try because the
  #    exact size directory varies with how electron-builder names it.
  for size in 512x512 256x256 0x0; do
    if [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}/apps/hexshell.png" ]; then
      install -Dm644 \
        "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}/apps/hexshell.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}/apps/hexshell.png"
      break
    fi
  done

  # 5. Desktop entry. We write this from scratch to control fields the
  #    AppImage's bundled .desktop doesn't always include (e.g. WMClass).
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/hexshell.desktop" <<EOF
[Desktop Entry]
Name=Hexshell
GenericName=Terminal Emulator
Comment=Sci-fi fullscreen terminal
Exec=hexshell %U
Icon=hexshell
Terminal=false
Type=Application
Categories=System;TerminalEmulator;Utility;
StartupNotify=true
StartupWMClass=Hexshell
Keywords=terminal;shell;hexsh;cyberpunk;edex;
EOF
}
