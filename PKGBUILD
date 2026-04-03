# Maintainer: Pavel Dobiáš <mail at paveldobias dot eu>

pkgname=cubyz
pkgver=0.2.0
pkgrel=1
pkgdesc='An open-world adventure game where creativity knows no bounds!'
arch=('x86_64' 'aarch64')
url='https://www.cubyz.net/'
license=('GPL-3.0')
depends=('glibc')
makedepends=('curl' 'tar')
provides=("${pkgname}")
conflicts=(
  "${pkgname}"
  "${pkgname}-bin"
)
backup=("etc/$pkgname/launchConfig.zon")

source=(
  "cubyz.sh"
  "cubyz.desktop"
  "$pkgname-$pkgver.zip::https://github.com/PixelGuys/Cubyz/archive/refs/tags/$pkgver.zip"
)
sha256sums=(
  '4e09f9de852c3c3f8a7a5184515f82ed3da8b592130fb7cf07c64ec9456b8259'
  'ec3d1bc6c14c1d0c3cbfaf1a998301d81ad28ce1ead86186a49a67d0b8e5873b'
  '879157516d0a4c33302b28717a5309888afc1408415bd49f7b2b5f0b9ccd74c7'
)

build() {
  cd "$srcdir/Cubyz-$pkgver"

  # Install zig
  chmod +x scripts/install_compiler_linux.sh
  scripts/install_compiler_linux.sh
  export PATH="$srcdir/Cubyz-$pkgver/compiler/zig:$PATH"

  # Build
  _CUBYZ_CPU=${_CUBYZ_CPU:-native}
  zig build \
    -Dtarget=${CARCH}-linux-gnu \
    -Doptimize=ReleaseFast \
    -Drelease=true \
    -Dcpu=${_CUBYZ_CPU}
}

package() {
  cd "$srcdir/Cubyz-$pkgver"

  # Package Directories
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/pixmaps"
  install -dm755 "$pkgdir/etc/$pkgname"

  # Binary & assets
  install -m755 "zig-out/bin/Cubyz" "$pkgdir/usr/lib/$pkgname/"
  cp -r assets "$pkgdir/usr/lib/$pkgname/"

  # Launch config moved to /etc and symlinked
  install -m644 launchConfig.zon \
    "$pkgdir/etc/$pkgname/launchConfig.zon"

  ln -s /etc/$pkgname/launchConfig.zon \
    "$pkgdir/usr/lib/$pkgname/launchConfig.zon"

  # Launcher script
  install -m755 "$srcdir/cubyz.sh" \
    "$pkgdir/usr/bin/cubyz"

  # Desktop integration
  install -m644 "$srcdir/cubyz.desktop" \
    "$pkgdir/usr/share/applications/cubyz.desktop"

  install -m644 "assets/cubyz/logo.png" \
    "$pkgdir/usr/share/pixmaps/cubyz.png"
}
