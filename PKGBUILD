# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libfpx
pkgver=1.3.1.10
_srcver="$(printf '%s' "$pkgver" | sed -E s'/(\.)([0-9]*)$/-\2/')"
pkgrel=4
pkgdesc='FlashPIX OpenSource Toolkit'
arch=('x86_64')
url='https://github.com/ImageMagick/libfpx/'
license=('custom')
depends=('gcc-libs')
source=("https://www.imagemagick.org/download/delegates/${pkgname}-${_srcver}.tar.xz"
        '010-libfpx-gcc10-fix.patch')
sha256sums=('491b55535580d27355669c45fe995446bd34df5dbcdc15312e58c3ebecc6a455'
            'e93f193b199023c5e2e2557c4f21fc276b8784f5a07363729235c42c16066cbd')

prepare() {
    # create a 'LICENSE' file (note: license is in the file 'flashpix.h')
    cp -af "${pkgname}-${_srcver}"/{flashpix.h,LICENSE}
    
    # erase characters denoting comments
    sed -i '1s/^.\{,3\}//'    "${pkgname}-${_srcver}/LICENSE"
    sed -i '2,79s/^.\{,2\}//' "${pkgname}-${_srcver}/LICENSE"
    sed -i '80s/^.\{,3\}//'   "${pkgname}-${_srcver}/LICENSE"
    
    patch -d "${pkgname}-${_srcver}" -Np1 -i "${srcdir}/010-libfpx-gcc10-fix.patch"
}

build() {
    cd "${pkgname}-${_srcver}"
    ./configure \
        --prefix='/usr' \
        --enable-static='no' \
        --enable-shared='yes'
    make
}

check() {
    make -C "${pkgname}-${_srcver}" check
}

package() {
    make -C "${pkgname}-${_srcver}" DESTDIR="$pkgdir" install
    install -D -m644 "${pkgname}-${_srcver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
