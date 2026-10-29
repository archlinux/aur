# Maintainer: mdmrk <mariodavo.20@gmail.com>

pkgname=kytyps5-nightly-bin
pkgver=2026.10.29.5eab0ec
pkgrel=1
_appname=kytyps5
_tag=KytyPS5-2026-10-29-5eab0ec
_commit=5eab0ec73855acdf776f5c0669911e2f5ddfb743
pkgdesc="PlayStation 5 emulator (upstream nightly binary release)"
arch=('x86_64')
url="https://github.com/KytyPS5/KytyPS5"
license=('GPL-2.0-only' 'MIT' 'LGPL-3.0-only' 'Unicode-3.0' 'LGPL-2.1-or-later' 'BSD-3-Clause' 'OFL-1.1' 'Apache-2.0')
depends=(
  'alsa-lib'
  'brotli'
  'dbus'
  'fontconfig'
  'freetype2'
  'glib2'
  'glibc'
  'krb5'
  'libdrm'
  'libgcc'
  'libglvnd'
  'libpulse'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxcursor'
  'libxext'
  'libxfixes'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrandr'
  'libxss'
  'systemd-libs'
  'vulkan-driver'
  'vulkan-icd-loader'
  'wayland'
  'xcb-util'
  'xcb-util-cursor'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
  'zlib'
  'zstd'
)
provides=("kytyps5=$pkgver")
conflicts=('kytyps5')
options=('!strip' '!debug')
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/$_tag/$_tag-Linux-x86_64.tar.gz"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/KytyPS5/KytyPS5/$_commit/LICENSE"
  "Kyty-MIT-$pkgver.txt::https://raw.githubusercontent.com/KytyPS5/KytyPS5/$_commit/LICENSES/Kyty-MIT.txt"
  "$_appname-$pkgver.svg::https://raw.githubusercontent.com/KytyPS5/KytyPS5/$_commit/docs/logo.svg"
  "$_appname.desktop"
)
sha256sums=(
  '75844650f73d41f44266ccd1aa83093e014124a487b0c2f98d0e7e5bbdae8279'
  'f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505'
  '1bbcea0e75b3ac77b4711a12eefa3a3b7dfea43528fc0730af3178ba5cd55396'
  '76a381bd4ccf3801d1c850c3bf9903e6d11a480eb6eb5938cdab3d8e949fe857'
  'a9090cd6c4d2c531112edc252e19b35b80305ef16f2004825f0b1924f501320f'
)

package() {
  local _dest="$pkgdir/opt/$_appname"

  install -Dm755 -t "$_dest" "$srcdir/kyty_emulator" "$srcdir/launcher"
  install -Dm644 -t "$_dest" "$srcdir/qt.conf"
  install -dm755 "$_dest/lib"
  install -m644 -t "$_dest/lib" "$srcdir/lib"/*.so.*
  cp -a "$srcdir/assets" "$srcdir/plugins" "$_dest/"
  chmod -R u=rwX,go=rX "$_dest/assets" "$_dest/plugins"

  (
    cd "$_dest/lib"
    for _f in *.so.[0-9]*; do
      for _g in "$_f".[0-9]*; do
        if [[ -f $_g ]] && cmp -s "$_f" "$_g"; then ln -sf "$_g" "$_f"; fi
      done
    done
  )

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_appname" <<EOF
#!/bin/sh
set -eu
dir=\${XDG_DATA_HOME:-\$HOME/.local/share}/$_appname
mkdir -p "\$dir"
ln -sfn /opt/$_appname/kyty_emulator /opt/$_appname/lib /opt/$_appname/plugins /opt/$_appname/qt.conf "\$dir/"
cp --remove-destination /opt/$_appname/launcher "\$dir/launcher"
cd "\$dir"
exec ./launcher "\$@"
EOF

  install -Dm644 "$srcdir/$_appname-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_appname.svg"
  install -Dm644 "$srcdir/$_appname.desktop" "$pkgdir/usr/share/applications/$_appname.desktop"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/Kyty-MIT-$pkgver.txt" "$pkgdir/usr/share/licenses/$pkgname/Kyty-MIT.txt"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/ffmpeg" \
    "$srcdir/licenses/ffmpeg/copyright" "$srcdir/licenses/ffmpeg/SOURCE.txt"
  for _l in noto-sans openxr opus; do
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/$_l" "$srcdir/licenses/$_l"/*
  done
}
