# Maintainer: p4block
# TinyHand Linux port, built from the current Git branch.
pkgname=tinyhand-git
pkgver=1.0.2.r39.g28f6d8c
pkgrel=1
pkgdesc='A hand-on-a-stick presentation pointer and drawing overlay for Wayland'
arch=('any')
url='https://github.com/p4block/tinyhand'
license=('MIT')
depends=('python' 'python-gobject' 'python-cairo' 'gtk4' 'gtk4-layer-shell' 'libcanberra')
makedepends=('git')
checkdepends=('desktop-file-utils')
optdepends=('pipewire-pulse: tap sound through PipeWire'
            'pulseaudio: alternative tap sound server')
provides=('tinyhand')
conflicts=('tinyhand')
source=("tinyhand::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/tinyhand"
  printf '%s.r%s.g%s' "$(cat VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$srcdir/tinyhand"
  PYTHONDONTWRITEBYTECODE=1 python linux/test_config.py
  PYTHONDONTWRITEBYTECODE=1 python linux/test_tinyhand.py
  desktop-file-validate linux/packaging/tinyhand.desktop
}

package() {
  cd "$srcdir/tinyhand"
  install -Dm755 linux/packaging/tinyhand "$pkgdir/usr/bin/tinyhand"
  local module
  for module in tinyhand config styles toolbar; do
    install -Dm644 "linux/$module.py" "$pkgdir/usr/share/tinyhand/linux/$module.py"
  done
  install -Dm644 VERSION "$pkgdir/usr/share/tinyhand/VERSION"
  install -dm755 "$pkgdir/usr/share/tinyhand/assets/sounds"
  install -m644 assets/hand_*.png "$pkgdir/usr/share/tinyhand/assets/"
  install -m644 assets/sounds/tap_*.wav "$pkgdir/usr/share/tinyhand/assets/sounds/"
  install -Dm644 linux/packaging/tinyhand.desktop "$pkgdir/usr/share/applications/tinyhand.desktop"
  install -Dm644 .github/logo.png "$pkgdir/usr/share/icons/hicolor/160x160/apps/tinyhand.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 linux/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 linux/PLAN.md "$pkgdir/usr/share/doc/$pkgname/PLAN.md"
  install -Dm644 linux/FULL_PORT_PLAN.md "$pkgdir/usr/share/doc/$pkgname/FULL_PORT_PLAN.md"
}
