# 版本号：build 时 pkgver() 从 CMakeLists.txt 读取；发 AUR 前可运行 ./packaging/aur/sync-aur.sh
pkgname=neko-cloud-music
pkgver=2026.526.22
pkgrel=2
pkgdesc="Neko Cloud Music desktop client (Qt6/C++)"
arch=('x86_64' 'aarch64')
url="https://github.com/FantasyNetworkCN/NekoMusicForPc"
license=('AGPL-3.0-or-later')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg')
makedepends=('cmake' 'ninja')

_commit=ce3867f50f130f29981066e5f2d6cb7cb0ae6659
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
    -DCMAKE_BUILD_TYPE=Release
  cmake --build "${srcdir}/build"
}

package() {
  install -Dm755 "${srcdir}/build/NekoMusic" "${pkgdir}/usr/bin/nekomusic"

  install -Dm644 "$(_srcdir)/packaging/nekomusic.desktop" \
    "${pkgdir}/usr/share/applications/nekomusic.desktop"

  sed -i \
    -e 's#Exec=/opt/Neko云音乐/NekoMusic#Exec=/usr/bin/nekomusic#g' \
    "${pkgdir}/usr/share/applications/nekomusic.desktop"
}
