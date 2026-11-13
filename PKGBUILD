# Maintainer: HITCJK <1641796967@qq.com>
pkgname=psd2live-bin
pkgver=3.6.7
pkgrel=1
pkgdesc='Turn layered PSD files into editable Live2D models (prebuilt binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/tsunehimatoi/psd2live'
license=('GPL-3.0-only')
# Upstream README.md (v3.6.7), Linux x86_64 / arm64 row, verbatim:
#   “自带运行时与 Cubism 原生预览（arm64 为 Live2D 的实验性版本），
#    需要 X11 / GLX（XWayland 可用）；tar.gz 供没有 Deb 的发行版，
#    解压后运行 PSD2Live/bin/PSD2Live”
# i.e. both Linux builds bundle their own runtime and the Cubism native
# preview (arm64 uses Live2D's experimental Cubism Core), require X11/GLX
# (XWayland works), and the tar.gz is intended for distros without Deb.
# Minimal set: only direct DT_NEEDED libraries of the packaged ELF files.
# Transitive deps (brotli, bzip2, expat, libpng, libxau, libxcb, libxdmcp)
# are pulled in by fontconfig/freetype2/libx11 automatically. The bundled
# Wayland backend (libawt_wlawt.so / libwlsplashscreen.so) is not used on the
# supported X11/GLX path, so wayland and libffi are intentionally omitted.
depends=(
  'alsa-lib'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'libglvnd'
  'libx11'
  'libxext'
  'libxi'
  'libxrender'
  'libxtst'
  'zlib'
)
optdepends=(
  'ffmpeg: export animated WebP/APNG and MP4/WebM/ProRes videos'
  'xorg-xwayland: required on Wayland sessions'
  'xdg-utils: open external links/folders via xdg-open'
)
provides=('psd2live')
conflicts=('psd2live')
options=('!strip' '!debug')
source=("LICENSE::https://raw.githubusercontent.com/tsunehimatoi/psd2live/v$pkgver/LICENSE")
sha256sums=('22f65f0ba65b3fb08b8f2b681d5cefa436690fe67747fa9ad4674c75695643a4')

source_x86_64=("https://github.com/tsunehimatoi/psd2live/releases/download/v$pkgver/PSD2Live-$pkgver-linux-x64.tar.gz")
sha256sums_x86_64=('ac788290387ca5b373d445f9f879185de3b4102373487b389e3adab0e433b686')

# arm64 uses Live2D's experimental Cubism Core (see upstream statement above).
source_aarch64=("https://github.com/tsunehimatoi/psd2live/releases/download/v$pkgver/PSD2Live-$pkgver-linux-arm64.tar.gz")
sha256sums_aarch64=('505e05346a91ad058525c84fcdd49d004c944cb880dce9cf43132a655476ca30')

package() {
  # The tarball is a self-contained jpackage app image with its own JRE.
  install -d "$pkgdir/opt/psd2live"
  cp -a "$srcdir/PSD2Live/." "$pkgdir/opt/psd2live/"

  # Launcher: the wrapper resolves the app image through /proc/self/exe,
  # so a symlink works and keeps the real files in /opt.
  install -d "$pkgdir/usr/bin"
  ln -s /opt/psd2live/bin/PSD2Live "$pkgdir/usr/bin/psd2live"

  install -Dm644 "$srcdir/PSD2Live/lib/PSD2Live.png" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/psd2live.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/psd2live.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=PSD2Live
GenericName=Live2D Rigging Tool
Comment=Turn layered PSD files into editable Live2D models
Exec=psd2live %U
Icon=psd2live
Terminal=false
Categories=Graphics;2DGraphics;
Keywords=Live2D;PSD;rigging;animation;Cubism;
StartupNotify=true
EOF

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
