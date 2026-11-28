# Maintainer: oysterAV contributors
# shellcheck disable=SC2034
pkgname=oysterav
pkgver=0.6.3
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
  'clamav'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
optdepends=(
  'rkhunter: rootkit checks'
  'chkrootkit: rootkit checks'
  'unhide: hidden process and port checks'
  'lynis: hardening audits'
  'inotify-tools: maldet real-time monitoring'
  'fail2ban: SSH brute-force protection'
  'ufw: firewall tab (or firewalld)'
  'uq: security tile and Settings page in the uQ desktop'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b2afb3b047b0f903709e5791ed62122b8af14c5d2de4ed15c2e748e5ebb17e9')

conflicts+=('uq<0.3.41')  # uq-compat: from uQ's compat/family.toml

build() {
  cd "oysterAV-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "oysterAV-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 /dev/stdin "$pkgdir/usr/lib/oysterav/oyst-helper" <<'EOF'
#!/usr/bin/python3 -I
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

  # uQ integration (inert without uQ): uq/README.md lists what each file adds.
  install -Dm644 -t "$pkgdir/usr/share/uq/shell/widgets/oysterav" uq/widgets/oysterav/*
  install -Dm644 -t "$pkgdir/usr/share/uq/settings/pages/oysterav-security" \
    uq/pages/oysterav-security/*

  for size in 16 32 48 128 256; do
    install -Dm644 "branding/hicolor/${size}x${size}/apps/oysterav.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/oysterav.png"
  done
  install -Dm644 branding/hicolor/512x512/apps/oysterav.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/oysterav.png"
}
