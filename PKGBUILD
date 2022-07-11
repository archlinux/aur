# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libfpx
pkgver=1.3.1.10
pkgrel=5
pkgdesc='FlashPIX OpenSource Toolkit'
arch=('x86_64')
url='https://github.com/ImageMagick/libfpx/'
license=('custom')
depends=('gcc-libs')
source=("https://imagemagick.org/archive/delegates/${pkgname}-${pkgver%.*}-${pkgver##*.}.tar.xz"{,.asc}
        '010-libfpx-gcc10-fix.patch'::'https://github.com/ImageMagick/libfpx/commit/c32b340581ba6c88c5092f374f655c7579b598a6.patch')
sha256sums=('491b55535580d27355669c45fe995446bd34df5dbcdc15312e58c3ebecc6a455'
            'SKIP'
            '3223461ed0c79cf1e59c7d684efccceed28a16c6dbbcb54ecd6512f24e1330a1')
validpgpkeys=('D8272EF51DA223E4D05B466989AB63D48277377A')  # Lexie Parsimoniae

prepare() {
    # create a 'LICENSE' file (note: license is in the file 'flashpix.h')
    cp -af "${pkgname}-${pkgver%.*}-${pkgver##*.}"/{flashpix.h,LICENSE}
    
    # erase characters denoting comments
    sed -i '1s/^.\{,3\}//'    "${pkgname}-${pkgver%.*}-${pkgver##*.}/LICENSE"
    sed -i '2,79s/^.\{,2\}//' "${pkgname}-${pkgver%.*}-${pkgver##*.}/LICENSE"
    sed -i '80s/^.\{,3\}//'   "${pkgname}-${pkgver%.*}-${pkgver##*.}/LICENSE"
    
    patch -d "${pkgname}-${pkgver%.*}-${pkgver##*.}" -Np1 -i "${srcdir}/010-libfpx-gcc10-fix.patch"
}

build() {
    cd "${pkgname}-${pkgver%.*}-${pkgver##*.}"
    ./configure --prefix='/usr' --enable-static='no' --enable-shared='yes'
    make
}

check() {
    make -C "${pkgname}-${pkgver%.*}-${pkgver##*.}" check
}

package() {
    make -C "${pkgname}-${pkgver%.*}-${pkgver##*.}" DESTDIR="$pkgdir" install
    install -D -m644 "${pkgname}-${pkgver%.*}-${pkgver##*.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
