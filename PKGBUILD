# Maintainer: justforlxz <justforlxz@gmail.com>
pkgname=dtk6core-git
pkgver=6.0.2.r2.gd10d292
pkgrel=1
sourcename=dtk6core
sourcetars=("$sourcename"_"$pkgver".tar.xz)
sourcedir="$sourcename"
pkgdesc='DTK6 core modules'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtk6core"
license=('LGPL3')
depends=('deepin-desktop-base-git' 'gcc-libs' 'qt6-base' 'dtkcommon-git' 'lshw' 'uchardet' 'icu' 'libsystemd' 'spdlog')
makedepends=('git' 'qt6-tools' 'ninja' 'cmake' 'doxygen' 'gcc' 'pkg-config')
conflicts=('dtk6core')
provides=('dtk6core')
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/dtk6core")
sha512sums=('SKIP')

pkgver() {
    cd $sourcedir
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $sourcedir
  version=$(git describe --long --tags | awk -F'[+_~-]' '{print $1}')
  cmake \
    -GNinja \
    -DBUILD_DOCS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DQCH_INSTALL_DESTINATION=share/doc/qt6 \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DD_DSG_APP_DATA_FALLBACK=/var/dsg/appdata \
    -DBUILD_WITH_SYSTEMD=ON \
    -DDTK_VERSION=$version
  ninja
}

package() {
  cd $sourcedir
  DESTDIR="$pkgdir" ninja install
}
