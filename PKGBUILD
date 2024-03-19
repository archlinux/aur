# Maintainer: Rustmilian <Rustmilian@proton.me>

pkgname=solid-git
pkgver=6.1.0_r1000.g45b1cc23
pkgrel=1
pkgdesc='Hardware integration and detection'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=('gcc-libs' 'glibc' 'libimobiledevice' 'libplist' 'media-player-info' 'qt6-base' 'systemd-libs' 'udisks2' 'upower' 'util-linux-libs')
makedepends=('doxygen' 'extra-cmake-modules' 'qt6-declarative' 'qt6-doc' 'qt6-tools')
groups=(kf6)
conflicts=(solid)
provides=(solid)
source=("git+https://invent.kde.org/frameworks/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON \
    -DWITH_NEW_POWER_ASYNC_API=ON \
    -DWITH_NEW_POWER_ASYNC_FREEDESKTOP=ON \
    -DWITH_NEW_SOLID_JOB=ON # https://bugs.archlinux.org/task/64093
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
