# Maintainer: 0443n <noreply@github.com>
# Prebuilt binaries of burrow (CLI + desktop app + VPN helper), pulled from the
# GitHub release tarball — installs in seconds, no compiling. The from-source
# package is `burrow-tunnel`. On a release the CI bumps pkgver + refreshes the
# checksum (updpkgsums) and regenerates .SRCINFO automatically.
_pkgname=burrow
pkgname=burrow-tunnel-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Turn any SSH server into a local proxy and a system-wide VPN (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/0443n/burrow"
license=('GPL-3.0-or-later')
# Runtime libs the desktop app dlopens (see burrow-tunnel); polkit for the helper.
depends=('polkit' 'fontconfig' 'libglvnd' 'wayland' 'libxkbcommon'
         'libx11' 'libxcb' 'libxcursor' 'libxi' 'hicolor-icon-theme')
provides=('burrow-tunnel')
conflicts=('burrow-tunnel')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('c09da47ed6b53b22cd023b9cb175d7bd4e5c3a1dc21367cbd91898f509b2a02e')

package() {
  cd "$srcdir/${_pkgname}-${pkgver}-x86_64-linux"
  install -Dm755 burrow        "$pkgdir/usr/bin/burrow"
  install -Dm755 burrow-ui     "$pkgdir/usr/bin/burrow-ui"
  install -Dm755 burrow-helper "$pkgdir/usr/bin/burrow-helper"
  install -Dm644 burrow.desktop          "$pkgdir/usr/share/applications/burrow.desktop"
  install -Dm644 io.burrow.helper.policy "$pkgdir/usr/share/polkit-1/actions/io.burrow.helper.policy"
  install -Dm644 burrow.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/burrow.svg"
  for s in 16 24 32 48 64 128 256 512; do
    install -Dm644 "burrow-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/burrow.png"
  done
}
