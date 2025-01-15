# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fzerorubigd <fzero@rubi.gd>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=openage-git
pkgver=0.6.0.r37.gbeb894520
pkgrel=2
pkgdesc="A free (as in freedom) clone of the Age of Empires II engine"
arch=(x86_64 i686 pentium4 armv7h aarch64)
url="https://openage.sft.mx/"
license=(GPL3)
depends=(libepoxy opusfile
         qt6-declarative qt6-multimedia vulkan-icd-loader
         libpng libogg nyan-lang
         python-pillow python-numpy python-toml python-mako
         python-pygments python-lz4

         # namcap implicit depends
         glibc gcc-libs zlib python gperftools harfbuzz fontconfig freetype2
         qt6-base libglvnd opus ncurses)
makedepends=(git cmake cython vulkan-headers eigen toml11 python-setuptools mold)
checkdepends=(ttf-dejavu)
optdepends=('ttf-dejavu: for text display, but you can use any font')
provides=(openage)
conflicts=(openage)
source=("git+https://github.com/SFTtech/openage.git")
sha256sums=('SKIP')

pkgver() {
  cd openage
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  #export CC="/usr/bin/gcc"
  #export CXX="/usr/bin/g++"
  #export CPP="/usr/bin/cpp"
  export LD="/usr/bin/mold"
  export LDFLAGS="-fuse-ld=mold"

  cmake -B build -S "openage" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON

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
