# Maintainer: FrogSnot
pkgname=fieldcraft-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='Open-source finite-element / CAE modeler: mesh, set up, solve and export decks (binary release)'
arch=(x86_64)
url='https://github.com/tangency-labs/fieldcraft'
license=('MIT OR Apache-2.0')
# Binaries link only glibc and libgcc_s (ELF NEEDED: libgcc_s/libm/libc, covered by glibc + libgcc).
# Windowing (X11/Wayland, xkbcommon), GPU (Vulkan/EGL/GL) and D-Bus are dlopen'ed at runtime, so they
# cannot be detected from ELF headers: verified by strings on the 0.7.0 x86_64 binaries (same
# dependency family as solidcraft-bin; fieldcraft has no libXrandr dlopen, so it is not listed).
depends=(glibc libgcc hicolor-icon-theme
         dbus libglvnd vulkan-icd-loader wayland
         libx11 libxcb libxcursor libxi libxkbcommon libxkbcommon-x11)
optdepends=('vulkan-driver: Vulkan rendering (falls back to OpenGL/EGL without one)'
            'xdg-desktop-portal: open/save dialogs and file chooser portals on Wayland/desktop sandboxes')
options=(!strip !debug)
provides=("fieldcraft=$pkgver")
conflicts=(fieldcraft)
source=("https://github.com/tangency-labs/fieldcraft/releases/download/v$pkgver/fieldcraft-$pkgver-linux-$CARCH.tar.gz")
sha256sums=('0ae65f04265960cea1df5746abd0553bb4d4ad4656cb93c3574b0b612e3c0d08')

package() {
  cd "fieldcraft-$pkgver-linux-$CARCH"

  # The tarball is already an FHS tree (bin/, share/). package() runs under fakeroot, so the
  # archive records root ownership regardless of the build user; modes come from the tarball
  # (755 bins, 644 data) and are preserved by cp -r.
  install -d "$pkgdir/usr"
  cp -r bin share "$pkgdir/usr/"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    share/doc/fieldcraft/{LICENSE-MIT,LICENSE-APACHE,NOTICE,THIRD-PARTY-LICENSES.txt}
}
