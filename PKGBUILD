# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidocpp
pkgver=3.14.7.1412
_rls_tag=v3.14.7
pkgrel=2
pkgdesc="Library for creating, signing and verification of digitally signed documents, according to XAdES and XML-DSIG standards"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('minizip' 'openssl' 'xalan-c' 'xml-security-c')
makedepends=('cmake' 'git' 'xsd' 'xxd')
source=("$pkgname-$pkgver::git+https://github.com/open-eid/libdigidocpp.git?signed#tag=$_rls_tag"
        "open-eid-cmake::git+https://github.com/open-eid/cmake.git")
sha256sums=("SKIP" "SKIP")
validpgpkeys=(
    'D1EBC666EFCBFBD3CFC2EBAA90C0B5E75C3B195D'  # Raul Metsma
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
    mkdir "$pkgname-build"

    git submodule init
    git config submodule.cmake.url $srcdir/open-eid-cmake
    git submodule update
    # openssl 1.1.1m https://github.com/open-eid/libdigidocpp/pull/453
    git checkout 692b310f69636b020a75ffd60b11dbf6495f7a12 src/crypto/TS.cpp
}

build() {
    cd "$srcdir/$pkgname-$pkgver/$pkgname-build"
    export BUILD_NUMBER=${pkgver##*.}
    cmake .. -DCMAKE_C_FLAGS:STRING="${CFLAGS} -ffile-prefix-map=$srcdir=." \
             -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -ffile-prefix-map=$srcdir=." \
             -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
             -DCMAKE_INSTALL_PREFIX="/usr" \
             -DCMAKE_INSTALL_LIBDIR="lib" \
             -DCMAKE_INSTALL_SYSCONFDIR="/etc" \
             -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=TRUE \
             -DCMAKE_DISABLE_FIND_PACKAGE_PoDoFo=TRUE \
             -DCMAKE_DISABLE_FIND_PACKAGE_SWIG=TRUE \
             -DCMAKE_DISABLE_FIND_PACKAGE_Boost=TRUE \
             -DCMAKE_DISABLE_FIND_PACKAGE_JNI=TRUE
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/$pkgname-build"
    make DESTDIR="$pkgdir/" install
}
