# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Paul <paul@mram.io>
pkgname=mcpelauncher-msa-ui-qt-git
pkgver=0.9.0.r1.gcfcebaa
pkgrel=5
pkgdesc="Microsoft Account authentication user interface (Qt) for the mcpelauncher-msa-daemon"
arch=('x86_64' 'i686')
url="https://github.com/minecraft-linux/msa-manifest"
license=('MIT AND GPL-3.0-only AND Unlicense')
makedepends=('git' 'cmake' 'ninja')
depends=('qt5-webengine')
provides=('mcpelauncher-msa-ui' 'mcpelauncher-msa-ui-qt')
conflicts=('mcpelauncher-msa-ui-qt' 'mcpelauncher-msa-ui')
source=(
  'git+https://github.com/minecraft-linux/msa-manifest.git'
  'git+https://github.com/minecraft-linux/logger.git'
  'git+https://github.com/minecraft-linux/base64.git'
  'git+https://github.com/minecraft-linux/file-util.git'
  'git+https://github.com/minecraft-linux/arg-parser.git'
  'git+https://github.com/minecraft-linux/rapidxml.git'
  'git+https://github.com/MCMrARM/simple-ipc.git'
  'git+https://github.com/minecraft-linux/daemon-utils.git'
  'git+https://github.com/minecraft-linux/msa.git'
  'git+https://github.com/minecraft-linux/msa-daemon-client.git'
  'git+https://github.com/minecraft-linux/msa-daemon.git'
  'git+https://github.com/minecraft-linux/msa-ui-qt.git'
  'git+https://github.com/minecraft-linux/msa-ui-gtk.git'
  'nlohmann_json_license.txt::https://raw.githubusercontent.com/nlohmann/json/develop/LICENSE.MIT'
)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/msa-manifest"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/v//'
}
prepare() {
  cd "$srcdir/msa-manifest"
  git submodule init
  for submodule in {logger,base64,file-util,arg-parser,rapidxml,simple-ipc,daemon-utils,msa,msa-daemon,msa-daemon-client,msa-ui-gtk,msa-ui-qt};
  do
  git config submodule.$submodule.url "$srcdir/$submodule"
  done
  git -c protocol.file.allow=always submodule update
}
build() {
  cd "$srcdir"

  cmake -S msa-manifest -B build \
  -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DENABLE_MSA_DAEMON=OFF \
  -DENABLE_MSA_QT_UI=ON \
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
  -Wno-dev

  cmake --build build
}
package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/msa-manifest/msa-ui-qt/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/msa-manifest/msa-daemon-client/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  install -Dm644 "$srcdir/nlohmann_json_license.txt" "I$pkgdir/usr/share/licenses/$pkgname/nlohmann_json_license.txt"
}

