# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=chiaki-ng-bin
pkgver=1.10.0
pkgrel=2
pkgdesc="Free and Open Source PlayStation Remote Play client (upstream AppImage)"
arch=('x86_64')
url="https://streetpea.github.io/chiaki-ng/"
license=('LicenseRef-AGPL-3.0-only-OpenSSL')
# the AppImage bundles Qt6, ffmpeg, SDL and the rest of the stack; these are
# what is left over
depends=('glibc' 'gcc-libs' 'zlib' 'bzip2' 'brotli' 'expat' 'libgpg-error'
         'e2fsprogs' 'fontconfig' 'freetype2' 'alsa-lib' 'libx11' 'libxcb'
         'libdrm' 'libva' 'libglvnd' 'mesa' 'vulkan-icd-loader'
         'hicolor-icon-theme')
optdepends=('intel-media-driver: vaapi backend for Intel GPUs [>= Broadwell]'
            'libva-intel-driver: vaapi backend for Intel GPUs [<= Haswell]'
            'libva-mesa-driver: vaapi backend for AMD GPUs')
provides=('chiaki-ng' 'chiaki')
conflicts=('chiaki-ng' 'chiaki')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/streetpea/chiaki-ng/releases/download/v${pkgver}/chiaki-ng.AppImage_x86_64"
        "COPYING-${pkgver}::https://raw.githubusercontent.com/streetpea/chiaki-ng/v${pkgver}/COPYING")
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('cac42c21a19a111f2f0729bb9eef7d3878c6d2a4f06e017d383aff2aba719fd3' 'fff3acb5eddbde97746cc1ad2082a1e95f50c2315a8748b26b8a81a499d8d216')

prepare() {
  chmod +x "$srcdir/${pkgname}-${pkgver}.AppImage"
  "$srcdir/${pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
}

package() {
  local _root="$srcdir/squashfs-root"

  # upstream's AppImage payload, installed unchanged
  install -d "$pkgdir/opt/$pkgname"
  cp -a "$_root/." "$pkgdir/opt/$pkgname/"
  rm -f "$pkgdir/opt/$pkgname/.DirIcon"

  # the binaries carry a RUNPATH into the bundle and read the qt.conf next to
  # them, so they have to be exec'd where they are
  install -d "$pkgdir/usr/bin"
  local _bin
  for _bin in chiaki chiaki-cli; do
    cat > "$pkgdir/usr/bin/$_bin" << EOF
#!/bin/sh
exec /opt/$pkgname/usr/bin/$_bin "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$_bin"
  done

  install -Dm644 "$_root/usr/share/applications/chiaking.desktop" \
    "$pkgdir/usr/share/applications/chiaking.desktop"
  install -Dm644 "$_root/usr/share/metainfo/io.github.streetpea.Chiaki4deck.appdata.xml" \
    "$pkgdir/usr/share/metainfo/io.github.streetpea.Chiaki4deck.appdata.xml"
  install -Dm644 "$_root/usr/share/icons/hicolor/512x512/apps/chiaking.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/chiaking.png"

  # AGPL-3.0-only-OpenSSL is not a common license, ship the text
  install -Dm644 "$srcdir/COPYING-${pkgver}" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
