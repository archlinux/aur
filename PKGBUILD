# Maintainer: Onni Kukkonen <onni.kukkonen77@gmail.com>

pkgname=ksysguard-plasma6-git
pkgver=5.23.00_r3598.g8a8e85b2
pkgrel=1
pkgdesc='Track and control the processes running in your system'
arch=($CARCH)
url='https://userbase.kde.org/KSysGuard'
license=(LGPL)
depends=(libksysguard kinit kxmlgui)
makedepends=(git extra-cmake-modules kdoctools networkmanager-qt)
conflicts=(ksysguard)
provides=(ksysguard)
optdepends=('nvidia-utils: NVIDIA GPU usage' 'networkmanager-qt: improved network statistics')
groups=()
install=${pkgname%-git}.install
source=("git+https://github.com/Rosentti/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
