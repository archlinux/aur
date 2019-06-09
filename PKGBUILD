# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libfpx
pkgver=1.3.1.10
_srcver="$(printf '%s' "$pkgver" | sed -E s'/(\.)([0-9]*)$/-\2/')"
pkgrel=3
pkgdesc='FlashPIX OpenSource Toolkit'
arch=('x86_64')
url='https://www.imagemagick.org/download/delegates/'
license=('custom')
depends=('gcc-libs')
source=("https://www.imagemagick.org/download/delegates/${pkgname}-${_srcver}.tar.xz")
sha256sums=('491b55535580d27355669c45fe995446bd34df5dbcdc15312e58c3ebecc6a455')

prepare() {
    cd "${pkgname}-${_srcver}"
    
    # create a "LICENSE" file (note: license is in the file 'flashpix.h')
    cp -af flashpix.h LICENSE
    
    # erase characters denoting comments
    sed -i '1s/^.\{,3\}//'    LICENSE
    sed -i '2,79s/^.\{,2\}//' LICENSE
    sed -i '80s/^.\{,3\}//'   LICENSE
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
    cd "${pkgname}-${_srcver}"
    
    make check
}

package() {
    cd "${pkgname}-${_srcver}"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
