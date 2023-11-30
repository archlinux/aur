# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=cpp-utilities
pkgname=c++utilities
pkgver=5.24.2
pkgrel=3
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='Common C++ classes and routines such as argument parser, IO and conversion utilities'
license=('GPL')
depends=('gcc-libs')
optdepends=("$pkgname-doc: API documentation")
makedepends=('cmake' 'ninja')
checkdepends=('cppunit')
provides=(libc++utilities.so)
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz"
        0001-Enable-tidy-tests-only-by-default-via-ENABLE_DEVEL_D.patch
        0002-Enable-AppStream-tests-only-by-default-via-ENABLE_DE.patch
	0001-Fix-enabling-AppStream-tests.patch)
sha256sums=('46e79313900a8cbb7a3c0211fcc0cd07c2c8a6c2bcaeb11aec7fc706dc5914b1'
            SKIP SKIP SKIP)

prepare() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  patch -p1 -i ../0001-Enable-tidy-tests-only-by-default-via-ENABLE_DEVEL_D.patch
  patch -p1 -i ../0002-Enable-AppStream-tests-only-by-default-via-ENABLE_DE.patch
  patch -p1 -i ../0001-Fix-enabling-AppStream-tests.patch
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
