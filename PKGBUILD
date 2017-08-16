# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_digest='http://www.imagemagick.org/download/delegates/digest.rdf'
_srcver=$(curl -s "$_digest" | grep -o 'libfpx-.*\.tar\.xz' | sed 's/[^0-9\.-]*//g' | sed -r 's/.//;s/.{2}$//')
_srcver_regex=$(printf '%s' "$_srcver" | sed 's/\./\\\./g') # translate $_srcver to a regular expression

pkgname=libfpx
pkgver="$(printf '%s' "$_srcver"| tr '-' '.')" # there is no download archive of all previous versions
pkgrel=2
pkgdesc='FlashPIX OpenSource Toolkit'
arch=('i686' 'x86_64')
url='http://www.imagemagick.org/download/delegates/'
license=('custom')
depends=('gcc-libs')
makedepends=('curl')
provides=('libfpx.so')
source=("http://www.imagemagick.org/download/delegates/${pkgname}-${_srcver}.tar.xz")
sha256sums=("$(curl -s "$_digest" | grep -A5 "${pkgname}-${_srcver_regex}\.tar\.xz" |
                                    grep 'sha256'                                   |
                                    grep -oE '>[[:alnum:]]*?<'                      |
                                    sed 's/[><]//g')")

build() {
    cd "${pkgname}-${_srcver}"
    ./configure \
        --prefix='/usr' \
        --enable-static='no' \
        --enable-shared='yes'
    make
}

package() {
    cd "${pkgname}-${_srcver}"
    make DESTDIR="$pkgdir" install
    
    # create a "LICENSE" file (note: license is in the file 'flashpix.h')
    cp -af flashpix.h LICENSE
    
    # erase characters denoting comments
    sed -i '1s/^.\{,3\}//'    LICENSE
    sed -i '2,79s/^.\{,2\}//' LICENSE
    sed -i '80s/^.\{,3\}//'   LICENSE
    
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
