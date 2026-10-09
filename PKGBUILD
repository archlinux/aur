# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=snapx-bin
pkgver=0.4.0
pkgrel=2
pkgdesc="Screenshot tool that handles images, text, and video - ShareX fork, Avalonia UI (upstream binary)"
arch=('x86_64')
url="https://github.com/SnapXL/SnapX"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme')
provides=('snapx-ui')
conflicts=('snapx-ui')
options=('!strip' '!debug')
# Upstream asset names embed build metadata that cannot be derived from
# pkgver, so the exact name is tracked here and refreshed automatically.
_asset="SnapX-UI-Release-Linux-0.4.0-alpha.0+g7eafb0f-X64.tar.zst"
source=("${pkgname}-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/${_asset}"
        "${pkgname}-${pkgver}-src.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.zst")
sha256sums=('1cbecd1caca21e611030eedbb8e5a43cc4bf62d55cfa56a2e5c2ac31b3d21e35' 'd85f4d2c3ea55ed5040f166fdf44ce03dd0270dc6ab05ee26771dbd02eaacc06')

package() {
  # upstream's self-contained bundle, installed unchanged
  install -d "$pkgdir/opt/snapx"
  bsdtar -xpf "$srcdir/${pkgname}-${pkgver}.tar.zst" -C "$pkgdir/opt/snapx"
  chmod 755 "$pkgdir/opt/snapx/snapx-ui"

  # upstream's launcher resolves its own directory, so a symlink from
  # /usr/bin would break it - use a wrapper instead
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/snapx-ui" << 'EOF'
#!/bin/sh
exec /opt/snapx/snapx-ui "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/snapx-ui"

  # desktop entry, icons and metainfo ship in the source tree only
  cp -a "$srcdir/SnapX-${pkgver}/packaging/usr/share" "$pkgdir/usr/"

  install -Dm644 "$pkgdir/opt/snapx/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
