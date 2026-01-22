# Maintainer: Opal Aayan <YougurtMyFace@proton.me>
pkgname=snappy-switcher
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast, animated Alt+Tab window switcher for Hyprland with MRU sorting and context grouping"
arch=('x86_64')
url="https://github.com/OpalAayan/snappy-switcher"
license=('GPL3')
depends=(
  'wayland'
  'cairo'
  'pango'
  'json-c'
  'libxkbcommon'
  'glib2'
  'librsvg'
)
makedepends=(
  'wayland-protocols'
  'pkgconf'
  'gcc'
  'make'
)
optdepends=(
  'hyprland: Required window manager'
  'tela-icon-theme: Recommended icon theme'
)
provides=("$pkgname")
conflicts=("$pkgname-git")
# Use this for release versions. For now, we SKIP the check.
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('a3e9d527f1598c0ad59b22a9a7f52bc4f8c0ed690a3a22d0fc75d5afc6df24f1')

build() {
  cd "$pkgname-$pkgver"
  # Ensure we use standard paths
  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"

  # 1. Binaries
  install -Dm755 snappy-switcher "$pkgdir/usr/bin/snappy-switcher"
  install -Dm755 scripts/snappy-wrapper.sh "$pkgdir/usr/bin/snappy-wrapper"
  install -Dm755 scripts/install-config.sh "$pkgdir/usr/bin/snappy-install-config"

  # 2. Themes
  install -d "$pkgdir/usr/share/snappy-switcher/themes"
  install -Dm644 themes/*.ini "$pkgdir/usr/share/snappy-switcher/themes/"

  # 3. System Config Defaults
  install -Dm644 config.ini.example "$pkgdir/etc/xdg/snappy-switcher/config.ini"

  # 4. Documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/ARCHITECTURE.md "$pkgdir/usr/share/doc/$pkgname/ARCHITECTURE.md"
  install -Dm644 docs/CONFIGURATION.md "$pkgdir/usr/share/doc/$pkgname/CONFIGURATION.md"
  install -Dm644 config.ini.example "$pkgdir/usr/share/doc/$pkgname/config.ini.example"

  # 5. Systemd Service (Optional, but good to include if available)
  if [ -f "snappy-switcher.service" ]; then
    install -Dm644 snappy-switcher.service "$pkgdir/usr/lib/systemd/user/snappy-switcher.service"
  fi
}
