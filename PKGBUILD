# Maintainer: HurricanePootis <hurricanepootis@protonmail.com
# Contributor: Ersei <contact at ersei dot net>
# Contributor: Paul <paul@mrarm.io>
pkgname=mcpelauncher-ui
pkgver=1.3.0
pkgrel=3
pkgdesc="Minecraft: PE Linux launcher UI"
arch=('x86_64')
url="https://github.com/minecraft-linux/mcpelauncher-ui-manifest"
license=('GPL-3.0-only' 'MIT')
makedepends=('git' 'cmake' 'ninja' 'qt6-tools' 'clang' 'vulkan-headers')
depends=('qt6-base' 'qt6-webengine' 'qt6-declarative' 'qt6-svg' 'libzip' 'protobuf' 'libxi' 'libxrandr' 'libxinerama' 'libxcursor' 'mcpelauncher-linux' 'zlib' 'curl' 'glibc' 'qt6-webchannel' 'gcc-libs' 'openssl'
	 'hicolor-icon-theme' 'abseil-cpp')
optdepends=('mcpelauncher-msa-ui-qt: Microsoft authentication for version before 1.16.1X')
_commit=1eaf570482161715a1d71a2a2541ca27087bc8ac # qt6 branch
source=(
  "git+https://github.com/minecraft-linux/mcpelauncher-ui-manifest.git#commit=$_commit"
  'git+https://github.com/MCMrARM/axml-parser.git#commit=e5d26109797c69d66260097b315446e774bc3639'
  'git+https://github.com/minecraft-linux/file-util.git#commit=3e7be1e26be892f47874f2cb903d6122b8640a97'
  'google-play-api::git+https://github.com/minecraft-linux/Google-Play-API.git#commit=c8d2452f1d993a1cf627188ad2cea5f5f1a7fe86'
  'git+https://github.com/minecraft-linux/mcpelauncher-apkinfo.git#commit=ebd853b749649b57a3535b5151d1214f93f18db6'
  'git+https://github.com/minecraft-linux/mcpelauncher-extract.git#commit=1d447c0b46b03b941b2c1b29263d086e29573aeb'
  'git+https://github.com/minecraft-linux/mcpelauncher-common.git#commit=277c84a3e238043b0b63732ce9108fab60ce58c9'
  'git+https://github.com/minecraft-linux/mcpelauncher-ui-qt.git#commit=bfe046db3b4a70ff1c3647fe79a8067162180d10'
  'git+https://github.com/minecraft-linux/playdl-signin-ui-qt.git#commit=1f080c927c070b67fc03a258186591f29bf8eb87'
)
sha256sums=('d5443636d1d6e8d4850e25b46f03e537c511f7bbd5131ecb57e10023d49f7fb6'
            'b2261ad19fb6fbed24a4254cc03e831ea1c3da979941977fda042124fa4ee67a'
            'ca32e57095fbcea6f397af0ca06eed4ffa65e6f134d86b5a95f8199d341e49f9'
            'ff5c97834850b6d578b732eea51fcab44a9b743a4803f273c134d5c0a0a46577'
            '8a8da38544766c9f1404c2539994359a0f1375b459721330852c93a2ca06305f'
            'b2c902ee2c78558ca8a5592c1d4e1fcc4d16d756b05800b618f19e8e6751a2c8'
            'd9db9005db8c086574674eb87a7af509d2efdfd4ac1644f1739a2c93a0e6ed7a'
            '4bede6e3fcd66b8dda385ccd0eea49cc1c67f1ed8019c41b60e72d5c795c16fe'
            '54a455c45648adb8ef28da163b4457ac71365108a16cd0a71ec5b725461088bf')

prepare() {
  cd "$srcdir/$pkgname-manifest"
  git submodule init
  for submodule in {file-util,axml-parser,mcpelauncher-apkinfo,mcpelauncher-extract,google-play-api,playdl-signin-ui-qt,mcpelauncher-ui-qt,mcpelauncher-common};
  do
	git config submodule.$submodule.url "$srcdir/$submodule"
  done
  git -c protocol.file.allow=always submodule update
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
