# Maintainer: QiE2035 <qie2035@qq.com>

pkgname=moonlight-qt-qiin2333-bin
_pkgname=moonlight-qt-qiin2333
pkgver=6.5.0
pkgrel=1
pkgdesc="GameStream client for PCs with extra features (qiin2333 fork, prebuilt AppImage)"
arch=('x86_64' 'aarch64')
url="https://github.com/qiin2333/moonlight-qt"
license=('GPL-3.0-or-later')
depends=(
  'e2fsprogs'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libdrm'
  'libglvnd'
  'libgpg-error'
  'libva'
  'libx11'
  'libxcb'
  'wayland'
  'zlib'
)
optdepends=(
  'intel-media-driver: VA-API hardware decoding on Intel Broadwell (2014) and newer'
  'libva-intel-driver: VA-API hardware decoding on Intel GMA 4500 (2008) up to Coffee Lake'
  'libva-mesa-driver: VA-API hardware decoding on AMD GPUs'
)
provides=('moonlight-qt' "$_pkgname")
conflicts=('moonlight-qt' "$_pkgname")
options=('!strip' '!debug' '!emptydirs')
source=("LICENSE::https://raw.githubusercontent.com/qiin2333/moonlight-qt/v$pkgver/LICENSE")
sha256sums=('589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')
source_x86_64=("Moonlight-VPlus-$pkgver-x86_64.AppImage::https://github.com/qiin2333/moonlight-qt/releases/download/v$pkgver/Moonlight-VPlus-$pkgver-x86_64.AppImage")
sha256sums_x86_64=('35e41bef7f23125c25a6f2ee8f283a2f4e54283082fa2b8014348aab311fc3ea')
source_aarch64=("Moonlight-VPlus-$pkgver-aarch64.AppImage::https://github.com/qiin2333/moonlight-qt/releases/download/v$pkgver/Moonlight-VPlus-$pkgver-aarch64.AppImage")
sha256sums_aarch64=('33c33341c766118dc351f746ca4e93d35cc49efb10dcf70c1daed13e6333f21b')

prepare() {
  cd "$srcdir"
  chmod +x "Moonlight-VPlus-$pkgver-$CARCH.AppImage"
  rm -rf squashfs-root
  ./"Moonlight-VPlus-$pkgver-$CARCH.AppImage" --appimage-extract >/dev/null
  [[ -x squashfs-root/AppRun ]] || { echo 'AppImage extraction failed' >&2; return 1; }

  # Debian copyright/changelog leftovers linuxdeploy pulled in for the bundled libs
  rm -rf squashfs-root/usr/share/doc
}

package() {
  # self-contained bundle: bundled Qt 6, FFmpeg, SDL2, libplacebo plus the
  # upstream AppRun, which only falls back to the staged libva when the host
  # one cannot load the installed GPU drivers
  install -dm755 "$pkgdir/opt/$pkgname"
  cp --reflink=auto -a squashfs-root/. "$pkgdir/opt/$pkgname/"
  # the AppImage runtime extracts directories as 0700, which would hide the
  # whole bundle from every user but root
  chmod -R a+rX "$pkgdir/opt/$pkgname"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/moonlight" <<EOF
#!/bin/sh
exec /opt/$pkgname/AppRun "\$@"
EOF

  # drop the AppImage-only key from the upstream desktop entry
  sed '/^X-AppImage-Version=/d' \
    squashfs-root/usr/share/applications/com.moonlight_stream.Moonlight.desktop |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/com.moonlight_stream.Moonlight.desktop"

  install -Dm644 squashfs-root/usr/share/icons/hicolor/scalable/apps/moonlight.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/moonlight.svg"
  install -Dm644 squashfs-root/usr/share/metainfo/com.moonlight_stream.Moonlight.appdata.xml \
    "$pkgdir/usr/share/metainfo/com.moonlight_stream.Moonlight.appdata.xml"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
