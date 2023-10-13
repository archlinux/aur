# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fzerorubigd <fzero@rubi.gd>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=openage
pkgver=0.5.1
pkgrel=1
pkgdesc="A free (as in freedom) clone of the Age of Empires II engine"
arch=(x86_64 i686 pentium4 armv7h aarch64)
url="https://openage.sft.mx/"
license=(GPL3)
depends=(libepoxy opusfile sdl2 sdl2_image
         qt6-declarative vulkan-icd-loader
         libpng libogg nyan-lang
         python-pillow python-numpy python-toml python-mako
         python-pygments python-lz4

         # namcap implicit depends
         glibc gcc-libs python gperftools harfbuzz fontconfig freetype2
         qt6-base libglvnd opus ncurses)
makedepends=(git cmake cython doxygen vulkan-headers python-graphviz eigen toml11)
optdepends=('ttf-dejavu: for text display, but you can use any font')
source=("git+https://github.com/SFTtech/openage.git#tag=v${pkgver}"
        "openage-Fix_out_of_bound_access_in_matrix_constructor_1.patch::https://github.com/SFTtech/openage/pull/1570/commits/4002db5368e3a0f2908f810b20950bb2b8bb9b59.patch"
        "openage-Fix_out_of_bound_access_in_matrix_constructor_2.patch::https://github.com/SFTtech/openage/pull/1570/commits/52058a1d261cceb3db4c345248ba76d2bc3017eb.patch")
sha256sums=('SKIP'
            'db510135ba71b65ece5faf990d3b7d42831b96ddacfa582b8ceaafe11fce00e9'
            'b50039e9b5f2ac6aec59a6fd9b5143d3506256fcea49b549ed8627602b229d49')

prepare() {
  cd openage
  # https://github.com/SFTtech/openage/issues/1568
  patch -Np1 -i ../openage-Fix_out_of_bound_access_in_matrix_constructor_1.patch
  patch -Np1 -i ../openage-Fix_out_of_bound_access_in_matrix_constructor_2.patch
}

build() {
  cmake -B build -S "openage" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

check() {
  cd build
  ./run.py test --run-all-tests
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
