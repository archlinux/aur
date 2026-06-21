# Maintainer: drzoidberg <drzoidberg+aur@cloudblock.dev>
#
# Binary release PKGBUILD for polify-bin on AUR.
# Source URLs use buildhut stable redirect endpoints.
# The CI publish-aur-bin task updates pkgver, sha256sums, and b2sums
# after each successful build before pushing to AUR.

pkgname=polify-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Cross-platform music manager with multi-source library, audio fingerprinting, and ID3 tag editing"
arch=('x86_64')
url="https://buildhut.fly.dev/apps/Polify"
license=('MIT')
depends=('gtk3' 'libepoxy' 'xz' 'mpv' 'ffmpeg' 'sqlite' 'libsecret'
         'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav'
         'libayatana-appindicator' 'flac' 'opus' 'libogg' 'libvorbis')
makedepends=('patchelf')
provides=('polify')
conflicts=('polify' 'polify-git')
validpgpkeys=('EF27591A48D4B6F7C7E55F49EC8E0E98E7C13D19')
source=("polify-${pkgver}-linux-x86_64.tar.zst::https://buildhut.fly.dev/api/apps/Polify/latest/linux/x86_64/tar.zst"
        "polify-${pkgver}-linux-x86_64.tar.zst.sig::https://buildhut.fly.dev/api/apps/Polify/latest/linux/x86_64/tar.zst/signature")
sha256sums=('SKIP'
            'SKIP')
b2sums=('SKIP'
        'SKIP')

# Expected tarball layout (from make release):
#   bundle/          — Flutter Linux release bundle contents (includes onnxruntime libs)
#   polify.desktop   — XDG desktop entry
#   polify.png       — Application icon

package() {
  cd "$srcdir"

  # Application bundle
  install -d "$pkgdir/usr/lib/polify"
  cp -a bundle/* "$pkgdir/usr/lib/polify/"
  chmod -R 755 "$pkgdir/usr/lib/polify"

  # Replace link-time canonical appindicator with ayatana.
  # The CI may link against libappindicator3 but the runtime code
  # dlopens libayatana-appindicator3 first — mixing both causes segfaults.
  patchelf --replace-needed libappindicator3.so.1 libayatana-appindicator3.so.1 \
    "$pkgdir/usr/lib/polify/lib/libsystem_tray_plugin.so" 2>/dev/null || true

  # Replace Debian-style vorbis sonames with Arch sonames
  patchelf --replace-needed libvorbis.so.0.4.9 libvorbis.so.0 \
    "$pkgdir/usr/lib/polify/lib/libflutter_soloud_plugin.so" 2>/dev/null || true
  patchelf --replace-needed libvorbisfile.so.3.3.8 libvorbisfile.so.3 \
    "$pkgdir/usr/lib/polify/lib/libflutter_soloud_plugin.so" 2>/dev/null || true

  # Fix RUNPATH: remove build directory references so the linker finds
  # co-located libraries in $ORIGIN (the lib/ directory)
  # - Main binary: needs $ORIGIN/lib to find plugins
  # - Plugin .so files: need $ORIGIN to find co-located libraries
  patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/usr/lib/polify/polify" 2>/dev/null || true
  find "$pkgdir/usr/lib/polify/lib" -type f \( -name '*.so' -o -name '*.so.*' \) \
    -exec patchelf --set-rpath '$ORIGIN' {} + 2>/dev/null || true

  # Strip debug symbols and unneeded metadata
  find "$pkgdir/usr/lib/polify" -type f \( -name '*.so' -o -name '*.so.*' \
    -o -not -name '*.*' \) -exec strip --strip-unneeded {} + 2>/dev/null || true

  # Symlink to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/polify/polify "$pkgdir/usr/bin/polify"

  # Desktop entry and icon
  install -Dm644 polify.desktop "$pkgdir/usr/share/applications/polify.desktop"
  install -Dm644 polify.png "$pkgdir/usr/share/pixmaps/polify.png"
}
