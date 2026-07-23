# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=sharpemu-bin
pkgver=0.0.2_beta.5
pkgrel=1
pkgdesc="Experimental PlayStation 5 emulator (prebuilt)"
arch=('x86_64')
url="https://github.com/sharpemu/sharpemu"
license=('GPL-2.0-or-later')
# The self-contained .NET binary bundles its own libglfw.so.3, which in turn
# dlopens the X11/Wayland client libraries at runtime.
depends=('glibc' 'gcc-libs' 'icu' 'openssl' 'vulkan-icd-loader'
         'libx11' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr'
         'libxkbcommon' 'wayland')
provides=('sharpemu')
conflicts=('sharpemu')
options=('!strip')

# upstream tags use hyphens (v0.0.2-beta.4), which pkgver must not contain
_upver="${pkgver//_/-}"
noextract=("sharpemu-${_upver}-linux-x64.tar.gz")
source_x86_64=("https://github.com/sharpemu/sharpemu/releases/download/v${_upver}/sharpemu-${_upver}-linux-x64.tar.gz")
sha256sums_x86_64=('5e75173da220832e8ca56d4b88fd7effc77772da9b785bfb721ff138d5664cc4')

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
