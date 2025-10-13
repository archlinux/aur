# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Pranav <pranav.sharma.ama@gmail.com>
# Contributor: Neptune <neptune650@proton.me>
# Contributor: Bjoern Franke <bjo+aur<at>schafweide.org>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: kikadf <kikadf.01@gmail.com>

pkgname=mir
pkgver=2.23.0
pkgrel=1
pkgdesc="Canonical's display server"
url="https://github.com/canonical/mir"
arch=(x86_64 i686)
license=('GPL-2.0-or-later OR GPL-3.0-or-later')
depends=(apparmor boost-libs libglvnd lttng-ust libepoxy libxml++2.6 libinput yaml-cpp
         libxkbcommon  freetype2  hicolor-icon-theme libxcursor
         egl-wayland wayland
         glib2 glibc gcc-libs util-linux-libs libxcb libxkbcommon-x11 libdrm mesa libx11 gtest glibmm
         # explicit depends 
         bash systemd-libs libdisplay-info pixman
)
makedepends=(glm doxygen graphviz cmake ninja boost umockdev wlcs glmark2
             python-pillow python-dbus
             #gcovr lcov valgrind
             python-dbusmock
             glib2-devel
)
optdepends=('qterminal: required for miral demos'
            'ttf-ubuntu-font-family: required for miral demos'
            'qt5-wayland: required for miral demos'
            'xcursor-dmz: opt requirement for miral demos')
options=()
source=("https://github.com/canonical/mir/releases/download/v${pkgver}/mir-${pkgver}.tar.xz")
sha256sums=('01c088b037f19c69d40c33514be15dd124411ce385af55d3772cfed5fe18d3eb')

# glm doesnt ship with a glm.pc, but mir build falls back on cmake's find_package for non-debian systems

build() {
  export CFLAGS+=" -ffat-lto-objects -O2"
  export CXXFLAGS+=" -ffat-lto-objects -O2"

  local _flags=(
    -B build 
    -S "${pkgname}-${pkgver}" 
    -GNinja
    -Wno-dev
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    # mir options
    -DMIR_FATAL_COMPILE_WARNINGS=OFF
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/$pkgname/
    -DMIR_BUILD_INTERPROCESS_TESTS=OFF
    -DMIR_RUN_WLCS_TESTS=OFF
    -DMIR_USE_PRECOMPILED_HEADERS=OFF
  )

  cmake "${_flags[@]}"
  cmake --build build
}

#check() {
#  ctest --test-dir build --output-on-failure
#}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
