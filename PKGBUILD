# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=uplink
pkgver=1.55
pkgrel=6
pkgdesc="Trust is a weakness (original CD release)"
url="https://www.introversion.co.uk/introversion/#games:~:text=Uplink"
arch=(x86_64)
license=(LicenseRef-Proprietary)
depends=(
  bash
  lib32-freetype2
  lib32-gcc-libs
  lib32-glibc
  lib32-glu
  lib32-libgl
  lib32-libjpeg6-turbo
  lib32-sdl12-compat
  lib32-sdl_mixer
  lib32-zlib
)
makedepends=(
  patchelf
)
source=(
  # Requires uplink.zip from original Uplink CD
  file://uplink.zip
  https://pkgbuild.com/~heftig/uplink/UplinkBoBCodeCard.pdf
  https://pkgbuild.com/~heftig/uplink/uplink-patch-1.55.tar.gz
)
sha256sums=('52d5b1efaecca11b400c2ab7755924a8034c09a4edd201737ba61da6bc479c02'
            'e5734f6c394b8eaa3a3449f4d4a6df0fefa4675fb8e8a515f83e4a3b710d528a'
            '147f41468b0d837a168c760d045b23eecd95a7936fca239d3bea78be0a1936a0')
noextract=(
  # contains an "uplink" executable which conflicts
  # with the "uplink" directory in the patch archive
  uplink.zip
)

prepare() {
  bsdtar -xf uplink.zip '*.dat'
  patchelf --set-rpath '$ORIGIN' uplink/lib/{uplink.bin.x86,libftgl.so.0}
}

package() {
  local gamedir="$pkgdir/usr/lib/uplink"
  install -Dm755 uplink/lib/{uplink.bin.x86,libftgl.so.0} -t "$gamedir"
  install -Dm644 *.dat -t "$gamedir"
  install -Dm644 uplink/lib/*.dat -t "$gamedir"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/uplink" <<END
#!/bin/sh
exec /usr/lib/uplink/uplink.bin.x86 "\$@"
END
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/uplink.desktop" <<END
[Desktop Entry]
Name=Uplink
GenericName=Futuristic computer crime game.
Comment=Trust is a weakness.
Encoding=UTF-8
Version=1.55
Type=Application
Terminal=false
Icon=uplink
Exec=/usr/lib/uplink/uplink.bin.x86
Categories=Application;Game;
END
  install -Dm644 uplink/uplink.png -t "$pkgdir/usr/share/pixmaps"

  install -Dm644 UplinkBoBCodeCard.pdf uplink/[^l]*.{txt,patch} -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 uplink/license.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
