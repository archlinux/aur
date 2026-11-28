# Maintainer: Kaz Walker <me@kaz.codes>
#
# Published to the AUR by .github/workflows/release.yml, which fills in pkgver
# and the checksum from each release's tag.
pkgname=allot
pkgver=0.2.1
pkgrel=1
pkgdesc="Each project's share of your Claude plan, with a budget Claude Code respects"
arch=('x86_64' 'aarch64')
url='https://github.com/KazW/allot'
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-wayland' 'libnotify')
optdepends=('claude-code: the sessions allot measures and budgets')
install=allot.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4a906cf626b1cf688bfa978b6675f371f483d4a0d333459a70c6f38bee19d267')

build() {
  cd "$pkgname-$pkgver"
  ALLOT_VERSION="$pkgver" ./.mise/tasks/build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/allot "$pkgdir/usr/bin/allot"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 pkgbuild/allot.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/allot.svg"
  install -Dm644 pkgbuild/allot.desktop "$pkgdir/usr/share/applications/allot.desktop"
  install -Dm644 pkgbuild/allot.service "$pkgdir/usr/lib/systemd/user/allot.service"
  # The Omarchy bar widget; `allot bar install` links it into the shell.
  install -Dm644 -t "$pkgdir/usr/share/allot/omarchy-plugin" \
    omarchy-plugin/manifest.json omarchy-plugin/Panel.qml omarchy-plugin/Model.js
  install -Dm644 -t "$pkgdir/usr/share/allot/omarchy-plugin/i18n" omarchy-plugin/i18n/*.json
}
