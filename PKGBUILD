# Maintainer: patrickjaja <patrickjajaa@gmail.com>
# Contributor: Claude Desktop Linux Community
# AUR Package Repository: https://github.com/patrickjaja/claude-desktop-bin

pkgname=claude-desktop-bin
pkgver=1.18286.2
pkgrel=2
pkgdesc="Claude Desktop - Linux (unofficial, repackaged from the official Linux .deb)"
arch=('x86_64' 'aarch64')
url="https://github.com/patrickjaja/claude-desktop-bin"
license=('custom:Claude')
# Grounded in `objdump -p | grep NEEDED` of every ELF we ship (Electron 42 main
# binary, chrome_crashpad_handler, bundled virtiofsd, node-pty pty.node) plus
# the official .deb's control Depends. Notes:
# - libcap-ng + libseccomp: linked by the BUNDLED virtiofsd the official .deb
#   ships at resources/virtiofsd (we ship it under resources/locales/).
# - libsecret: dlopened by Chromium's os_crypt for keyring credential storage
#   (not in NEEDED, but genuinely required — upstream declares libsecret-1-0).
# - libnotify, libdrm, xdg-utils, xdg-desktop-portal: mirror upstream Depends.
# - systemd-libs (libudev) and gcc-libs (libstdc++ for pty.node) are linked but
#   missing from most third-party Electron PKGBUILDs.
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2'
         'glibc' 'gtk3' 'hicolor-icon-theme' 'libcap-ng' 'libcups' 'libdrm'
         'libnotify' 'libseccomp' 'libsecret' 'libx11' 'libxcb' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa'
         'nspr' 'nss' 'pango' 'systemd-libs' 'xdg-desktop-portal' 'xdg-utils')
# Cowork's VM deps (QEMU + UEFI firmware + virtiofsd) mirror the official Claude
# Desktop .deb's Recommends — kept soft (optdepends), so we stay close to
# upstream and don't force ~400 MB of QEMU on Chat/Code-only installs. The
# firmware package is arch-specific (edk2-ovmf on x86_64, edk2-aarch64 on
# aarch64); qemu-system-x86 / qemu-system-aarch64 ship the matching emulator
# (NOT qemu-base — it has no emulator binary and is x86_64-only). /dev/kvm
# access still needs the user in the `kvm` group.
optdepends=('nodejs: System Node.js for MCP extensions that require specific versions (Electron bundles Node.js as fallback)'
            'sqlite: Project detection (detectedProjects) — without it, periodic ENOENT errors spam logs/main.log'
            'claude-code: optional pinned Claude Code CLI. NOT required — the app auto-downloads a checksum-verified CLI matching its required version. To force a system binary set CLAUDE_CODE_LOCAL_BINARY=/path/to/claude (npm i -g @anthropic-ai/claude-code)'
            'virtiofsd: Cowork agent workspace VM — shares $HOME into the guest'
            'imagemagick: Computer Use screenshot crop via convert - ONLY for the residual KDE-without-kwin-bridge spectacle tier (bundled bridges cover X11/wlroots/GNOME/KDE 6.6+)'
            'ydotool: Computer Use input on exotic Wayland compositors ONLY (non-wlroots, non-GNOME, non-KDE; requires ydotoold daemon, v1.0+) - wlroots/GNOME/KDE use the bundled bridges'
            'socat: Faster Quick Entry toggle via socket (~2ms vs ~25ms python3 — not required)'
            'gnome-keyring: credential storage backend for libsecret (KDE users: kwallet works too — upstream Recommends gnome-keyring | kwalletd)'
            'xdg-desktop-portal-gtk: portal backend for DEs without their own (GNOME/KDE ship xdg-desktop-portal-gnome/-kde) — file dialogs, screen sharing')
optdepends_x86_64=('qemu-system-x86: Cowork agent workspace VM (needs /dev/kvm + user in kvm group)'
                   'edk2-ovmf: Cowork agent workspace VM UEFI firmware (OVMF)')
optdepends_aarch64=('qemu-system-aarch64: Cowork agent workspace VM (needs /dev/kvm + user in kvm group)'
                    'edk2-aarch64: Cowork agent workspace VM UEFI firmware (AAVMF)')
provides=('claude-desktop')
conflicts=('claude-desktop')
install="$pkgname.install"
# The pre-patched tarball already contains the official Electron runtime (under
# electron/) and the patched app (under app/). No separate Electron zip source.
source_x86_64=("claude-desktop-${pkgver}-${pkgrel}-linux.tar.gz::https://github.com/patrickjaja/claude-desktop-bin/releases/download/v1.18286.2-2/claude-desktop-1.18286.2-linux.tar.gz")
sha256sums_x86_64=('dca4900bcb2d891a541efe20a3f52e9426a192f3e3582e338ab98daf6c1e5c84')
source_aarch64=("claude-desktop-${pkgver}-${pkgrel}-linux-aarch64.tar.gz::https://github.com/patrickjaja/claude-desktop-bin/releases/download/v1.18286.2-2/claude-desktop-1.18286.2-linux-aarch64.tar.gz")
sha256sums_aarch64=('75c8bc7a50f6a0d28772c0968c98b488d704f36f879c07c68eb2a5870e18ba3a')
options=('!strip' '!emptydirs')

package() {
    cd "$srcdir"

    # Install the bundled Electron runtime (from the official .deb, shipped in the
    # tarball's electron/ dir): the Electron binary, chrome-sandbox, the .so files,
    # paks, chromium locales, snapshots, etc.
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r electron/* "$pkgdir/usr/lib/$pkgname/"

    # Rename the Electron binary to "claude". NOTE: this does NOT set the window
    # identity. The live X11 WM_CLASS / Wayland app_id is "claude-desktop"
    # (verified via xprop/wmctrl), because Chromium's GetXdgAppId() reads the
    # app's desktopName ("claude-desktop.desktop" in app.asar package.json),
    # strips ".desktop", and ignores the binary basename / --class. The rename
    # is kept only as a cosmetic argv[0] / a systemd-scope identity hint that
    # matches APP_ID="claude". StartupWMClass below must equal the real app_id.
    # (The .deb names this binary "claude-desktop"; the old Electron zip named it
    # "electron". Handle whichever is present.)
    if [ -f "$pkgdir/usr/lib/$pkgname/claude-desktop" ]; then
        mv "$pkgdir/usr/lib/$pkgname/claude-desktop" "$pkgdir/usr/lib/$pkgname/claude"
    elif [ -f "$pkgdir/usr/lib/$pkgname/electron" ]; then
        mv "$pkgdir/usr/lib/$pkgname/electron" "$pkgdir/usr/lib/$pkgname/claude"
    fi

    # Set SUID on chrome-sandbox (required by Chromium's sandbox). The .install
    # hook re-asserts root ownership + 4755 at install time (cp loses it here).
    if [ -f "$pkgdir/usr/lib/$pkgname/chrome-sandbox" ]; then
        chmod 4755 "$pkgdir/usr/lib/$pkgname/chrome-sandbox"
    fi

    # Install application files (pre-patched) into Electron's resources directory.
    # The official .deb keeps app.asar at usr/lib/claude-desktop/resources/; our
    # tarball ships it under app/ (app.asar + app.asar.unpacked + locales), so
    # create resources/ first (electron/ has no resources/ subdir, only resources.pak).
    install -dm755 "$pkgdir/usr/lib/$pkgname/resources"
    cp -r app/* "$pkgdir/usr/lib/$pkgname/resources/"

    # Install launcher script (Wayland/X11 detection, env setup, lock cleanup)
    install -Dm755 "$srcdir/launcher/claude-desktop" "$pkgdir/usr/bin/claude-desktop"

    # Install desktop entry.
    # Filename is "claude-desktop.desktop" to match the live window app_id
    # "claude-desktop" (Chromium's GetXdgAppId() reads the app's desktopName
    # "claude-desktop.desktop" from app.asar package.json, strips ".desktop").
    # On native Wayland there is no WM_CLASS, so KWin/GNOME match by app_id; if
    # the .desktop basename doesn't equal the app_id the dock icon is generic and
    # Alt+Tab shows a duplicate (issue #148). StartupWMClass=claude-desktop fixes
    # the X11/XWayland path. Content mirrors the official Claude Desktop .deb.
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/claude-desktop.desktop" << 'EOF'
[Desktop Entry]
Name=Claude
Comment=Desktop application for Claude.ai
GenericName=AI Assistant
Keywords=AI;Chat;Assistant;Claude;Code;LLM;
Exec=claude-desktop %U
Icon=claude-desktop
Type=Application
StartupNotify=true
StartupWMClass=claude-desktop
# second-instance just focuses mainWindow; suppress GNOME's default "New Window" item
SingleMainWindow=true
Categories=Utility;Development;
MimeType=x-scheme-handler/claude;
Actions=NewChat;NewCode;

[Desktop Action NewChat]
Name=New chat
Exec=claude-desktop claude://claude.ai/new

[Desktop Action NewCode]
Name=New Claude Code session
Exec=claude-desktop claude://code/new
EOF

    # Install icon (included in tarball)
    if [ -f "$srcdir/icons/claude-desktop.png" ]; then
        install -Dm644 "$srcdir/icons/claude-desktop.png" \
            "$pkgdir/usr/share/icons/hicolor/256x256/apps/claude-desktop.png"
    fi

    # Upstream license notice (the official .deb's usr/share/doc copyright file,
    # placed at the tarball root by scripts/build-patched-tarball.sh).
    install -Dm644 "$srcdir/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4 et:
