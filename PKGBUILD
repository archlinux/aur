# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=cpp-utilities
pkgname=c++utilities
pkgver=5.27.1
pkgrel=2
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='Common C++ classes and routines such as argument parser, IO and conversion utilities'
license=(GPL-2-or-later)
depends=('gcc-libs')
optdepends=("$pkgname-doc: API documentation")
makedepends=('cmake' 'ninja')
checkdepends=('cppunit')
provides=(libc++utilities.so)
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz"
        https://github.com/Martchus/cpp-utilities/commit/34bd17dc88d493f9b68c92d6c896245e933ff01e.patch)
sha256sums=('a6c35cda6cee50e053a9bb405e8fa35fd7bf75561f10ee1a4c3fc85de5c5fb97'
            '155785b3476663b256641f73ea6a319ca2d8883b0a0fb03ef9f8b755945f038c')

prepare() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  patch -p1 -i ../34bd17dc88d493f9b68c92d6c896245e933ff01e.patch
}

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
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  DESTDIR="${pkgdir}" ninja install
}
