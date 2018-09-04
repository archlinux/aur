# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=reflective-rapidjson
_llvmver=6
pkgname=reflective-rapidjson
pkgver=0.0.5
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc='Code generator for serializing/deserializing C++ objects to/from JSON using Clang and RapidJSON'
license=('GPL')
depends=('c++utilities' 'rapidjson' "llvm-libs>=${_llvmver}.0.0" "llvm-libs<$((_llvmver + 1)).0.0" 'clang')
optdepends=("boost: use Boost.Hana instead of code generator")
optdepends=("$pkgname-doc: API documentation")
makedepends=('cmake' 'clang-tools-extra' 'boost' 'llvm')
checkdepends=('cppunit')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz"
        'https://github.com/Martchus/reflective-rapidjson/commit/5835cd85a5bbc72f4ac47a81b09e986cc8dee715.patch')
sha256sums=('3ba7c7f2a73c9ab2afe38cd884b8f1290e770f17c9fd497de5468c7d4a690bdb')

prepare() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"

  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make check
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}
