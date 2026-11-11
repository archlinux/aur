# Maintainer: Boris Brock <gabrielborisbrock@gmail.com>
pkgname=hivemind
_appname=Hivemind
pkgver=1.0.0
pkgrel=1
pkgdesc='Kanban board for running AI coding agents (Claude Code, OpenCode) across projects'
arch=('x86_64' 'aarch64')
url='https://github.com/BorisBrock/Hivemind'
license=('MIT')
depends=('cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libsoup3' 'webkit2gtk-4.1')
makedepends=('cargo' 'nodejs' 'npm')
optdepends=('claude-code: Claude Code agent'
            'opencode: OpenCode agent')
# hivemind-bin is an unrelated process manager that also installs /usr/bin/hivemind
conflicts=('hivemind-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5352d6ee258065a6f136851f5198b704b4f65221f793b7f1fbbeb23806a18deb')

prepare() {
  cd "$_appname-$pkgver"
  npm ci --no-audit --no-fund
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_appname-$pkgver"
  # The .deb bundle stages the binary, desktop file and icons in the /usr layout
  npm run tauri build -- --bundles deb
}

package() {
  cd "$_appname-$pkgver"
  cp -a src-tauri/target/release/bundle/deb/*/data/usr "$pkgdir/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
