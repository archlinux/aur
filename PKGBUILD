# Maintainer: oysterAV contributors
# shellcheck disable=SC2034
pkgname=oysterav
pkgver=0.2.2
pkgrel=1
pkgdesc="Linux security orchestrator: oyst-cli backend + oysterAV GTK4 GUI"
arch=('any')
url="https://github.com/asafelobotomy/oysterAV"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-click'
  'python-pydantic'
  'python-defusedxml'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'polkit'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
optdepends=(
  'clamav: required scanner spine'
  'rkhunter: rootkit checks'
  'chkrootkit: rootkit checks'
  'lynis: hardening audits'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3bf3eedb518bf5559f007a692c8822c42c33e17a62b44e3911c4a683805cd5ac')

build() {
  cd "oysterAV-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "oysterAV-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 /dev/stdin "$pkgdir/usr/lib/oysterav/oyst-helper" <<'EOF'
#!/usr/bin/env python3
from oyst_core.privileged.oyst_helper import main
main()
EOF
  install -d "$pkgdir/usr/bin"
  ln -s ../lib/oysterav/oyst-helper "$pkgdir/usr/bin/oyst-helper"

  install -Dm644 packaging/oysterav/io.github.asafelobotomy.OysterAV.desktop \
    "$pkgdir/usr/share/applications/io.github.asafelobotomy.OysterAV.desktop"
  install -Dm644 packaging/oysterav/flatpak/io.github.asafelobotomy.OysterAV.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.asafelobotomy.OysterAV.metainfo.xml"
  install -Dm644 packaging/polkit/io.github.asafelobotomy.policy \
    "$pkgdir/usr/share/polkit-1/actions/io.github.asafelobotomy.policy"

  for size in 16 32 48 128 256; do
    install -Dm644 "branding/hicolor/${size}x${size}/apps/oysterav.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/oysterav.png"
  done
  install -Dm644 branding/hicolor/512x512/apps/oysterav.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/oysterav.png"
}
