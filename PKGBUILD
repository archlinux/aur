# Maintainer: HanHaocheng <1849397656@qq.com>
#
# Binary repackage of the official Linux app image from the GitHub releases.
# Upstream 9.x releases are now cut as plain tags (9.0.8); earlier pre-release tags
# looked like v9.0.6-pre.21 and pkgver mirrored the tag (9.0.6_pre.21) at that time.
#
# The desktop entry below is copied verbatim from packaging/linux/xdm-app.desktop
# at commit 2f46454fe513edaaa943d097c93673746919b0fb (the 9.0.8 tag). It is
# inlined instead of being listed as a source because the file is tiny and it
# keeps the build independent of raw.githubusercontent.com.

pkgname=xdm-app-bin
pkgver=9.0.8
pkgrel=2
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
# xdm-app (source build of the same 9.x image) and xdman-bin (9.x repackaged from
# the Fedora RPM by another maintainer) own the same /opt/xdm-app files.
conflicts=('xdm-app' 'xdman-bin' 'xdman' 'xdman_gtk')
replaces=('xdman' 'xdman_gtk')
options=('!strip' '!debug')
source_x86_64=("https://github.com/subhra74/xdm/releases/download/$pkgver/xdm-app-$pkgver-linux-x64.tar.gz")
source_aarch64=("https://github.com/subhra74/xdm/releases/download/$pkgver/xdm-app-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('ad48ca3a7813ef3b75d668847587b77b8b105d383e8ed8ab04b1f7c7c6902ea7')
sha256sums_aarch64=('f85b9be8bfad4458d10d59e43d1a8a55623aa16d4b877301cc771d885cc23832')

package() {
  install -dm755 "$pkgdir/opt" "$pkgdir/usr/bin" \
                 "$pkgdir/usr/share/applications" \
                 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  cp -a "$srcdir/xdm-app-$pkgver" "$pkgdir/opt/xdm-app"
  ln -s /opt/xdm-app/bin/xdm-app "$pkgdir/usr/bin/xdm-app"

  # The app image only ships one (256 px) icon; desktops scale it as needed.
  install -Dm644 "$srcdir/xdm-app-$pkgver/lib/xdm-app.png" \
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
