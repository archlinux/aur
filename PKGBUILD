# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor:  Jan de Groot <jgc@archlinux.org>

pkgname=xorg-fonts-misc-simple
pkgver=1.0.3
pkgrel=6
pkgdesc="X.org misc fonts"
arch=(any)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
provides=('font-misc-ethiopic' 'font-misc-meltho' 'xorg-fonts-misc')
conflicts=('font-misc-ethiopic' 'font-misc-meltho' 'xorg-fonts-misc')
source=(${url}/releases/individual/font/font-arabic-misc-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-cursor-misc-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-daewoo-misc-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-dec-misc-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-isas-misc-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-jis-misc-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-micro-misc-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-misc-ethiopic-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-misc-meltho-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-misc-misc-1.1.2.tar.bz2
        ${url}/releases/individual/font/font-mutt-misc-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-schumacher-misc-1.1.2.tar.bz2
        ${url}/releases/individual/font/font-sony-misc-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-sun-misc-${pkgver}.tar.bz2)
sha256sums=('505d9b12a7093389e67a925dfda6346bde26d114c67f0cdca7aeda6e5d3344f4'
            '17363eb35eece2e08144da5f060c70103b59d0972b4f4d77fd84c9a7a2dba635'
            'bc65de70bee12698caa95b523d3b652c056347e17b68cc8b5d6bbdff235c4be8'
            'e19ddf8b5f8de914d81675358fdfe37762e9ce524887cc983adef34f2850ff7b'
            '5824ab4b485951107dd245b8f7717d2822f1a6dbf6cea98f1ac7f49905c0a867'
            '2b18ce10b367ebafe95a17de799b6db9a24e2337188d124adaf68af05b1fac65'
            '9a3381c10f32d9511f0ad4179df395914c50779103c16cddf7017f5220ed8db6'
            '53cb1fd83afdbe7939c0eac34003676ee0e6023216892d98054db90b703c98a5'
            '3721323f13855cf7ca609115a1f7b182491e9b2b9c6e01eb1a2c7f8edd480791'
            'b8e77940e4e1769dc47ef1805918d8c9be37c708735832a07204258bacc11794'
            'bd5f7adb34367c197773a9801df5bce7b019664941900b2a31fbfe1ff2830f8f'
            'e444028656e0767e2eddc6d9aca462b16a2be75a47244dbc199b2c44eca87e5a'
            '2043a326ba347c9da5ca1e9bc363e2521c3ea40b43b1f9662d333efd4867cff5'
            '481f4fcbbf7005658b080b3cf342c8c76de752e77f47958b2b383de73266d2e0')

build() {
    cd "${srcdir}"
        for dir in *; do
            if [ -d "${dir}" ]; then
                pushd "${dir}"
                ./configure --prefix=/usr \
                    --with-fontdir=/usr/share/fonts/misc
                make
                popd
            fi
    done
}

package() {
    cd "${srcdir}"
    install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    for dir in *; do
        if [ -d "${dir}" ]; then
            pushd "${dir}"
            make DESTDIR="${pkgdir}" install
            install -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.${dir%-*}
            popd
        fi
    done
    rm -f ${pkgdir}/usr/share/fonts/*/fonts.*

    # move .otf files to proper directory - FS#44250
    mv ${pkgdir}/usr/share/fonts/misc/*.otf ${pkgdir}/usr/share/fonts/OTF/

    # remove ttf and otf fonts from package
    rm -r ${pkgdir}/usr/share/fonts/[TO]TF
}
