# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>
pkgname=wswitch-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast, Alt+Tab window switcher for wayland compositors"
arch=('x86_64')
url="https://github.com/DreamMaoMao/wswitch"
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
  'tela-icon-theme: Recommended icon theme'
)
provides=("wswitch")
conflicts=("wswitch")
# Use this for release versions. For now, we SKIP the check.
source=("$pkgname::git+https://github.com/DreamMaoMao/wswitch.git")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  # Ensure we use standard paths
  make PREFIX=/usr
}

package() {
  cd "$pkgname"

  # 1. Binaries
  install -Dm755 wswitch "$pkgdir/usr/bin/wswitch"
  install -Dm755 scripts/install-config.sh "$pkgdir/usr/bin/wswitch-install-config"

  # 2. Themes
  install -d "$pkgdir/usr/share/wswitch/themes"
  install -Dm644 themes/*.ini "$pkgdir/usr/share/wswitch/themes/"

  # 3. System Config Defaults
  install -Dm644 config.ini.example "$pkgdir/etc/xdg/wswitch/config.ini"

  # 4. Documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 config.ini.example "$pkgdir/usr/share/doc/$pkgname/config.ini.example"

  # 5. Systemd Service (Optional, but good to include if available)
  if [ -f "wswitch.service" ]; then
    install -Dm644 wswitch.service "$pkgdir/usr/lib/systemd/user/wswitch.service"
  fi
}
