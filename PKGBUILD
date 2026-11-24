# Maintainer: Jonas Leder
# Builds the desktop app from the latest master. Published to the AUR by CI whenever this file changes;
# the version is computed from git by pkgver(), so there is nothing to bump here.
pkgname=notes-src
pkgver=1.0.0.r0.g0000000
pkgrel=1
pkgdesc='Self-hosted, end-to-end encrypted note taking (desktop app, built from the latest master)'
arch=('x86_64')
url='https://jonasled.dev/jonasled/notes'
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
makedepends=('git' 'rust' 'nodejs' 'pnpm' 'pkgconf')
provides=('notes')
conflicts=('notes' 'notes-bin')
options=('!strip' '!lto')
source=("$pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  if v=$(git describe --long --tags --abbrev=7 2>/dev/null); then
    printf '%s' "$v" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '%s.r%s.g%s' "$(sed -n 's/^version = "\(.*\)"/\1/p' frontend/src-tauri/Cargo.toml | head -1)" \
      "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "$pkgname/frontend"
  export CI=true # pnpm: never prompt
  pnpm install --frozen-lockfile
  pnpm tauri build --no-bundle
}

package() {
  cd "$pkgname"
  install -Dm755 frontend/src-tauri/target/release/notes "$pkgdir/usr/bin/notes"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 frontend/src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/notes.png"
  install -Dm644 frontend/public/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/notes.svg"
  install -Dm644 packaging/aur/notes.desktop "$pkgdir/usr/share/applications/notes.desktop"
}
