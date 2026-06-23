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
license=('GPL-2.0-or-later')
depends=(
  'x265'
  'lib32-glibc'
  'lib32-libnuma'
  'libgcc'
  'libstdc++'
)
makedepends=(
  'cmake'
  'git'
  'nasm'
  'ninja'
)
provides=('libx265.so')
source=(
  "${pkgname#lib32-*}::git+${url}.git#tag=${pkgver}"
  "0001-Fix-build-with-GCC-15.patch"
)
b2sums=(
  '1ad111130a64ca822b5b78dc84e0078e30bbadb67a9db16bdd6a860a4210c17701ae5681930e10ec3e6335ea767ac01391fc1a68ce5ca72450c4a075b664a348'
  'af2ee0460c0c2f6f36e4f124a9ac16610e3884001262a6f08043fa1de4a85e2b5fd4fb12c64b8c94cfb59c3031bb7a1324e307fa2049e3378e2add9a58f5bd9e'
)

prepare() {
  cd "${pkgname#lib32-*}"
  # Fix CMake build error with latest CMake 4.0 release
  git cherry-pick --no-commit b354c009a60bcd6d7fc04014e200a1ee9c45c167

  # Fix build with GCC 15
  git apply -3 ../0001-Fix-build-with-GCC-15.patch

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

