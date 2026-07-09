# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Košava <kosava at archlinux dot us>

pkgname=yarock
pkgver=1.5.2
pkgrel=1
pkgdesc="Qt Modern Music Player with collection browse based on cover art"
arch=(x86_64)
url="https://github.com/sebaro/Yarock"
license=(GPL-3.0-or-later)
depends=(qt6-base qt6-multimedia htmlcxx taglib)
makedepends=(cmake qt6-tools vulkan-headers)
source=("yarok-${pkgver}.tar.gz::https://github.com/sebaro/Yarock/archive/refs/tags/${pkgver}.tar.gz"
        001-Fix-shortcuts-configure.patch)
sha256sums=('b3c341e68a45cdf21bee69811fb7200244ffb1911e11c8f182f3d791fdb50e08'
            '745a7e2216480ae619bb94696fa4c87a694348ed66fee55ec10e4d9e50717712')

prepare() {
  cd "Yarock-${pkgver}"
  patch -Np1 -i ../001-Fix-shortcuts-configure.patch
}

build() {
  # Disable warning Detected locale "C" with character encoding "ANSI_X3.4-1968", which is not UTF-8.
  export LANG=C.UTF-8
  export LC_ALL=C.UTF-8

  local _flags=(
    -DENABLE_QTMULTIMEDIA=ON
    -DENABLE_MPV=OFF
    -DENABLE_VLC=OFF
    -DENABLE_PHONON=OFF
  )

  cmake -B build -S "Yarock-${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
