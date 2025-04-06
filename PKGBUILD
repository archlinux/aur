# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=openloco-git
pkgver=25.03.r2.gbd539e2da
pkgrel=1
pkgdesc="An open source re-implementation of Chris Sawyer's Locomotion"
arch=(x86_64 i686)
url="https://github.com/OpenLoco/OpenLoco"
license=(MIT)
depends=(sdl2 libpng openal)
depends_x86_64+=(lib32-glibc lib32-gcc-libs lib32-sdl2 lib32-libpng lib32-openal lib32-yaml-cpp lib32-fmt)
makedepends=(cmake yaml-cpp git gtest fmt)
makedepends_x86_64+=(lib32-gtest)
optdepends_x86_64=(
    'lib32-libpipewire: audio output'
    'lib32-libpulse: audio output'
)
optdepends_i686=(
    'libpipewire: audio output'
    'libpulse: audio output'
)
provides=(openloco)
conflicts=(openloco)
options=(!lto)
source=("git+https://github.com/openloco/openloco.git"        )
sha256sums=('SKIP')

pkgver() {
  cd openloco
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

    # -Dfmt_DIR:PATH=/usr/lib/cmake/fmt -> pointless; want lib32-fmt
    # -Dsfl_DIR:PATH=/usr/include/sfl   -> pointless; want to checkout it, no system version


	local _flags=(
    -DFETCHCONTENT_QUIET:BOOL=OFF
    #-DFETCHCONTENT_FULLY_DISCONNECTED:BOOL=ON
    #-Dfmt_DIR:PATH=/usr/lib/cmake/fmt
    #-Dsfl_DIR:PATH=/usr/include/sfl
    #-Dyaml-cpp_DIR:PATH=/usr/lib/cmake/yaml-cpp
	)

  export CXXFLAGS="$CXXFLAGS -m32 -Wno-error=null-dereference"
  cmake -G "Unix Makefiles" -B build -S "openloco" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  ln -s /usr/bin/OpenLoco           "${pkgdir}/usr/bin/openloco"
  install -D "openloco/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  #remove bundled sfl from package
  rm -rf "${pkgdir}/usr/share/include/sfl"

  # Project installs a copy of its own deps as well
  #for dep in Imath
  #do
  #  rm -r "$pkgdir"/usr/include/$dep/
  #  rm -r "$pkgdir"/usr/lib/cmake/$dep/
  #  rm    "$pkgdir"/usr/lib/lib$dep*.a
  #done

  # Raise an error in case there's every anything else added (either
  # a new dep, or the project starts shipping libs)
  #rmdir "$pkgdir"/usr/include/
  #rmdir "$pkgdir"/usr/lib/cmake/
  #rmdir "$pkgdir"/usr/lib/
}
