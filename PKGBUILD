# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidocpp
pkgver=3.14.3.1399
pkgrel=2
pkgdesc="Library for creating, signing and verification of digitally signed documents, according to XAdES and XML-DSIG standards"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('xml-security-c')
makedepends=('cmake' 'xsd' 'xxd')
source=("https://installer.id.ee/media/ubuntu/pool/main/libd/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('19f00e5a72246dde4214b6eedaa36e9974ba4277b92500f8240188f95b0ac5d1')

prepare() {
    [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
    mkdir "$pkgname-build"
}

build() {
    cd "$pkgname-build"
    export BUILD_NUMBER=${pkgver##*.}
    cmake .. -DCMAKE_C_FLAGS:STRING="${CFLAGS} -ffile-prefix-map=$srcdir=." \
             -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -ffile-prefix-map=$srcdir=." \
             -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
             -DCMAKE_INSTALL_PREFIX="/usr" \
             -DCMAKE_INSTALL_LIBDIR="lib" \
             -DCMAKE_INSTALL_SYSCONFDIR="/etc" \
             -DSWIG_EXECUTABLE="" \
             -DBoost_INCLUDE_DIR="" \
             -DMINIZIP_INCLUDE_DIR="" \
             -DPODOFO_INCLUDE_DIR="" \
             -DLIBDIGIDOC_INCLUDE_DIR=""
    make
}

package() {
    cd "$pkgname-build"
    make DESTDIR="$pkgdir/" install
}
