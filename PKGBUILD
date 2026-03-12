# Maintainer: tr0llslay3r <https://github.com/tr0llslay3r>
pkgname=snazzgit-git
pkgver=0.2.8
pkgrel=1
pkgdesc="A snazzy cross-platform Git GUI client (built from source)"
arch=('x86_64')
url="https://github.com/tr0llslay3r/SnazzGit"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'openssl')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'cmake' 'pkgconf' 'patchelf' 'librsvg' 'libappindicator-gtk3')
provides=('snazzgit')
conflicts=('snazzgit' 'snazzgit-bin')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd SnazzGit
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || echo "$pkgver"
}

build() {
  cd SnazzGit
  npm ci
  npm run build
  cd src-tauri
  # Reset C build flags from makepkg.conf that break vendored cmake builds
  # (e.g. -Werror=format-security, -D_FORTIFY_SOURCE=3)
  # Rust compilation is unaffected — it uses RUSTFLAGS, not CFLAGS
  export CFLAGS="-march=native -O2 -pipe"
  export CXXFLAGS="$CFLAGS"
  unset LDFLAGS
  cargo build --release
}

package() {
  cd SnazzGit

  install -Dm755 "src-tauri/target/release/snazzgit" "$pkgdir/usr/bin/snazzgit"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/snazzgit.png"
  install -Dm644 "packaging/snazzgit.desktop" "$pkgdir/usr/share/applications/snazzgit.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
