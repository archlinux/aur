# Maintainer: Fangrui Song <i at maskray.me>
# Co-Maintainer: Shengyu Zhang <la@archlinuxcn.org>

_pkgname=ccls
pkgname=${_pkgname}-clang-git
pkgver=20220417
pkgrel=1
pkgdesc='C/C++ language server supporting cross references, hierarchies, completion and semantic highlighting, build against llvm-git and clang-git'
arch=('x86_64')
url='https://github.com/MaskRay/ccls'
license=('Apache')
depends=('clang-git' 'llvm-libs')
provides=("$_pkgname" "${pkgname}-git")
conflicts=("$_pkgname" "${pkgname}-git")
makedepends=("cmake" "git" "llvm-git" "polly-git")
source=('git+https://github.com/MaskRay/ccls.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  TZ=UTC date -d @$(git log -1 --format=%ct) +%Y%m%d
}

prepare() {
  cd $_pkgname
  git submodule update --init
}

build() {
  cd $_pkgname
  cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_COMPILER=c++ \
        -DCLANG_LINK_CLANG_DYLIB=on \
        -DCMAKE_BUILD_TYPE='None' \
        -DUSE_SYSTEM_RAPIDJSON=on
  cmake --build build
}

package() {
  cd $_pkgname/build
  make DESTDIR="$pkgdir" install
}
