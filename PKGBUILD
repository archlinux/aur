# Maintainer: FrogSnot
pkgname=solidcraft-bin
pkgver=0.18.2
pkgrel=1
pkgdesc='Open-source parametric 3D CAD (binary release)'
arch=(x86_64 aarch64)
url='https://github.com/tangency-labs/solidcraft'
license=('MIT OR Apache-2.0')
# Binaries are mostly static: ELF NEEDED is only libgcc_s/libm/libc, covered by glibc + gcc-libs.
# Windowing (X11/Wayland, xkbcommon) and GPU (Vulkan/EGL/GL) are dlopen'ed at runtime, so they
# cannot be detected from ELF headers: surface them as optdepends.
depends=(glibc gcc-libs hicolor-icon-theme)
optdepends=('mesa-vulkan-drivers: Vulkan driver for GPU rendering (or another Vulkan driver)'
            'vulkan-radeon: Vulkan driver for AMD GPUs'
            'vulkan-intel: Vulkan driver for Intel GPUs'
            'nvidia-utils: Vulkan driver for NVIDIA GPUs'
            'xdg-desktop-portal: open/save dialogs and file chooser portals on Wayland/desktop sandboxes')
options=(!strip !debug)
provides=(solidcraft solvecraft)
conflicts=(solidcraft solvecraft)
source_x86_64=("https://github.com/tangency-labs/solidcraft/releases/download/v$pkgver/solidcraft-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/tangency-labs/solidcraft/releases/download/v$pkgver/solidcraft-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('9d0c922ac72204f34ad22ca7a171be78016ab002e304ace3c07d34d187d830ff')
sha256sums_aarch64=('d07eaed0ef4fc2feed7ee66837894d8b00135ea7de6fdf6a71c67975a583b0c3')

package() {
  cd "solidcraft-$pkgver-linux-$CARCH"

  install -Dm755 bin/solidcraft      "$pkgdir/usr/bin/solidcraft"
  install -Dm755 bin/solidcraft-cli  "$pkgdir/usr/bin/solidcraft-cli"
  # Compat shim: the pre-0.5 CLI name; upstream ships it so existing scripts and MCP configs keep working (docs/compatibility.md sec. 5).
  install -Dm755 bin/solvecraft-cli  "$pkgdir/usr/bin/solvecraft-cli"

  for f in share/applications/*; do
    install -Dm644 "$f" "$pkgdir/usr/share/applications/$(basename "$f")"
  done
  find share/icons -type f | while read -r f; do
    install -Dm644 "$f" "$pkgdir/usr/share/icons/${f#share/icons/}"
  done
  for f in share/metainfo/*; do
    install -Dm644 "$f" "$pkgdir/usr/share/metainfo/$(basename "$f")"
  done
  for f in share/mime/packages/*; do
    install -Dm644 "$f" "$pkgdir/usr/share/mime/packages/$(basename "$f")"
  done

  install -Dm644 share/doc/solidcraft/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 share/doc/solidcraft/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 share/doc/solidcraft/NOTICE         "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 share/doc/solidcraft/THIRD-PARTY-LICENSES.txt "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES.txt"
}
