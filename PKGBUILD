# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=reflective-rapidjson
_llvmver=20
pkgname=reflective-rapidjson
pkgver=0.0.16
pkgrel=3
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='Code generator for serializing/deserializing C++ objects to/from JSON using Clang and RapidJSON'
license=(GPL-2.0-or-later)
depends=('c++utilities' 'rapidjson' "llvm-libs>=${_llvmver}.0.0" "llvm-libs<$((_llvmver + 1)).0.0" 'clang')
optdepends=("boost: use Boost.Hana instead of code generator"
            "$pkgname-doc: API documentation")
makedepends=('cmake' 'ninja' 'clang-tools-extra' 'llvm')
checkdepends=('cppunit' 'boost')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('12496b8d334e8e1245f05de17c81e269365e9b02e7a14da4274ccf643a19609f')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    .
  ninja
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  ninja check
}

package() {
  depends+=('libc++utilities.so')

  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  DESTDIR="${pkgdir}" ninja install
}
