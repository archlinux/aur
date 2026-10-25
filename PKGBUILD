# Maintainer: Ash <xash at riseup d0t net>
pkgname=geartowns-git
pkgver=1.0.0.r0.g4dbdc3e
pkgrel=1
pkgdesc='Fujitsu FM Towns emulator and debugger with an embedded MCP server'
arch=('x86_64' 'aarch64')
url='https://github.com/drhelius/Geartowns'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'sdl3' 'libglvnd' 'hicolor-icon-theme')
makedepends=('git' 'pkgconf')
provides=('geartowns')
conflicts=('geartowns')
source=('geartowns::git+https://github.com/drhelius/Geartowns.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/geartowns"
  git describe --tags --long --abbrev=7 | sed -E 's/^v//; s/-([0-9]+)-g([a-f0-9]+)$/.r\1.g\2/'
}

build() {
  cd "$srcdir/geartowns"
  make -C platforms/linux
}

package() {
  cd "$srcdir/geartowns"

  install -Dm755 platforms/linux/geartowns "$pkgdir/usr/lib/geartowns/geartowns"
  install -d "$pkgdir/usr/bin"
  ln -s ../lib/geartowns/geartowns "$pkgdir/usr/bin/geartowns"

  install -Dm644 platforms/shared/gamecontrollerdb.txt "$pkgdir/usr/lib/geartowns/gamecontrollerdb.txt"
  install -Dm644 platforms/shared/desktop/mcp/resources/hardware/* \
    -t "$pkgdir/usr/lib/geartowns/mcp/resources/hardware"
  install -Dm644 platforms/shared/desktop/shaders/*.gshader \
    platforms/shared/desktop/shaders/*.glsl \
    platforms/shared/desktop/shaders/README.md \
    -t "$pkgdir/usr/lib/geartowns/shaders"

  install -Dm644 platforms/linux/debian/geartowns.desktop \
    "$pkgdir/usr/share/applications/geartowns.desktop"
  sed -i 's|/usr/games/geartowns|geartowns|g' \
    "$pkgdir/usr/share/applications/geartowns.desktop"
  install -Dm644 platforms/linux/debian/geartowns.xml \
    "$pkgdir/usr/share/mime/packages/geartowns.xml"
  local size
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "platforms/shared/desktop/icons/geartowns-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/geartowns.png"
  done

  install -Dm644 platforms/linux/debian/geartowns.6 \
    "$pkgdir/usr/share/man/man6/geartowns.6"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
