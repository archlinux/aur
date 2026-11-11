# Maintainer: Boris Brock <gabrielborisbrock@gmail.com>
pkgname=hivemind-git
_appname=Hivemind
pkgver=1.0.0.r0.g1b9d797
pkgrel=1
pkgdesc='Kanban board for running AI coding agents (Claude Code, OpenCode) across projects (development version)'
arch=('x86_64' 'aarch64')
url='https://github.com/BorisBrock/Hivemind'
license=('MIT')
depends=('cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libsoup3' 'webkit2gtk-4.1')
makedepends=('cargo' 'git' 'nodejs' 'npm')
optdepends=('claude-code: Claude Code agent'
            'opencode: OpenCode agent')
provides=('hivemind')
conflicts=('hivemind' 'hivemind-bin')
options=('!lto')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_appname"
  git describe --long --tags --match 'v[0-9]*' --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_appname"
  npm ci --no-audit --no-fund
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_appname"
  # The .deb bundle stages the binary, desktop file and icons in the /usr layout
  npm run tauri build -- --bundles deb
}

package() {
  cd "$_appname"
  cp -a src-tauri/target/release/bundle/deb/*/data/usr "$pkgdir/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
