# Maintainer: DavidCarliez
pkgname=ironkey-vp50-git
pkgver=r3.f852b25
pkgrel=1
pkgdesc='Native Linux unlock and desktop auto-mount helper for Kingston IronKey VaultPrivacy50'
arch=('any')
url='https://github.com/DavidCarliez/ironkey-vp50'
license=('MIT')
depends=('openssl' 'procps-ng' 'python' 'sudo' 'systemd' 'udisks2' 'util-linux')
makedepends=('git')
optdepends=(
  'kdialog: KDE password prompts and notifications'
  'zenity: GNOME/GTK password prompts and notifications'
  'libnotify: fallback desktop notifications'
)
provides=('ironkey-vp50')
conflicts=('ironkey-vp50')
install='ironkey-vp50.install'
source=('ironkey-vp50::git+https://github.com/DavidCarliez/ironkey-vp50.git')
sha256sums=('SKIP')

pkgver() {
  cd ironkey-vp50
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd ironkey-vp50

  install -Dm755 ironkey_vp50.py "$pkgdir/usr/lib/ironkey-vp50/ironkey_vp50.py"
  install -Dm755 ironkey_vp50_desktop_agent.py "$pkgdir/usr/lib/ironkey-vp50/ironkey_vp50_desktop_agent.py"
  install -Dm755 ironkey_vp50_kde_agent.py "$pkgdir/usr/lib/ironkey-vp50/ironkey_vp50_kde_agent.py"
  install -Dm755 install-desktop.sh "$pkgdir/usr/lib/ironkey-vp50/install-desktop.sh"

  install -Dm644 desktop/ironkey-vp50-agent.desktop "$pkgdir/usr/share/ironkey-vp50/ironkey-vp50-agent.desktop"
  install -Dm644 desktop/90-ironkey-vp50.rules "$pkgdir/usr/lib/udev/rules.d/90-ironkey-vp50.rules"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/bin"

  cat > "$pkgdir/usr/bin/ironkey-vp50" <<'EOF'
#!/bin/sh
exec python3 /usr/lib/ironkey-vp50/ironkey_vp50.py "$@"
EOF

  cat > "$pkgdir/usr/bin/ironkey-vp50-desktop-agent" <<'EOF'
#!/bin/sh
exec python3 /usr/lib/ironkey-vp50/ironkey_vp50_desktop_agent.py "$@"
EOF

  cat > "$pkgdir/usr/bin/ironkey-vp50-kde-agent" <<'EOF'
#!/bin/sh
exec ironkey-vp50-desktop-agent "$@"
EOF

  cat > "$pkgdir/usr/bin/ironkey-vp50-root-unlock" <<'EOF'
#!/bin/sh
set -eu
case "${1:-}" in
  /dev/sg[0-9]|/dev/sg[0-9][0-9])
    exec python3 /usr/lib/ironkey-vp50/ironkey_vp50.py unlock --sg "$1" --pvc --password-stdin --yes
    ;;
  *)
    echo "usage: ironkey-vp50-root-unlock /dev/sgN" >&2
    exit 2
    ;;
esac
EOF

  cat > "$pkgdir/usr/bin/ironkey-vp50-install-desktop" <<'EOF'
#!/bin/sh
export IRONKEY_VP50_SYSTEM_INSTALL=1
exec /usr/lib/ironkey-vp50/install-desktop.sh "$@"
EOF

  chmod 755 \
    "$pkgdir/usr/bin/ironkey-vp50" \
    "$pkgdir/usr/bin/ironkey-vp50-desktop-agent" \
    "$pkgdir/usr/bin/ironkey-vp50-kde-agent" \
    "$pkgdir/usr/bin/ironkey-vp50-root-unlock" \
    "$pkgdir/usr/bin/ironkey-vp50-install-desktop"
}
