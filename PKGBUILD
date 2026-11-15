# Maintainer: ExtremTechniker <aur@extremtechniker.io>
pkgname=forge-ide-git
pkgver=0.1.1beta.4.r2296.g8bca1008
pkgrel=1
pkgdesc="PHPStorm-style IDE for PHP, web and Lua (built from the latest source)"
arch=('x86_64' 'aarch64')
url="https://github.com/stdimnet/forge"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl' 'hicolor-icon-theme')
makedepends=('git' 'rust' 'cargo' 'nodejs' 'pnpm' 'librsvg' 'xdotool' 'base-devel')
provides=('forge-ide')
conflicts=('forge-ide' 'forge' 'foundry')
# '!lto': makepkg's LTO flags turn C dependencies (aws-lc-sys) into GCC bitcode that rust-lld
# cannot link.
options=('!strip' '!debug' '!lto')
source=("$pkgname::git+$url.git"
        'forge.desktop')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  # The version from Cargo.toml without "-" (0.1.1-beta.1 -> 0.1.1beta.1, sorted before
  # 0.1.1), then the commits since and the short hash.
  local ver
  ver=$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)
  printf '%s.r%s.g%s' "${ver//-/}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname/app/ui"
  pnpm install --frozen-lockfile
  # The binary only (no bundle); the UI is built by the Tauri CLI.
  pnpm tauri build --no-bundle
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/forge "$pkgdir/usr/bin/forge"
  install -Dm644 "$srcdir/forge.desktop" "$pkgdir/usr/share/applications/forge.desktop"
  install -Dm644 app/src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/forge.png"
  install -Dm644 app/src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/forge.png"
  install -Dm644 app/src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/forge.png"
  install -Dm644 THIRD_PARTY_NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
}
