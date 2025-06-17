# $Id$
# Maintainer: unit73e <unit73e@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: kfgz <kfgz@interia.pl>
# Contributor: Lorenzo Ferrillo <lorenzofer at live dot it>

pkgname=lib32-x265
pkgver=4.1
pkgrel=1
epoch=1
pkgdesc='Open Source H265/HEVC video encoder. 32bit libraries.'
arch=('x86_64')
url='https://bitbucket.org/multicoreware/x265_git'
license=('GPL')
depends=('x265' 'lib32-gcc-libs'  'lib32-libnuma')
makedepends=('cmake' 'nasm' 'git')
provides=('libx265.so')
_tag=f0c1022b6be121a753ff02853fbe33da71988656
source=("${pkgname#lib32-*}::git+${url}.git#tag=${pkgver}" "cstdint_missing.patch")
sha256sums=('a6a10ca581c13d8f43713f198ac2164d02d44b6c70ca31ec54e6bdb59410cdf5'
            'd97c14a03f32672ba84880e40dc934027117bd1c6a331f3351e08466598767ac')

prepare() {
  cd "${pkgname#lib32-*}"
  # Fix CMake build error with latest CMake 4.0 release
  git cherry-pick --no-commit b354c009a60bcd6d7fc04014e200a1ee9c45c167
  # Fix missing required cstdint include
  patch -Np1 -i ../cstdint_missing.patch
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -B build -S ${pkgname#lib32-*}/source \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DLIB_INSTALL_DIR='lib32'  \
    -DENABLE_SHARED='TRUE' \
    -DENABLE_HDR10_PLUS='TRUE' \
    -DEXTRA_LINK_FLAGS='-L .' \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

  make -C build

}

package() {
  make -C build DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/bin  "${pkgdir}"/usr/include -Rf
}

