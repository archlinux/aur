# Maintainer: director <noreply@devbulle>
#
# Binary release PKGBUILD — publish as lafifi-bin on AUR.
# Update source=, sha256sums, and b2sums with each new release.
#
# To create a release tarball:
#   make release
#
# Upload dist/lafifi-<ver>-linux-x86_64.tar.zst and .tar.zst.sig
# to a stable URL, then update source=, sha256sums, and b2sums below.

pkgname=lafifi-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Multi-chain, multi-wallet crypto portfolio tracker – prebuilt binary"
arch=('x86_64')
url="https://git.sr.ht/~drzoidberg/Lafifi"
license=('MIT')
depends=('gtk3' 'libepoxy' 'xz' 'sqlite' 'libsecret'
         'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav'
         'libayatana-appindicator')
makedepends=('patchelf')
provides=('lafifiv3')
conflicts=('lafifiv3' 'lafifi-flutter-git')
validpgpkeys=('EF27591A48D4B6F7C7E55F49EC8E0E98E7C13D19')
# TODO: replace with your stable artifact URL and checksums
source=("lafifi-${pkgver}-linux-x86_64.tar.zst::https://todo.example.com/lafifi-${pkgver}-linux-x86_64.tar.zst"
        "lafifi-${pkgver}-linux-x86_64.tar.zst.sig::https://todo.example.com/lafifi-${pkgver}-linux-x86_64.tar.zst.sig")
sha256sums=('0000000000000000000000000000000000000000000000000000000000000000'
            'SKIP')
b2sums=('00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
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
