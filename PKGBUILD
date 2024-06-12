# Maintainer: HurricanePootis <hurricanepootis@protonmail.com
# Contributor: Ersei <contact at ersei dot net>
# Contributor: Paul <paul@mrarm.io>
pkgname=mcpelauncher-ui
pkgver=0.15.0
pkgrel=1
pkgdesc="Minecraft: PE Linux launcher UI"
arch=('x86_64')
url="https://github.com/minecraft-linux/mcpelauncher-ui-manifest"
license=('GPL-3.0-only' 'MIT')
makedepends=('git' 'cmake')
depends=('qt6-base' 'qt6-webengine' 'qt6-declarative' 'qt6-svg' 'libzip' 'protobuf' 'libxi' 'libxrandr' 'libxinerama' 'libxcursor' 'mcpelauncher-client')
optdepends=('mcpelauncher-msa-ui-qt: Microsoft authentication for version before 1.16.1X')
source=(
  "git+https://github.com/minecraft-linux/mcpelauncher-ui-manifest.git#tag=v${pkgver}-qt6"
  'git+https://github.com/MCMrARM/axml-parser.git'
  'git+https://github.com/minecraft-linux/file-util.git'
  'google-play-api::git+https://github.com/minecraft-linux/Google-Play-API.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-apkinfo.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-extract.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-common.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-ui-qt.git'
  'git+https://github.com/minecraft-linux/playdl-signin-ui-qt.git'
)
sha256sums=('852c9e0b9da1fcbea7b7399529b639891b0a91537ab777060b8c2e2c4093a646'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd mcpelauncher-ui-manifest
  git submodule init
  git config submodule.file-util.url $srcdir/file-util
  git config submodule.axml-parser.url $srcdir/axml-parser
  git config submodule.mcpelauncher-apkinfo.url $srcdir/mcpelauncher-apkinfo
  git config submodule.mcpelauncher-extract.url $srcdir/mcpelauncher-extract
  git config submodule.mcpelauncher-common.url $srcdir/mcpelauncher-common
  git config submodule.google-play-api.url $srcdir/google-play-api
  git config submodule.playdl-signin-ui-qt.url $srcdir/playdl-signin-ui-qt
  git config submodule.mcpelauncher-ui-qt.url $srcdir/mcpelauncher-ui-qt
  git -c protocol.file.allow=always submodule update
}
build() {
  cd mcpelauncher-ui-manifest
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
  make
}
package() {
  cd mcpelauncher-ui-manifest/build
  make DESTDIR="$pkgdir" install
  sed -i 's/ -name mcpelauncher//g' "$pkgdir/usr/share/applications/mcpelauncher-ui-qt.desktop" # The desktop file is broken
  install -Dm644 ../mcpelauncher-ui-qt/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
