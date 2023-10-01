# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lib32-zimg-git
pkgver=3.0.5.150.g7143181
pkgrel=1
pkgdesc="Scaling, colorspace conversion, and dithering library. (GIT version)"
arch=('x86_64')
url='http://forum.doom9.org/showthread.php?t=171334'
license=('custom:WTFPL')
depends=(
  'lib32-gcc-libs'
  'lib32-glibc'
  "zimg=${pkgver}"
)
makedepends=(
  'git'
  'cmake'
)
provides=(
  "lib32-zimg=${pkgver}"
  'libzimg.so'
)
conflicts=('lib32-zimg')
source=(
  'git+https://github.com/sekrit-twc/zimg.git'
  'git+https://github.com/sekrit-twc/graphengine.git'
  'git+https://github.com/google/googletest.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)
options=('debug')

pkgver() {
  cd zimg
  echo "$(git describe --long --tags | tr - . | sed 's|release.||g')"
}

prepare() {
  mkdir -p build

  cd zimg
  git config submodule.graphengine.url "${srcdir}/graphengine"
  git config submodule.test/extra/googletest.url "${srcdir}/googletest"
  git -c protocol.file.allow=always submodule update --init \
    graphengine \
    test/extra/googletest
}

build() {

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd zimg
  ./autogen.sh

  cd "${srcdir}/build"
  ../zimg/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --enable-testapp \
    --enable-example \
    --enable-unit-test \
    --host=i686-linux-gnu

  make
  make test/unit_test
}

check() {
  cd build
  ./testapp cpuinfo
  ./test/unit_test
}

package(){
  make -C build DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 zimg/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
