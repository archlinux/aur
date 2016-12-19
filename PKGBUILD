# Maintainer: Kuldeep Singh Dhaka <kuldeepdhaka9@gmail.com>

pkgname=libreplot-git
_pkgname=libreplot
pkgver=33.2563af7
pkgrel=1
pkgdesc="Data Visualizing using GPU via OpenGL3+ (or GLES2+), written in C"
arch=('i686' 'x86_64')
url="https://www.madresistor.org/box0"
license=('GPL')
provides=(libreplot)
conflicts=(libreplot)
replaces=(libreplot)
source=("git+https://gitlab.com/madresistor/$_pkgname.git")
# TODO: Find a way in which we can tell that
#  we need atleast one of ('libepoxy''libgl' 'libgles').
#  libepoxy being the most preffered and libgles the least
depends=('libepoxy' 'fontconfig' 'freetype2' 'harfbuzz' 'libpng')
makedepends=('cmake' 'git')
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git rev-list --count HEAD).$(git describe --always )"
}

prepare() {
  cd "$srcdir/$_pkgname"
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd "$srcdir/$_pkgname/build"
  # We are not building demo examples as they will not be installed
  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DBUILD_DEMO=NO -DBUILD_SHARED_LIBS='TRUE' ..
  make
}

package() {
  make -C "$srcdir/$_pkgname/build" DESTDIR="${pkgdir}" install
}
