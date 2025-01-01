# Maintainer: HurricanePootis <hurricanepootis@protonmail.com
# Contributor: Ersei <contact at ersei dot net>
# Contributor: Paul <paul@mrarm.io>
pkgname=mcpelauncher-ui
pkgver=1.1.2
pkgrel=2
pkgdesc="Minecraft: PE Linux launcher UI"
arch=('x86_64')
url="https://github.com/minecraft-linux/mcpelauncher-ui-manifest"
license=('GPL-3.0-only' 'MIT')
makedepends=('git' 'cmake' 'ninja' 'clang' 'qt6-tools')
depends=('qt6-base' 'qt6-webengine' 'qt6-declarative' 'qt6-svg' 'libzip' 'protobuf' 'libxi' 'libxrandr' 'libxinerama' 'libxcursor' 'mcpelauncher-linux' 'zlib' 'curl' 'glibc' 'qt6-webchannel' 'gcc-libs' 'openssl'
	 'hicolor-icon-theme' 'abseil-cpp')
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
  'abseil.patch::https://patch-diff.githubusercontent.com/raw/minecraft-linux/Google-Play-API/pull/2.diff'
)
sha256sums=('00321edd07b62e36e2e7dcba06981839f725d475dd0142dfc3323536fae3dd3a'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '30570533eeeaa13765eabde9041a742b8815a65f4cb8b843d8c82220a3b0648d')

prepare() {
  cd "$srcdir/$pkgname-manifest"
  git submodule init
  for submodule in {file-util,axml-parser,mcpelauncher-apkinfo,mcpelauncher-extract,google-play-api,playdl-signin-ui-qt,mcpelauncher-ui-qt,mcpelauncher-common};
  do
	git config submodule.$submodule.url "$srcdir/$submodule"
  done
  git -c protocol.file.allow=always submodule update
  cd "$srcdir/$pkgname-manifest/google-play-api"
  patch -p1 < "$srcdir/abseil.patch"
}
build() {
  cd "$srcdir"

  cmake -B build -S "$pkgname-manifest" \
  -G Ninja \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_C_FLAGS="$CFLAGS -flto=thin -fclang-abi-compat=17" \
  -DCMAKE_CXX_FLAGS="$CXXFLAGS -flto=thin -fclang-abi-compat=17" \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=None \
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
