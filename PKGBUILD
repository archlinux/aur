# Maintainer: Matheus Fillipe <mattf@h4ks.com>
pkgname=obsidianirc
pkgver=0.2.4
pkgrel=1
pkgdesc="Description of your app"
arch=('x86_64' 'aarch64')
url="https://github.com/ObsidianIRC/ObsidianIRC"
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
provides=('obsidianirc')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd ObsidianIRC
  
  # Remove vitest types from tsconfig.json
  sed -i '/"types":/d' tsconfig.json
  sed -i 's/"tests"//g' tsconfig.json
  sed -i 's/,\s*,/,/g' tsconfig.json
  
  # Remove vitest reference from vite.config.ts
  sed -i '/\/\/\/ <reference types="vitest" \/>/d' vite.config.ts
  sed -i '/\/\/\/ <reference types="@testing-library\/jest-dom" \/>/d' vite.config.ts
  
  pnpm install
}

build() {
  cd ObsidianIRC
  pnpm tauri build -b deb
}

package() {
  cd ObsidianIRC
  _npmver=$(node -p "require('./package.json').version")
  
  cp -a src-tauri/target/release/bundle/deb/ObsidianIRC_${_npmver}_*/data/* "${pkgdir}"
}
