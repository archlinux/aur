# 版本号：build 时 pkgver() 从 CMakeLists.txt 读取；AUR 工作流会自动同步版本与提交。
# 本地手动同步：./packaging/aur/sync-aur.sh
pkgname=neko-cloud-music
pkgver=2026.1124.73
pkgrel=1
pkgdesc="NekoMusic: Free High-Quality Cloud Music"
arch=('x86_64' 'aarch64')
url="https://github.com/FantasyNetworkCN/NekoMusicForPc"
license=('AGPL-3.0-or-later')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg' 'qt6-websockets' 'openssl')
makedepends=('cmake' 'ninja' 'vulkan-headers' 'shaderc')
optdepends=('vulkan-icd-loader: Vulkan 液态玻璃')

_commit=08c99abd27c07ab62789a5069086ee7d49069900
source=("${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('SKIP')

_srcdir() {
  echo "${srcdir}/NekoMusicForPc-${_commit}"
}

_cmake_version() {
  sed -n 's/^[[:space:]]*VERSION[[:space:]]*\([0-9.]*\).*/\1/p' \
    "$(_srcdir)/CMakeLists.txt" | head -1
}

pkgver() {
  _cmake_version
}

build() {
  cmake -S "$(_srcdir)" -B "${srcdir}/build" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DNEKO_REQUIRE_VULKAN_GLASS=ON
  cmake --build "${srcdir}/build"
}

package() {
  install -Dm755 "${srcdir}/build/NekoMusic" "${pkgdir}/usr/bin/nekomusic"

  install -Dm644 "$(_srcdir)/packaging/nekomusic.desktop" \
    "${pkgdir}/usr/share/applications/nekomusic.desktop"

  sed -i \
    -e 's#Exec=/opt/Neko歌姬计划/NekoMusic#Exec=/usr/bin/nekomusic#g' \
    "${pkgdir}/usr/share/applications/nekomusic.desktop"
}
