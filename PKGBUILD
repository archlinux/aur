# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://git.felo.gg/Felitendo/PKGBUILDS

pkgname=moonlight-vrr-bin
pkgver=6.1.0_vrr18
pkgrel=1
pkgdesc="GameStream client for PCs, fork of moonlight-qt with smooth VRR pacing (upstream AppImage)"
arch=('x86_64')
url="https://github.com/Nonary/moonlight-qt"
license=('GPL-3.0-or-later')
# the AppImage bundles Qt6, FFmpeg, SDL, libplacebo and the rest of the stack;
# these are what is left over
depends=('e2fsprogs' 'fontconfig' 'freetype2' 'glibc' 'harfbuzz'
         'hicolor-icon-theme' 'libdrm' 'libgcc' 'libglvnd' 'libgpg-error' 'libice'
         'libsm' 'libstdc++' 'libx11' 'libxcb' 'zlib')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs up to Coffee Lake'
            'intel-media-driver: hardware acceleration for Intel GPUs from Broadwell on')
provides=('moonlight-vrr' 'moonlight-qt')
conflicts=('moonlight-vrr' 'moonlight-qt')
options=('!strip' '!debug')
# upstream tags use hyphens (v6.1.0-vrr18), which pkgver must not contain
_upver="${pkgver//_/-}"
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${_upver}/Moonlight-${_upver}-x86_64.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('5b5992eb0d9d6528ca6db83c33da3bf6cbecea0f5a8f7b9b34dcd5d22d13f40c')

prepare() {
  chmod +x "$srcdir/${pkgname}-${pkgver}.AppImage"
  "$srcdir/${pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
}

package() {
  local _root="$srcdir/squashfs-root"

  # upstream's AppImage payload, installed unchanged
  install -d "$pkgdir/opt/$pkgname"
  cp -a "$_root/usr/." "$pkgdir/opt/$pkgname/"
  # the squashfs has private directories and world writable files
  chmod -R u=rwX,go=rX "$pkgdir/opt/$pkgname"

  # the binary has a RUNPATH into the bundle and reads the qt.conf next to it,
  # so it has to be exec'd where it is
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/moonlight" << EOF
#!/bin/sh
exec /opt/$pkgname/bin/moonlight "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/moonlight"

  install -Dm644 "$_root/com.moonlight_stream.Moonlight.desktop" \
    "$pkgdir/usr/share/applications/com.moonlight_stream.Moonlight.desktop"
  sed -i '/^X-AppImage-/d' "$pkgdir/usr/share/applications/com.moonlight_stream.Moonlight.desktop"
  install -Dm644 "$_root/usr/share/metainfo/com.moonlight_stream.Moonlight.appdata.xml" \
    "$pkgdir/usr/share/metainfo/com.moonlight_stream.Moonlight.appdata.xml"
  install -Dm644 "$_root/usr/share/icons/hicolor/scalable/apps/moonlight.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/moonlight.svg"
}
