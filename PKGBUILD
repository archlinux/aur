# Maintainer: WackyIdeas <wackyideas@disroot.org>

pkgname=('aeroshell-smod-git')
pkgver=6.7.0_37.r1f21dee
pkgrel=1
pkgdesc="KDecoration3 decoration engine for AeroShell-based desktops"
arch=(x86_64)
url="https://gitgud.io/aeroshell/smod"
license=('AGPL-3.0-or-later')
depends=(gcc-libs
         glibc
         kconfig
         kwin
         kdecoration
         kcoreaddons
         libepoxy
         ki18n
         kcmutils
         kguiaddons
         plasma-wayland-protocols
         wayland
         wayland-protocols
         qt6-wayland
         kwindowsystem
         kwidgetsaddons
         pkgconf
         qt6-base)
makedepends=(git
             extra-cmake-modules
             kdoctools
             vulkan-headers)
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
conflicts=(aeroshell-smod)
provides=(aeroshell-smod)

pkgver() {
  cd "$srcdir/${pkgname%}"
  echo "$(grep 'set(PROJECT_VERSION ' CMakeLists.txt | cut -d '"' -f 2)_$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%} \
    -DBUILD_TESTING=OFF
  cmake --build build
  DESTDIR=smodtemp cmake --install build
  PKG_CONFIG_PATH=smodtemp/usr/lib/pkgconfig/ cmake -B build_smodglow/ -DKWIN_BUILD_WAYLAND=ON -DCMAKE_CXX_FLAGS="-I../smodtemp/usr/include -L../smodtemp/usr/lib/qt6/plugins/org.kde.kdecoration3" -S ${pkgname%}/smodglow
  cmake --build build_smodglow
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  DESTDIR="$pkgdir" cmake --install build_smodglow
}
