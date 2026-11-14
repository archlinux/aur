# Maintainer: Boris Brock <gabrielborisbrock@gmail.com>
pkgname=hivemind-ai
_appname=Hivemind
pkgver=1.0.2
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
# The packages were called hivemind and hivemind-git up to 1.0.1 and ship the same desktop file
# and icons. The versioned hivemind<=1.0.1 doesn't match the unrelated hivemind-bin, which
# provides an unversioned hivemind.
conflicts=('hivemind<=1.0.1' 'hivemind-git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('68daabc997927e666ffc0ba3e2fa4f485059ad18b7fe4f73df188bae4e7e4ffc')

prepare() {
  cd "$_appname-$pkgver"
  # The source keeps the placeholder version 0.0.0, the release version comes from the tag
  tools/set-version.sh "$pkgver"
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
