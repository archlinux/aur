# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: kikadf <kikadf.01@gmail.com>

pkgname=mir-git
pkgver=2.23.0.r204.g639580d
pkgrel=1
pkgdesc="Canonical's display server"
url="https://github.com/canonical/mir"
arch=(x86_64 i686 armv7h aarch64)
license=('GPL-2.0-or-later OR GPL-3.0-or-later')
depends=(boost-libs libglvnd lttng-ust libepoxy libxml++2.6 libinput yaml-cpp
         libxkbcommon  freetype2  hicolor-icon-theme libxcursor
		 libdisplay-info pixman
         egl-wayland wayland
         libevdev umockdev

         glib2 glibc gcc-libs util-linux-libs libxcb libxkbcommon-x11 libdrm mesa libx11 gtest glibmm sh

         # capnproto google-glog gflags liburcu nettle libevdev protobuf python-gobject
         )
makedepends=(git glm doxygen graphviz cmake boost wlcs glmark2
			 xorg-xwayland
             python-pillow python-dbus # required
             #gcovr lcov valgrind
             python-dbusmock
             glib2-devel
             )
optdepends=('qterminal: required for miral demos'
            'ttf-ubuntu-font-family: required for miral demos'
            'qt5-wayland: required for miral demos'
            'xcursor-dmz: opt requirement for miral demos')
conflicts=(mir)
provides=(mir)
options=(!lto)
source=("git+https://github.com/canonical/mir.git")
sha256sums=('SKIP')

pkgver() {
  cd "mir"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CFLAGS+=" -Wno-error=array-bounds"
  export CXXFLAGS+=" -Wno-error=array-bounds"

  local _flags=(
    -DMIR_USE_PRECOMPILED_HEADERS=OFF
    -Dglm_DIR:PATH=/usr/lib/cmake/glm
  )

  cmake -B build -S "mir" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

#check() {
#  ctest --test-dir build --output-on-failure
#}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
