pkgname=codex-monitor-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Tauri desktop app for orchestrating Codex agents across local workspaces"
arch=('x86_64')
url="https://github.com/tomdavenport/CodexMonitor"
license=('MIT')
depends=(
  'gtk3'
  'libgit2'
  'libssh2'
  'libxkbcommon'
  'librsvg'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'clang'
  'cmake'
  'git'
  'libgit2'
  'libssh2'
  'nodejs'
  'npm'
  'pkgconf'
  'rust'
)
optdepends=(
  'codex: Codex app-server binary'
  'gh: GitHub issues + PR integration'
)
provides=('codex-monitor')
conflicts=('codex-monitor' 'codex-monitor-bin')
source=("git+https://github.com/tomdavenport/CodexMonitor.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/CodexMonitor"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/CodexMonitor"
  export LIBGIT2_SYS_USE_PKG_CONFIG=1
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  npm ci --no-audit --no-fund
  npm run build

  cd src-tauri
  cargo build --release --locked --features custom-protocol
}

package() {
  cd "$srcdir/CodexMonitor"
  install -Dm755 "src-tauri/target/release/codex-monitor" \
    "$pkgdir/usr/bin/codex-monitor"
  install -Dm644 "aur-git/codex-monitor.desktop" \
    "$pkgdir/usr/share/applications/codex-monitor.desktop"
  install -Dm644 "src-tauri/icons/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/codex-monitor.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
