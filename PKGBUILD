# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=sharpemu-bin
pkgver=0.0.7_pulse
pkgrel=1
pkgdesc="Experimental PlayStation 5 emulator (prebuilt)"
arch=('x86_64')
url="https://github.com/sharpemu/sharpemu"
license=('GPL-2.0-or-later')
# A self-contained single-file .NET app: SDL3, Skia and HarfBuzz are packed
# into the binary, FFmpeg sits in plugins/. What it loads from the system: ICU
# and OpenSSL for .NET, fontconfig for Skia, the X11 libraries and libGL for
# the Avalonia window, Wayland and xkbcommon for SDL3, and the Vulkan loader.
depends=('glibc' 'libgcc' 'libstdc++' 'icu' 'openssl' 'fontconfig'
         'vulkan-icd-loader' 'libglvnd' 'libx11' 'libice' 'libsm' 'libxcursor'
         'libxext' 'libxi' 'libxrandr' 'libxkbcommon' 'wayland')
optdepends=('vulkan-driver: the GPU driver the Vulkan loader needs')
provides=('sharpemu')
conflicts=('sharpemu')
options=('!strip')

# upstream tags use hyphens (v0.0.2-beta.4), which pkgver must not contain
_upver="${pkgver//_/-}"
noextract=("sharpemu-${_upver}-linux-x64.tar.gz")
source_x86_64=("https://github.com/sharpemu/sharpemu/releases/download/v${_upver}/sharpemu-${_upver}-linux-x64.tar.gz")
sha256sums_x86_64=('38d7507a57e891a5763e23fc68c72172d2395931f8f64f59fc522ed4ed3d761e')

package() {
  # extracted straight into pkgdir so new files in future upstream archives
  # are picked up automatically
  install -d "$pkgdir/opt/$pkgname"
  tar -xzf "$srcdir/sharpemu-${_upver}-linux-x64.tar.gz" -C "$pkgdir/opt/$pkgname"
  chmod 755 "$pkgdir/opt/$pkgname/SharpEmu"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/SharpEmu" "$pkgdir/usr/bin/sharpemu"

  install -Dm644 "$pkgdir/opt/$pkgname/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
