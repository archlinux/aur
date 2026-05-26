# Maintainer: director <noreply@devbulle>
#
# Binary release PKGBUILD for lafifi-bin on AUR.
# Source URLs use buildhut stable redirect endpoints.
# The CI publish-aur-bin task updates pkgver before pushing to AUR.

pkgname=lafifi-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Multi-chain, multi-wallet crypto portfolio tracker – prebuilt binary"
arch=('x86_64')
url="https://buildhut.fly.dev/apps/lafifi"
license=('MIT')
depends=('gtk3' 'libepoxy' 'xz' 'sqlite' 'libsecret'
         'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav'
         'libayatana-appindicator')
makedepends=('patchelf')
provides=('lafifiv3')
conflicts=('lafifiv3' 'lafifi-flutter-git')
validpgpkeys=('EF27591A48D4B6F7C7E55F49EC8E0E98E7C13D19')
source=("lafifi-${pkgver}-linux-x86_64.tar.zst::https://buildhut.fly.dev/api/apps/Lafifi/latest/linux/x86_64/tar.zst"
        "lafifi-${pkgver}-linux-x86_64.tar.zst.sig::https://buildhut.fly.dev/api/apps/Lafifi/latest/linux/x86_64/tar.zst/signature")
sha256sums=('SKIP'
            'SKIP')
b2sums=('SKIP'
        'SKIP')

# Expected tarball layout (from make release):
#   bundle/          — Flutter Linux release bundle contents
#   lafifi.desktop   — XDG desktop entry
#   lafifi.png       — Application icon

package() {
  cd "$srcdir"

  # Application bundle
  install -d "$pkgdir/usr/lib/lafifiv3"
  cp -a bundle/* "$pkgdir/usr/lib/lafifiv3/"
  chmod -R 755 "$pkgdir/usr/lib/lafifiv3"

  # Fix RUNPATH: remove build directory references so the linker finds
  # co-located libraries in $ORIGIN (the lib/ directory)
  patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/usr/lib/lafifiv3/lafifiv3" 2>/dev/null || true
  find "$pkgdir/usr/lib/lafifiv3/lib" -type f \( -name '*.so' -o -name '*.so.*' \) \
    -exec patchelf --set-rpath '$ORIGIN' {} + 2>/dev/null || true

  # Strip debug symbols and unneeded metadata
  find "$pkgdir/usr/lib/lafifiv3" -type f \( -name '*.so' -o -name '*.so.*' \
    -o -not -name '*.*' \) -exec strip --strip-unneeded {} + 2>/dev/null || true

  # Symlink to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/lafifiv3/lafifiv3 "$pkgdir/usr/bin/lafifiv3"

  # Desktop entry and icon
  install -Dm644 lafifi.desktop "$pkgdir/usr/share/applications/lafifi.desktop"
  install -Dm644 lafifi.png "$pkgdir/usr/share/pixmaps/lafifi.png"
}
