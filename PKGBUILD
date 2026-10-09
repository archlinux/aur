# Maintainer: MikolajQ <mikolaj.q@wp.pl>

pkgbase=vrgb
pkgname=(vrgb vrgb-gui)
pkgver=1.0.0
pkgrel=1
pkgdesc="RGB control for ASUS Vivobook HID LampArray (ITE5570) keyboards"
arch=(any)
url="https://github.com/vrgb-dev/vrgb"
license=(MIT)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5c89277344b3ee9fd4c5c75f2db479404d2024a996e2e542f11a3342814d1f1')

prepare() {
  cd "$pkgbase-$pkgver"
  # Package-specific copy of the restore unit: the repository's unit targets the
  # ./install.sh location (/usr/local/bin), packages install the CLI to /usr/bin.
  sed 's|/usr/local/bin/vrgb|/usr/bin/vrgb|' systemd/vrgb-restore.service > "$srcdir/vrgb-restore.service"
  grep -q '^ExecStart=/usr/bin/vrgb restore$' "$srcdir/vrgb-restore.service"
}

build() {
  cd "$pkgbase-$pkgver"
  rm -rf "$srcdir/dist-core" "$srcdir/dist-gui"
  python -m build --wheel --no-isolation --outdir "$srcdir/dist-core" .
  python -m build --wheel --no-isolation --outdir "$srcdir/dist-gui" suite
}

package_vrgb() {
  pkgdesc="RGB control for ASUS Vivobook HID LampArray (ITE5570) keyboards — Core CLI"
  depends=(python)
  install=vrgb.install

  python -m installer --destdir="$pkgdir" "$srcdir"/dist-core/*.whl
  install -Dm644 "$srcdir/vrgb-restore.service" "$pkgdir/usr/lib/systemd/user/vrgb-restore.service"
  cd "$pkgbase-$pkgver"
  install -Dm644 packaging/70-vrgb.rules "$pkgdir/usr/lib/udev/rules.d/70-vrgb.rules"
  install -Dm644 packaging/vrgb.sysusers "$pkgdir/usr/lib/sysusers.d/vrgb.conf"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_vrgb-gui() {
  pkgdesc="VRGB Suite: GUI and tray for vrgb with idle auto-off, daytime-off and rainbow"
  depends=("vrgb=$pkgver" python python-pyqt6 hicolor-icon-theme)  # vrgb is imported as a module at runtime
  optdepends=('polkit: password prompt fallback when the keyboard is not accessible'
              'libxss: idle auto-off in X11 sessions')
  install=vrgb-gui.install

  python -m installer --destdir="$pkgdir" "$srcdir"/dist-gui/*.whl
  cd "$pkgbase-$pkgver"
  install -Dm644 suite/data/vrgb-gui.desktop "$pkgdir/usr/share/applications/vrgb-gui.desktop"
  install -Dm644 suite/data/vrgb-gui.service "$pkgdir/usr/lib/systemd/user/vrgb-gui.service"
  for size in 16 24 32 48 64 128 256; do
    install -Dm644 "suite/data/icons/${size}x${size}/vrgb.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/vrgb.png"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
