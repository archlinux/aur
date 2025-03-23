# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Neptune <neptune650@proton.me>
# Contributor: Bjoern Franke <bjo+aur<at>schafweide.org>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: kikadf <kikadf.01@gmail.com>

pkgname=mir
pkgver=2.20.0
pkgrel=1
pkgdesc="Canonical's display server"
url="https://github.com/canonical/mir"
arch=(x86_64 i686)
license=('GPL-2.0-or-later OR GPL-3.0-or-later')
depends=(boost-libs libglvnd lttng-ust libepoxy libxml++2.6 libinput yaml-cpp
         libxkbcommon  freetype2  hicolor-icon-theme libxcursor

        egl-wayland wayland

        glib2 glibc gcc-libs util-linux-libs libxcb libxkbcommon-x11 libdrm mesa libx11 gtest glibmm

        # capnproto google-glog gflags liburcu nettle libevdev protobuf  python-gobject
)
makedepends=(glm doxygen graphviz cmake boost umockdev wlcs glmark2

             python-pillow python-dbus
             #gcovr lcov valgrind
             python-dbusmock
             glib2-devel
)
optdepends=('qterminal: required for miral demos'
            'ttf-ubuntu-font-family: required for miral demos'
            'qt5-wayland: required for miral demos'
            'xcursor-dmz: opt requirement for miral demos')
options=(!lto)
source=("https://github.com/canonical/mir/releases/download/v${pkgver}/mir-${pkgver}.tar.xz")
sha256sums=('3656b2f3751346d1afd70963b5de062179602cb7e6fd8d0ca3aba03ccae83a44')

# glm not found but is listed here

build() {
  #export CFLAGS+=" -Wno-error=array-bounds"
  #export CXXFLAGS+=" -Wno-error=array-bounds"

  local _flags=(
    -DMIR_USE_PRECOMPILED_HEADERS=OFF
    -Dglm_DIR:PATH=/usr/lib/cmake/glm
  )

  cmake -B build -S "mir-${pkgver}" -Wno-dev \
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
