# Maintainer: Máté Molnár <molnar.mate@zengo.eu>
pkgname=agent-session-manager
pkgver=1.1.0
pkgrel=1
pkgdesc="Native GTK4 terminal workspace for AI coding agents (Claude Code, Cursor)"
arch=('any')
url="https://github.com/r4nd3l/agent-session-manager"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'vte4')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('claude-code: resume Claude Code sessions'
            'cursor-agent: resume Cursor sessions')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b5c01039366ed4c3a177b4dc163a22e02bb3ca8657ea290655fef89fc8ae911')

build() {
  cd "agent-session-manager-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "agent-session-manager-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local appid=io.github.r4nd3l.AgentSessionManager
  # Desktop entry: launch the installed command, drop the dev working dir.
  sed -e "s|^Exec=.*|Exec=agent-session-manager|" -e "/^Path=/d" \
    "data/$appid.desktop" | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/$appid.desktop"

  install -Dm644 "data/icons/$appid.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
  for action_icon in data/icons/hicolor/scalable/actions/*.svg; do
    install -Dm644 "$action_icon" \
      "$pkgdir/usr/share/icons/hicolor/scalable/actions/$(basename "$action_icon")"
  done
  install -Dm644 "data/$appid.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/$appid.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
