# Maintainer: HanHaocheng <1849397656@qq.com>
#
# Binary repackage of the official Linux app image from the GitHub releases.
# Upstream publishes only pre-releases in the 9.x line (tag v<VERSION>-pre.<N>),
# so pkgver mirrors the tag to keep successive pre-releases ordered.
# Note: 9.0.6_pre.21 sorts above a future final 9.0.6 under vercmp; this is
# intentional while no final release exists.
#
# The desktop entry below is copied verbatim from packaging/linux/xdm-app.desktop
# at commit 4f16d4d3b5d09eb83638c114d5b03bdf1c22d725 (the commit the v9.0.6-pre.21
# tag points at). It is inlined instead of being listed as a source because the
# file is tiny and it keeps the build independent of raw.githubusercontent.com.

pkgname=xdm-app-bin
pkgver=9.0.6_pre.21
_appver=9.0.6
_tag="v${_appver}-pre.21"
pkgrel=1
pkgdesc='Fast, resumable download accelerator and video downloader with HLS/DASH support'
arch=('x86_64' 'aarch64')
url='https://xtremedownloadmanager.com/'
license=('GPL-3.0-only')
depends=('libx11' 'libxext' 'libxrender' 'libxtst' 'libxi' 'freetype2' 'fontconfig' 'ttf-font')
optdepends=(
  'wayland: use the native Wayland toolkit instead of XWayland'
  'libxkbcommon: use the native Wayland toolkit instead of XWayland'
  'gtk3: native GTK file chooser dialogs'
  'alsa-lib: sound notifications'
)
conflicts=('xdm-app' 'xdman' 'xdman_gtk')
replaces=('xdman' 'xdman_gtk')
options=('!strip' '!debug')
source_x86_64=("https://github.com/subhra74/xdm/releases/download/${_tag}/xdm-app-${_appver}-linux-x64.tar.gz")
source_aarch64=("https://github.com/subhra74/xdm/releases/download/${_tag}/xdm-app-${_appver}-linux-arm64.tar.gz")
sha256sums_x86_64=('132fa3b9e9de9eccac1f73d22ec7a4852e02a4f0d5253d611a1165b19367e281')
sha256sums_aarch64=('e6a71e239b05732b056733966b31a0e065f300cf806b4f6a5d0cdd7566da81b6')

package() {
  install -dm755 "$pkgdir/opt" "$pkgdir/usr/bin" \
                 "$pkgdir/usr/share/applications" \
                 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  cp -a "$srcdir/xdm-app-${_appver}" "$pkgdir/opt/xdm-app"
  ln -s /opt/xdm-app/bin/xdm-app "$pkgdir/usr/bin/xdm-app"

  # The app image only ships one (256 px) icon; desktops scale it as needed.
  install -Dm644 "$srcdir/xdm-app-${_appver}/lib/xdm-app.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/xdm-app.png"

  cat > "$pkgdir/usr/share/applications/xdm-app.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Xtreme Download Manager
GenericName=Download Manager
Comment=Download accelerator and video downloader
Exec=/opt/xdm-app/bin/xdm-app %U
Icon=xdm-app
Terminal=false
Categories=Network;FileTransfer;
Keywords=download;accelerator;video;hls;dash;
MimeType=x-scheme-handler/xdm-app;
# No launch feedback: GNOME ends its busy cursor when the first window hands back the launch's
# XDG_ACTIVATION_TOKEN, and JBR's Wayland toolkit never does, so the cursor stayed busy until the
# timeout.
StartupNotify=false
# X11 window class; under native Wayland the window's app id is xdm-app, which matches this file's name.
StartupWMClass=xdm-app-AppMain
DESKTOP
  chmod 644 "$pkgdir/usr/share/applications/xdm-app.desktop"
}
