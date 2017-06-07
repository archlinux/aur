# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=heif
pkgver=2.0
pkgrel=1
pkgdesc='High Efficiency Image File Format'
arch=('x86_64' 'i686')
url='https://nokiatech.github.io/heif/'
license=('custom')
makedepends=('cmake')
source=(https://github.com/nokiatech/heif/archive/v${pkgver}.tar.gz
        gcc7.patch)
sha512sums=('ac2c04bb31698e35da62af7ab1973bff363d97a495f68dc366e676cc1b8a32d1b4c3608efafc45198f769f2aadadd873f972801bbf011610b0e982d18e323826'
            'b61a9d77f420c11acbf4e71f634deace2a7c27042e327989c1d394a30a58ea1d7465f57219b209449de91b18f4a2da100a13ef992d6b35dc43156fdd8f6e17a1')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 < "${srcdir}/gcc7.patch"
    cmake .
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "Bins/writerapp" "${pkgdir}/usr/bin/${pkgname}"
    cd Srcs
    install -Dm644 -t "${pkgdir}/usr/lib/" \
        common/libcommon.a \
        jsonlib/libjson.a \
        parser/avcparser/libavcparser.a \
        parser/h265parser/libh265parser.a \
        reader/libheifreader.a \
        writer/libheifwriter.a
}
