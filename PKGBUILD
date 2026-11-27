# Maintainer: FrogSnot
pkgname=solidcraft-bin
pkgver=0.51.1
pkgrel=1
pkgdesc='Open-source parametric 3D CAD (binary release)'
arch=(x86_64 aarch64)
url='https://github.com/tangency-labs/solidcraft'
license=('MIT OR Apache-2.0')
# Binaries link only glibc and libgcc_s (ELF NEEDED: libgcc_s/libm/libc, covered by glibc + libgcc).
# Windowing (X11/Wayland, xkbcommon), GPU (Vulkan/EGL/GL) and D-Bus are dlopen'ed at runtime, so they
# cannot be detected from ELF headers: listed by hand here, mirroring upstream's packaging/linux/nfpm.yaml.
depends=(glibc libgcc hicolor-icon-theme
         dbus libglvnd vulkan-icd-loader wayland
         libx11 libxcb libxcursor libxi libxkbcommon libxkbcommon-x11 libxrandr)
optdepends=('vulkan-driver: Vulkan rendering (falls back to OpenGL/EGL without one)'
            'xdg-desktop-portal: open/save dialogs and file chooser portals on Wayland/desktop sandboxes')
options=(!strip !debug)
provides=("solidcraft=$pkgver" solvecraft)
conflicts=(solidcraft solvecraft)
source_x86_64=("https://github.com/tangency-labs/solidcraft/releases/download/v$pkgver/solidcraft-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/tangency-labs/solidcraft/releases/download/v$pkgver/solidcraft-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('47b42d7e3e3f5a8ecf35b4c6848b5d17b412c21c06de99538cae89720d18efca')
sha256sums_aarch64=('42870994d391b800952944d5ea29954f29b6ccab2341856de61d3cbbed78f070')

package() {
  cd "solidcraft-$pkgver-linux-$CARCH"

  # The tarball is already an FHS tree (bin/, share/). package() runs under fakeroot, so the
  # archive records root ownership regardless of the build user; modes come from the tarball
  # (755 bins, 644 data) and are preserved by cp -r.
  install -d "$pkgdir/usr"
  cp -r bin share "$pkgdir/usr/"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    share/doc/solidcraft/{LICENSE-MIT,LICENSE-APACHE,NOTICE,THIRD-PARTY-LICENSES.txt}
}
