# Maintainer: Sol Bekic <s+aur at s-ol dot nu>

_pkgname=curv
pkgname="$_pkgname-git"
pkgver=0.3.r43.g7d922f3
pkgrel=3
pkgdesc="a language for making art using mathematics"
url="https://github.com/doug-moen/curv"
arch=('x86_64')
license=('Apache')
makedepends=('cmake' 'git' 'boost' 'openexr' 'glm')
depends=('boost-libs' 'double-conversion' 'ilmbase' 'intel-tbb')

source=("git+https://github.com/doug-moen/curv"
        "remove_lang_file.patch")
md5sums=('SKIP'
         '6fd7fe6e81988bd9cd23d85ac920dc3c')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule update --init
  patch -Np1 -i "${srcdir}/remove_lang_file.patch"

  echo '#define CURV_VERSION "'`git describe --tags --always --dirty`'"' >,v
  if cmp -s ,v libcurv/version.h; then rm ,v; else mv ,v libcurv/version.h; fi

  mkdir -p release
  cd release
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr ..
}

build() {
  cd "$_pkgname"/release
  make
}

package() {
  cd "$_pkgname"/release
  make install
}
