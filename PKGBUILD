# Maintainer: Máté Molnár <molnar.mate@zengo.eu>
pkgname=claude-session-manager
pkgver=0.7.0
pkgrel=1
pkgdesc="Native GTK4 desktop app to manage and resume Claude Code sessions"
arch=('any')
url="https://github.com/r4nd3l/claude-session-manager"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'vte4')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('claude-code: the Claude Code CLI, required to resume sessions')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a5ed6aaeb91bdeb2b9bb3051572d14e79d5d7f8a84dc1d40044e1258462e8920')

build() {
  cd "claude-session-manager-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "claude-session-manager-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local appid=io.github.r4nd3l.ClaudeSessionManager
  # Desktop entry: launch the installed command, drop the dev working dir.
  sed -e "s|^Exec=.*|Exec=claude-session-manager|" -e "/^Path=/d" \
    "data/$appid.desktop" | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/$appid.desktop"

  install -Dm644 "data/icons/$appid.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
  install -Dm644 "data/icons/hicolor/scalable/actions/tab-close-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/actions/tab-close-symbolic.svg"
  install -Dm644 "data/$appid.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/$appid.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
