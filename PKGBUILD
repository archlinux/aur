# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fzerorubigd <fzero@rubi.gd>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=openage
pkgver=0.6.0
pkgrel=2
pkgdesc="A free (as in freedom) clone of the Age of Empires II engine"
arch=(x86_64 i686 pentium4 armv7h aarch64)
url="https://github.com/SFTtech/openage/"
license=(GPL-3.0-or-later)
depends=(libepoxy opusfile ttf-dejavu
         qt6-declarative qt6-multimedia vulkan-icd-loader
         libpng libogg nyan-lang
         python-pillow python-numpy python-toml python-mako
         python-pygments python-lz4
         cython

         # namcap implicit depends
         glibc libstdc++ libgcc python gperftools harfbuzz fontconfig freetype2 xdg-utils zlib
         qt6-base libglvnd opus ncurses)
makedepends=(git cmake vulkan-headers eigen3 toml11 python-setuptools) #doxygen  python-graphviz
source=("git+https://github.com/SFTtech/openage.git#tag=v${pkgver}")
sha256sums=('af8a664cb9a5983a1889c0ba56b389dabbb776927472444916bc0acc9c43268e')

build() {
  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"

  # it ignore the default linker
  export LD=/usr/bin/ld
  export LDFLAGS="-fuse-ld=bfd"

  cmake -B build -S "openage" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure

  cd build
  ./run.py test --run-all-tests
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
