# Maintainer: mdmrk <mariodavo.20@gmail.com>

pkgname=kytyps5-nightly-bin
pkgver=2026.08.31.af8aecf
pkgrel=1
_appname=kytyps5
_tag=KytyPS5-2026-08-31-af8aecf
_commit=af8aecfdde3ed36f938e18af8e3afb64a285e231
pkgdesc="PlayStation 5 emulator (upstream nightly binary release)"
arch=('x86_64')
url="https://github.com/KytyPS5/KytyPS5"
license=('GPL-2.0-only' 'MIT' 'LGPL-3.0-only' 'Unicode-3.0')
depends=(
  'alsa-lib'
  'brotli'
  'dbus'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glib2'
  'glibc'
  'krb5'
  'libdrm'
  'libglvnd'
  'libpulse'
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
optdepends=(
  'konsole: show emulator output in a terminal window'
  'kitty: show emulator output in a terminal window'
  'xterm: show emulator output in a terminal window'
)
provides=("kytyps5=$pkgver")
conflicts=('kytyps5')
options=('!strip' '!debug')
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/$_tag/$_tag-Linux-x86_64.tar.gz"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/KytyPS5/KytyPS5/$_commit/LICENSE"
  "Kyty-MIT-$pkgver.txt::https://raw.githubusercontent.com/KytyPS5/KytyPS5/$_commit/LICENSES/Kyty-MIT.txt"
  "$_appname.desktop"
)
sha256sums=(
  'b6e8dd59540d04d863cb5315cd6cefe24ed5ce021f6798bfff43cd17b2df1cdc'
  'f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505'
  '1bbcea0e75b3ac77b4711a12eefa3a3b7dfea43528fc0730af3178ba5cd55396'
  '8eeeacccbbbb858724dbaf5e40a25f0718aa2a7ab75937b3da2652cb16e85103'
)

package() {
  local _dest="$pkgdir/opt/$_appname"

  install -Dm755 -t "$_dest" "$srcdir/kyty_emulator" "$srcdir/launcher"
  install -Dm644 -t "$_dest" "$srcdir/qt.conf"
  install -dm755 "$_dest/lib"
  install -m644 -t "$_dest/lib" "$srcdir/lib"/*.so.*
  cp -a "$srcdir/plugins" "$_dest/"
  chmod -R u=rwX,go=rX "$_dest/plugins"

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

  install -Dm644 "$srcdir/$_appname.desktop" "$pkgdir/usr/share/applications/$_appname.desktop"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/Kyty-MIT-$pkgver.txt" "$pkgdir/usr/share/licenses/$pkgname/Kyty-MIT.txt"
}
