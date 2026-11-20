# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidocpp
pkgver=4.6.0.0+73a2d11+714f1b6
_rls_tag=v4.5.2
pkgrel=1
pkgdesc="Library for creating, signing and verification of digitally signed documents, according to XAdES and XML-DSIG standards"
arch=('x86_64')
url="https://www.id.ee/"
license=('LGPL-2.1-or-later')
depends=('minizip' 'zlib' 'openssl' 'libxml2' 'libxslt' 'xmlsec')
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver::git+https://github.com/open-eid/libdigidocpp.git?#commit=73a2d11"
        "https://patch-diff.githubusercontent.com/raw/open-eid/libdigidocpp/pull/780.patch"
        "open-eid-cmake::git+https://github.com/open-eid/cmake.git")
sha256sums=('add7c072dfd3dd621937b93c3a483f8827fa20bf551c549cc90d687d2a35ae39'
            'e3730430a6938381b7dbbbe01035bc7a3c267f1f3e1ebfb7484fdaf391d24e84'
            'SKIP')
validpgpkeys=(
    'D1EBC666EFCBFBD3CFC2EBAA90C0B5E75C3B195D'  # Raul Metsma https://github.com/metsma.gpg
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    git apply "$srcdir/780.patch" --include=src/*

    [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
    mkdir "$pkgname-build"

    git submodule init
    git config submodule.cmake.url $srcdir/open-eid-cmake
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/$pkgname-$pkgver/$pkgname-build"
    # export BUILD_NUMBER=${pkgver##*.}
    cmake .. -DCMAKE_C_FLAGS:STRING="${CFLAGS} -ffile-prefix-map=$srcdir=." \
             -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -ffile-prefix-map=$srcdir=." \
             -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
             -DCMAKE_INSTALL_PREFIX="/usr" \
             -DCMAKE_INSTALL_LIBDIR="lib" \
             -DCMAKE_INSTALL_SYSCONFDIR="/etc" \
             -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=TRUE \
             -DCMAKE_DISABLE_FIND_PACKAGE_SWIG=TRUE \
             -DCMAKE_DISABLE_FIND_PACKAGE_Boost=TRUE
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/$pkgname-build"
    make DESTDIR="$pkgdir/" install
}
