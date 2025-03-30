# Maintainer: HurricanePootis <hurricanepootis@protonmail.com
# Contributor: Ersei <contact at ersei dot net>
# Contributor: Paul <paul@mrarm.io>
pkgname=mcpelauncher-ui
pkgver=1.2.0
pkgrel=4
pkgdesc="Minecraft: PE Linux launcher UI"
arch=('x86_64')
url="https://github.com/minecraft-linux/mcpelauncher-ui-manifest"
license=('GPL-3.0-only' 'MIT')
makedepends=('git' 'cmake' 'ninja' 'qt6-tools' 'clang')
depends=('qt6-base' 'qt6-webengine' 'qt6-declarative' 'qt6-svg' 'libzip' 'protobuf' 'libxi' 'libxrandr' 'libxinerama' 'libxcursor' 'mcpelauncher-linux' 'zlib' 'curl' 'glibc' 'qt6-webchannel' 'gcc-libs' 'openssl'
	 'hicolor-icon-theme' 'abseil-cpp')
optdepends=('mcpelauncher-msa-ui-qt: Microsoft authentication for version before 1.16.1X')
_commit=5bb980e580c0ea0c617d65fb6b2536805bd85110 # qt6 branch
source=(
  "git+https://github.com/minecraft-linux/mcpelauncher-ui-manifest.git#commit=$_commit"
  'git+https://github.com/MCMrARM/axml-parser.git'
  'git+https://github.com/minecraft-linux/file-util.git'
  'google-play-api::git+https://github.com/minecraft-linux/Google-Play-API.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-apkinfo.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-extract.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-common.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-ui-qt.git'
  'git+https://github.com/minecraft-linux/playdl-signin-ui-qt.git'
)
sha256sums=('23582c5c64a457bd0a29a063c8de94ee64ff116344f5890ef86d5aba2c8bf2c1'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname-manifest"
  git submodule init
  for submodule in {file-util,axml-parser,mcpelauncher-apkinfo,mcpelauncher-extract,google-play-api,playdl-signin-ui-qt,mcpelauncher-ui-qt,mcpelauncher-common};
  do
	git config submodule.$submodule.url "$srcdir/$submodule"
  done
  git -c protocol.file.allow=always submodule update
  cd "$srcdir/$pkgname-manifest/google-play-api"
}
build() {
  cd "$srcdir"

  cmake -B build -S "$pkgname-manifest" \
  -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
  -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
  -Wno-dev

  cmake --build build
}
package() {
  cd "$srcdir"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/$pkgname-qt/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Fix StartUPWMClass to get icon working on wayland
  echo "StartUpWMClass=io.mrarm.mcpelauncher-ui-qt" >> "$pkgdir/usr/share/applications/mcpelauncher-ui-qt.desktop"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  mv "$pkgdir/usr/share/pixmaps/mcpelauncher-ui-qt.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.mrarm.mcpelauncher-ui-qt.svg"
  rm -rf "$pkgdir/usr/share/pixmaps"
  mv "$pkgdir/usr/share/applications/mcpelauncher-ui-qt.desktop" "$pkgdir/usr/share/applications/io.mrarm.mcpelauncher-ui-qt.desktop"
  sed -i 's/Icon=mcpelauncher-ui-qt/Icon=io.mrarm.mcpelauncher-ui-qt/g' "$pkgdir/usr/share/applications/io.mrarm.mcpelauncher-ui-qt.desktop"
}
