# Maintainer: Joseph R. Quinn <quinn.josephr@gmail.com>

pkgname=anime-manager-git
_pkgname=anime-manager
pkgver=0.12.4.r1.g6ccc544
pkgrel=1
pkgdesc='Scan an anime collection, play episodes in mpv and track what you have watched (git)'
arch=('x86_64')
url='https://github.com/quinnjr/anime-manager'
license=('MIT' 'CC-BY-3.0')
# Runtime libraries the binary actually links (readelf -d), plus mpv, which the player shells out to.
# SQLite is statically linked (rusqlite "bundled") and TLS is rustls, so neither is a dependency.
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'cairo' 'gdk-pixbuf2' 'libsoup3' 'dbus' 'gcc-libs' 'glibc' 'mpv')
makedepends=('git' 'rust' 'nodejs' 'pnpm' 'pkgconf')
provides=('anime-manager')
conflicts=('anime-manager')
options=('!lto')

# git-flow: `main` only receives release merges, so the integration branch is what a -git
# package is actually for. The branch is pinned rather than left implicit so the source does
# not silently follow a future change to the repository's default branch.
_repo=https://github.com/quinnjr/anime-manager.git
_branch=develop

source=("$_pkgname::git+$_repo#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # v0.12.4-1-g6ccc544 -> 0.12.4.r1.g6ccc544
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  pnpm install --frozen-lockfile
  # --no-bundle: this PKGBUILD installs the files itself, and the AppImage target needs
  # linuxdeploy, which is not a dependency worth carrying for an Arch package.
  pnpm tauri build --no-bundle
}

check() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  # The player tests drive a fake mpv through process-global environment variables.
  cargo test --manifest-path src-tauri/Cargo.toml --release -- --test-threads=1
  pnpm test
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 src-tauri/target/release/anime-manager "$pkgdir/usr/bin/anime-manager"
  # Taken from the checkout rather than shipped as a second source, so it cannot drift from
  # the upstream file the release package uses.
  install -Dm644 packaging/arch/anime-manager.desktop "$pkgdir/usr/share/applications/anime-manager.desktop"
  install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/anime-manager.png"
  install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/anime-manager.png"
  install -Dm644 'src-tauri/icons/128x128@2x.png' "$pkgdir/usr/share/icons/hicolor/256x256/apps/anime-manager.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  # MIT has no shared copy under /usr/share/licenses/common, so ship the text.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # The icon is CC BY 3.0, which requires the attribution to travel with it.
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
