# Maintainer: Lucas Santos <hello@lsantos.dev>
# pkgver and sha256sums are rewritten by .github/workflows/release.yml on every tag.
# The tarballs are built by the same workflow and attached to the GitHub release.
pkgname=opensynapse-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Remap buttons, set DPI and lighting on Razer mice from Linux (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/khaosdoctor/opensynapse"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'libxkbcommon' 'wayland' 'libglvnd')
optdepends=('xdg-desktop-portal: file picker for profile import/export in the GUI')
provides=('opensynapse')
conflicts=('opensynapse')
source_x86_64=("$url/releases/download/v$pkgver/opensynapse-$pkgver-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/opensynapse-$pkgver-aarch64.tar.gz")
sha256sums_x86_64=('f8ce43818fb1a9aac3738870c1d831b48e3fe9f0f669043520dfb478e0a31a32')
sha256sums_aarch64=('38a397fbc9b6f6329bc932c7d6776f0e8a33dc2f812928c0193f0841a55199e0')

package() {
  cd "opensynapse-$pkgver"
  install -Dm755 opensynapse "$pkgdir/usr/bin/opensynapse"
  install -Dm755 opensynapse-gui "$pkgdir/usr/bin/opensynapse-gui"
  install -Dm644 udev/70-opensynapse.rules "$pkgdir/usr/lib/udev/rules.d/70-opensynapse.rules"
  install -Dm644 assets/opensynapse.desktop "$pkgdir/usr/share/applications/opensynapse.desktop"
  install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/opensynapse.svg"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/opensynapse.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/opensynapse/README.md"
  install -Dm644 PROTOCOL.md "$pkgdir/usr/share/doc/opensynapse/PROTOCOL.md"
  install -Dm644 -t "$pkgdir/usr/share/doc/opensynapse/protocols" devices/protocols/*.md
  install -Dm644 -t "$pkgdir/usr/share/opensynapse/devices" devices/*.jsonc
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # releases before 0.2.2 have no completions in the tarball
  if [ -d completions ]; then
    install -Dm644 completions/opensynapse.bash "$pkgdir/usr/share/bash-completion/completions/opensynapse"
    install -Dm644 completions/_opensynapse "$pkgdir/usr/share/zsh/site-functions/_opensynapse"
    install -Dm644 completions/opensynapse.fish "$pkgdir/usr/share/fish/vendor_completions.d/opensynapse.fish"
  fi
}
