# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=lichii-bin
pkgver=130
pkgrel=1
pkgdesc="Experimental Nintendo Switch and Switch 2 emulator, fork of Eden (upstream AppImage)"
arch=('x86_64' 'aarch64')
url="https://github.com/zortos293/Lichii"
license=('GPL-3.0-or-later')
# the AppImage bundles Qt6, FFmpeg, SDL3, the Vulkan loader and the rest of
# the stack; these are what is left over
depends=('alsa-lib' 'e2fsprogs' 'fontconfig' 'freetype2' 'fribidi' 'glibc' 'gmp'
         'harfbuzz' 'hicolor-icon-theme' 'libdrm' 'libgcc' 'libglvnd' 'libgpg-error'
         'libstdc++' 'libusb' 'libx11' 'libxcb' 'wayland' 'zlib')
optdepends=('vulkan-driver: Vulkan renderer'
            'libpulse: PulseAudio and PipeWire audio output'
            'gamemode: Feral GameMode support')
provides=('lichii')
conflicts=('lichii')
options=('!strip' '!debug')
# the PGO build, which upstream recommends. Some releases have none: then
# _flavor is empty and the standard build is used. Synced by pkg.sh.
_flavor="-pgo"
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::${url}/releases/download/build-${pkgver}/lichii-linux-x86_64${_flavor}.AppImage")
source_aarch64=("${pkgname}-${pkgver}-aarch64.AppImage::${url}/releases/download/build-${pkgver}/lichii-linux-aarch64${_flavor}.AppImage")
noextract=("${pkgname}-${pkgver}-x86_64.AppImage" "${pkgname}-${pkgver}-aarch64.AppImage")
sha256sums_x86_64=('7ac03030c7a66b4b7455ee4f46426fc139e870071a6968bae4a645401b770d9b')
sha256sums_aarch64=('bd8f394347b45638b36c1bbec084815a97533f424dad7acac4d5c2eafd6c7640')

prepare() {
  chmod +x "$srcdir/${pkgname}-${pkgver}-${CARCH}.AppImage"
  "$srcdir/${pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
}

package() {
  local _root="$srcdir/squashfs-root"

  # upstream's AppImage payload, installed unchanged
  install -d "$pkgdir/opt/$pkgname"
  cp -a "$_root/usr/." "$pkgdir/opt/$pkgname/"
  chmod -R u=rwX,go=rX "$pkgdir/opt/$pkgname"

  # the binaries have a RUNPATH into the bundle and read the qt.conf next to
  # them, so they have to be exec'd where they are. eden-cli becomes
  # lichii-cli: the eden packages own /usr/bin/eden-cli.
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/lichii" << EOF
#!/bin/sh
exec /opt/$pkgname/bin/lichii "\$@"
EOF
  cat > "$pkgdir/usr/bin/lichii-cli" << EOF
#!/bin/sh
exec /opt/$pkgname/bin/eden-cli "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/lichii" "$pkgdir/usr/bin/lichii-cli"

  install -Dm644 "$_root/io.github.zortos293.lichii.desktop" \
    "$pkgdir/usr/share/applications/io.github.zortos293.lichii.desktop"
  sed -i '/^X-AppImage-/d' "$pkgdir/usr/share/applications/io.github.zortos293.lichii.desktop"
  install -Dm644 "$_root/usr/share/icons/hicolor/256x256/apps/io.github.zortos293.lichii.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.zortos293.lichii.png"
}
