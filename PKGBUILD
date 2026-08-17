# Maintainer: structwafel <luca.giannini@visma.com>

# Repackages the upstream AppImage rather than shipping it whole.
#
# The AppImage bundles 177 Debian libraries (239 MB), including its own webkit2gtk/gtk3, and its
# AppRun exports GDK_BACKEND=x11 plus GTK_PATH, XDG_DATA_DIRS and GIO_EXTRA_MODULES. VelaTerm is a
# terminal multiplexer, so that environment reaches every shell and agent it spawns; upstream
# 425d4b7 scrubs the leak into children, but the app itself is still pinned to XWayland.
#
# We install only usr/bin/velaterm and drop the bundle entirely. The binary's RUNPATH is
# $ORIGIN/../lib, so from /usr/bin that resolves to /usr/lib -- Arch's own libraries. All 143
# linked libs resolve against the system, giving native Wayland (verified under sway: 3 wayland
# fds, 0 X11 fds, reported as app_id rather than an XWayland class) and system webkit2gtk-4.1,
# which also provides WebKitGPUProcess, absent from the bundle. The WebKitGTK-on-Wayland crash
# that made upstream force x11 (tauri-apps/tauri#8541) does not reproduce against webkit2gtk 2.52.
#
# No wrapper script is used on purpose: setting GDK_BACKEND ourselves would recreate exactly the
# environment inheritance the upstream fix was written to prevent. GTK detects Wayland on its own.

pkgname=velaterm-bin
pkgver=0.1.101
pkgrel=1
pkgdesc='Terminal and AI-agent session manager with a project/group/session tree and remote browser access'
arch=('x86_64')
url='https://velaterm.com'
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'sqlite'
  'gst-plugins-base-libs'
  'hicolor-icon-theme'
)
optdepends=(
  'libayatana-appindicator: system tray icon'
  'git: repository status and worktree-isolated child sessions'
  'openssh: running sessions on a remote host'
  'tailscale: reaching remote access over a tailnet'
)
makedepends=('minisign')
provides=('velaterm')
conflicts=('velaterm')
options=('!strip')
install="${pkgname}.install"

_commit=c099cc248df5fc351eae90cd617e7f23685245f6
source=(
  "VelaTerm-${pkgver}.AppImage::https://dl.velaterm.com/${pkgver}/VelaTerm_${pkgver}_amd64.AppImage"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/vlinx-io/VelaTerm/${_commit}/LICENSE"
  'velaterm.minisign.pub'
  'velaterm.AppImage.minisig'
)
noextract=("VelaTerm-${pkgver}.AppImage")
sha256sums=(
  '6d2ca953bdbb137772328a567c45d90f3faa00c3c35795267b2b1dc83909bff6'
  'f6812bc2666e6447164bb133b38cdc35693761f55158f053167f7c1c7b853693'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$srcdir"

  # Upstream ships no CI and no reproducible build, so the signature is the only provenance we get.
  # Verify it before touching the artifact: the key is the one committed to tauri.conf.json, and it
  # is the same key that signs the vela-server binary pushed to remote hosts over SSH.
  msg2 'Verifying upstream minisign signature...'
  minisign -V -p velaterm.minisign.pub \
           -x velaterm.AppImage.minisig \
           -m "VelaTerm-${pkgver}.AppImage"

  chmod +x "VelaTerm-${pkgver}.AppImage"
  rm -rf squashfs-root
  "./VelaTerm-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
  cd "$srcdir/squashfs-root"

  install -Dm755 usr/bin/velaterm "$pkgdir/usr/bin/velaterm"
  install -Dm644 usr/share/applications/VelaTerm.desktop \
                 "$pkgdir/usr/share/applications/velaterm.desktop"

  for _size in 32x32 128x128 256x256@2; do
    install -Dm644 "usr/share/icons/hicolor/${_size}/apps/velaterm.png" \
                   "$pkgdir/usr/share/icons/hicolor/${_size}/apps/velaterm.png"
  done

  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # The upstream entry has an empty Categories= line, which desktop-file-validate rejects.
  sed -i 's/^Categories=$/Categories=Development;System;TerminalEmulator;/' \
    "$pkgdir/usr/share/applications/velaterm.desktop"
}
