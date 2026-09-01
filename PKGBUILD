# Maintainer: ezhkov <alexcez94@gmail.com>
pkgname=voltius-git
_pkgname=voltius
pkgver=0.31.0.r0.g925dee2f
pkgrel=1
pkgdesc="Local-first SSH/SFTP/Serial client with E2EE sync, plugins, and no account required (main branch)"
arch=('x86_64' 'aarch64')
url="https://github.com/VoltiusApp/voltius"
license=('AGPL3')
provides=('voltius')
conflicts=('voltius')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsecret' 'hicolor-icon-theme')
makedepends=('rust' 'nodejs' 'npm' 'git' 'appmenu-gtk-module' 'desktop-file-utils')
options=('!lto')
source=("$_pkgname::git+https://github.com/VoltiusApp/voltius.git"
        "$_pkgname.desktop")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  # pnpm isn't in the official repos; install it into a local, writable
  # prefix rather than relying on `corepack enable` (which tries to write
  # shims next to the system-wide nodejs install under /usr).
  npm install -g pnpm@10.34.5 --prefix "$srcdir/npm-global"
}

build() {
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=/usr/bin/gcc
  cd "$_pkgname"
  export PATH="$srcdir/npm-global/bin:$PATH"
  export TAURI_SIGNING_PRIVATE_KEY="aur-build-dummy-key"
  export TAURI_SIGNING_PRIVATE_KEY_PASSWORD="aur-build-dummy-pass"
  export NODE_ENV=production
  pnpm install --frozen-lockfile
  pnpm tauri build --no-bundle
}

package() {
  cd "$_pkgname"

  install -Dm755 target/release/voltius "$pkgdir/usr/bin/voltius"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -Dm644 src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
}
