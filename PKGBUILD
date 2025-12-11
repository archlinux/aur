# Maintainer: arcceus <https://github.com/arcceus>
pkgname=phonecall-popup-git
_pkgname=phonecall-popup
pkgver=0
pkgrel=1
pkgdesc="GTK popup for PipeWire telephony calls with answer/hangup"
arch=('any')
url="https://github.com/arcceus/phonecall-popup"
license=('MIT')
depends=('python' 'python-dbus' 'python-gobject' 'pipewire')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/arcceus/${_pkgname}.git")
sha256sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"

  install -Dm755 gtk_popup.py \
    "$pkgdir/usr/lib/${_pkgname}/gtk_popup.py"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/${_pkgname}" <<'EOF'
#!/usr/bin/env bash
exec python3 /usr/lib/phonecall-popup/gtk_popup.py "$@"
EOF

  install -Dm644 /dev/stdin \
    "$pkgdir/usr/lib/systemd/user/${_pkgname}.service" <<'EOF'
[Unit]
Description=Phone call popup
After=graphical-session.target

[Service]
ExecStart=/usr/bin/phonecall-popup
Restart=on-failure

[Install]
WantedBy=default.target
EOF

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
