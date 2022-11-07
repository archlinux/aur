# Maintainer: Sambhav <samb at disroot dot org>
# Contributer: Paul <paul@mrarm.io>
pkgname=mcpelauncher-ui-git
pkgver=v0.3.2.r6.g485df2e
pkgrel=1
pkgdesc="Minecraft: PE Linux launcher UI"
arch=('x86_64')
url="https://github.com/minecraft-linux/mcpelauncher-ui-manifest"
license=('GPL3', 'MIT')
makedepends=('git' 'cmake')
depends=('qt6-base' 'qt6-webengine' 'qt6-declarative' 'qt6-svg' 'libzip' 'protobuf' 'mcpelauncher-client')
provides=('mcpelauncher-ui')
conflicts=('mcpelauncher-ui')
source=(
  'git+https://github.com/minecraft-linux/mcpelauncher-ui-manifest.git#branch=qt6'
  'git+https://github.com/MCMrARM/axml-parser.git'
  'git+https://github.com/minecraft-linux/file-util.git'
  'google-play-api::git+https://github.com/minecraft-linux/Google-Play-API.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-apkinfo.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-extract.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-ui-qt.git'
  'git+https://github.com/minecraft-linux/playdl-signin-ui-qt.git'
)
md5sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "mcpelauncher-ui-manifest"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  cd mcpelauncher-ui-manifest
  git submodule init
  git config submodule.file-util.url $srcdir/file-util
  git config submodule.axml-parser.url $srcdir/axml-parser
  git config submodule.mcpelauncher-apkinfo.url $srcdir/mcpelauncher-apkinfo
  git config submodule.mcpelauncher-extract.url $srcdir/mcpelauncher-extract
  git config submodule.google-play-api.url $srcdir/google-play-api
  git config submodule.playdl-signin-ui-qt.url $srcdir/playdl-signin-ui-qt
  git config submodule.mcpelauncher-ui-qt.url $srcdir/mcpelauncher-ui-qt
  git -c protocol.file.allow=always submodule update file-util axml-parser mcpelauncher-apkinfo mcpelauncher-extract google-play-api playdl-signin-ui-qt mcpelauncher-ui-qt
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
