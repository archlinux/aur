# $Id$
# Maintainer: unit73e <unit73e@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: kfgz <kfgz@interia.pl>
# Contributor: Lorenzo Ferrillo <lorenzofer at live dot it>

pkgname=lib32-x265
pkgver=4.0
pkgrel=2
pkgdesc='Open Source H265/HEVC video encoder. 32bit libraries.'
arch=('x86_64')
url='https://bitbucket.org/multicoreware/x265_git'
license=('GPL')
depends=('x265' 'lib32-gcc-libs'  'lib32-libnuma')
makedepends=('cmake' 'nasm' 'git')
provides=('libx265.so')
_tag=f0c1022b6be121a753ff02853fbe33da71988656
source=("${pkgname#lib32-*}::git+https://bitbucket.org/multicoreware/x265_git.git#tag=$pkgver")
source+=("x265_cmake4.patch::https://bitbucket.org/multicoreware/x265_git/commits/b354c009a60bcd6d7fc04014e200a1ee9c45c167/raw")
sha256sums=('633998b9f17d335c24b3ac34eb446ac376971ce7323ef9befb86d134ee3e6453'
            'cc24fae87d3af05af3a5ab57041cabc4fb4dc93a6d575d69dd23831fe0856204')

prepare() {
    patch -d x265 -Np1 -i ../x265_cmake4.patch
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  warning "Using cmake3-bin temporarily until upstream compatibility is resolved."
  cmake3 -B build -S ${pkgname#lib32-*}/source \
    -DCMAKE_INSTALL_PREFIX='/usr' -DLIB_INSTALL_DIR='lib32'  \
    -DENABLE_SHARED='TRUE' \
    -DENABLE_HDR10_PLUS='TRUE' \
    -DEXTRA_LINK_FLAGS='-L .' 

  make -C build

}

package() {
  make -C build DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/bin  "${pkgdir}"/usr/include -Rf
}

