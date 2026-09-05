# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgname=pori
pkgver=0.0.6
pkgrel=1
pkgdesc="Pori: Systemd Mount Manager"
arch=('x86_64')
url="https://github.com/Seafoam-Labs/Pori"
license=('GPL-3.0-only')
provides=('pori')
depends=(
    'gtk4'
    'glib2'
    'hicolor-icon-theme'
    'glibc'
    'polkit'
    'udisks2'
)
makedepends=('zig>=0.16')

# Source tarball from GitHub release
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Seafoam-Labs/Pori/archive/v${pkgver}.tar.gz")

sha256sums=('616e5855dc3ff67538c62e8637314162bb652a1db808f1df38cf86770fddec2d')

build() {
  cd "$srcdir/Pori-${pkgver}/Pori.Ui"

  zig build --verbose \
    --prefix "$srcdir/Pori-${pkgver}/out" \
    --cache-dir "$srcdir/zig-cache" \
    --global-cache-dir "$srcdir/zig-global-cache" \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe
}

package() {
  cd "$srcdir/Pori-${pkgver}"

  # Install pori binary
  install -Dm755 out/bin/pori "$pkgdir/usr/bin/pori"

  # Install icon
  install -Dm644 Pori.Ui/assets/pori.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/pori.png"

  # Install desktop entry
  cat <<'EOF' | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/com.pori.app.desktop"
[Desktop Entry]
Name=Pori
Comment=Systemd Mount Manager
Exec=/usr/bin/pori
Icon=pori
Type=Application
Categories=System;Utility;
Terminal=false
EOF
}
