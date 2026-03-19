# Maintainer: Gabri3445
pkgname=simple-deadlock-mod-manager-git
pkgver=r174.970881e
pkgrel=1
pkgdesc="A simple mod manager for Deadlock"
arch=('x86_64' 'aarch64')
url="https://github.com/Gabri3445/simple-deadlock-mod-manager"
license=('AGPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1' 'libunrar' 'zstd')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs' 'libunrar' 'zstd')
provides=('simple-deadlock-mod-manager-git')
conflicts=('simple-deadlock-mod-manager' 'simple-deadlock-mod-manager-git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd simple-deadlock-mod-manager
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd simple-deadlock-mod-manager
  pnpm install
  cd src-tauri
  cargo install tauri-typegen
  cargo tauri-typegen generate
}

build() {
  cd simple-deadlock-mod-manager

  # Found this online
  # No idea how or why, but it does not compile otherwise
  # fun
  export ZSTD_SYS_USE_PKG_CONFIG=1
  export RUSTFLAGS="-L native=/usr/lib -C link-arg=-L/usr/lib -C link-arg=-l:libunrar.so"
  export UNRAR_LIB_PATH=/usr/lib

  pnpm tauri build -b deb
}

package() {
  cp -a "simple-deadlock-mod-manager/src-tauri/target/release/bundle/deb/"*/data/* "${pkgdir}/"
} 
