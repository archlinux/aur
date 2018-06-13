# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidoc
pkgver=3.10.4.1218
pkgrel=1
pkgdesc="DigiDoc is an XML file format for documents with digital signatures in use by the Estonian ID card infrastructure. This library allows for creation and reading of DigiDoc files"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('libxml2' 'openssl')
makedepends=('cmake' 'pcsclite' 'opensc')
source=("https://installer.id.ee/media/ubuntu/pool/main/libd/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('595ef2c3f62229a2b73d089a7b0625647da764133047a61144ce3881f5f9095b')

prepare() {
    [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
    mkdir "$pkgname-build"
}

build() {
    cd "$pkgname-build"
    cmake .. -DCMAKE_C_FLAGS:STRING="${CFLAGS} -ffile-prefix-map=$srcdir=." \
             -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -ffile-prefix-map=$srcdir=." \
             -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
             -DCMAKE_INSTALL_PREFIX="/usr" \
             -DCMAKE_INSTALL_LIBDIR="lib" \
             -DCMAKE_INSTALL_SYSCONFDIR="/etc"
    make
}

package() {
    cd "$pkgname-build"
    make DESTDIR="$pkgdir/" install
    rm $pkgdir/usr/share/libdigidoc/TEST*
}
