# Maintainer: Athan Clark <athan.clark@gmail.com>
pkgname=scriptorium-git-2
_pkgname=scriptorium
pkgver=0.0.2.r0.gc9782d5
pkgrel=1
pkgdesc="Note-taking application - latest git"
arch=('x86_64')
url="https://github.com/athanclark/scriptorium"
license=('GPL-3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedepends=('rust' 'cargo' 'pnpm')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')  # Replace with real checksum
options=(!lto !strip)   # avoid post-build strip and LTO for safety

pkgver() {
  cd "$srcdir/$_pkgname"
  # Prefer annotated tags like v0.0.2. Fallback to revcount+hash.
  git describe --long --tags --match 'v*' 2>/dev/null \
    | sed -E 's/^v//; s/([^-]*-g)/r\1/; s/-/./g' \
  || printf "0.r%s.g%s" \
       "$(git rev-list --count HEAD)" \
       "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  pnpm install --frozen-lockfile
  export NO_STRIP=1
  pnpm tauri build --bundles=appimage
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "src-tauri/target/release/scriptorium" \
    "$pkgdir/usr/bin/scriptorium"
  # Desktop integration (adjust paths if you have these files)
  install -Dm644 "src-tauri/target/release/bundle/appimage/$_pkgname.AppDir/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "src-tauri/target/release/bundle/appimage/$_pkgname.AppDir/$_pkgname.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
}
