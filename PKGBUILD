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
pkgrel=4
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

  # 1a. Permission scrub. The AppImage's squashfs layer can carry over
  #     restrictive directory modes (e.g. resources/ as 0700) from the
  #     build host's umask. That makes `app.asar` unreadable for normal
  #     users → Electron exits silently with no UI. We force every dir
  #     to 755 and every file to 644, then re-set the few bits that
  #     genuinely need to be different (chrome-sandbox setuid, exec
  #     binaries 0755).
  find "${pkgdir}/opt/Hexshell" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/Hexshell" -type f -exec chmod 644 {} +
  # Restore exec bits on the binaries Electron actually runs.
  for bin in hexshell chrome_crashpad_handler; do
    [ -f "${pkgdir}/opt/Hexshell/${bin}" ] \
      && chmod 0755 "${pkgdir}/opt/Hexshell/${bin}"
  done
  # Anything else with a magic ELF header should stay executable.
  find "${pkgdir}/opt/Hexshell" -type f -name '*.so*' -exec chmod 0755 {} +

  # 2. Strip the .desktop the AppImage carries; we install our own.
  rm -f "${pkgdir}/opt/Hexshell/"*.desktop

  # 3. Drop the AppImage's bundled `usr/` tree we just copied — it has
  #    a malformed icon directory (`hicolor/0x0/`) and a desktop entry
  #    we don't want under /opt. We re-install the real ones below.
  rm -rf "${pkgdir}/opt/Hexshell/usr"

  # 4. Chrome's setuid sandbox. Electron refuses to launch when this
  #    helper isn't setuid root (silent exit on most distros). Setting
  #    the bit at packaging time is the standard fix used by upstream
  #    Electron apps on Arch (vscode, slack-desktop, etc.). Pacman will
  #    preserve the bits because we set them in fakeroot.
  if [ -f "${pkgdir}/opt/Hexshell/chrome-sandbox" ]; then
    chmod 4755 "${pkgdir}/opt/Hexshell/chrome-sandbox"
  fi

  # 5. Wrapper on $PATH. Falls back to `--no-sandbox` only if the
  #    sandbox helper somehow isn't setuid (hardened distros that ban
  #    setuid binaries). Keeping the sandbox is the secure default.
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/hexshell" <<'EOF'
#!/bin/sh
# Hexshell launcher.
# When chrome-sandbox is setuid root (the normal case on Arch), Electron's
# sandbox engages without flags. Some hardened systems (no_new_privs etc.)
# strip setuid; we detect that and fall back to --no-sandbox so the user
# at least gets a working app instead of a silent exit.
SANDBOX="/opt/Hexshell/chrome-sandbox"
if [ -u "${SANDBOX}" ]; then
  exec /opt/Hexshell/hexshell "$@"
else
  exec /opt/Hexshell/hexshell --no-sandbox "$@"
fi
EOF
  chmod 755 "${pkgdir}/usr/bin/hexshell"

  # 6. Icon. The AppImage's bundled tree has an invalid `hicolor/0x0`
  #    path that desktop environments ignore. We install the same PNG
  #    under proper sizes by reading whichever variant electron-builder
  #    actually produced.
  local icon_src=""
  for cand in \
      "${srcdir}/squashfs-root/hexshell.png" \
      "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/hexshell.png" \
      "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/hexshell.png" \
      "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/hexshell.png"; do
    if [ -f "${cand}" ]; then icon_src="${cand}"; break; fi
  done
  if [ -n "${icon_src}" ]; then
    # Drop the same icon at every standard size so freedesktop's icon
    # cache picks the right one for any DE / panel widget.
    for size in 16 24 32 48 64 128 256 512; do
      install -Dm644 "${icon_src}" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/hexshell.png"
    done
  fi

  # 7. Desktop entry. We write this from scratch to control fields the
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
