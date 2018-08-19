# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor:orumin <dev at orum.in>

_basename=libwmf
pkgname=lib32-libwmf
pkgver=0.2.8.4
pkgrel=2
pkgdesc="A library for reading vector images in Microsoft's native Windows Metafile Format (WMF) (32-bit)"
arch=('x86_64')
url="http://wvware.sourceforge.net/libwmf.html"
license=('LGPL')
depends=('lib32-expat' 'lib32-freetype2' 'lib32-gdk-pixbuf2' 'libwmf')
makedepends=('lib32-gtk2' 'lib32-libxt')
options=('!docs' '!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/wvware/${_basename}-${pkgver}.tar.gz
        libwmf-0.2.8.4-libpng-1.5.patch
        libwmf-0.2.8.4-useafterfree-CVE-2009-1364.patch
        libwmf-0.2.8.4-intoverflow-CVE-2006-3376.patch
        libwmf-0.2.8.4-CAN-2004-0941.patch
        libwmf-0.2.8.4-CVE-2007-0455.patch
        libwmf-0.2.8.4-CVE-2007-2756.patch
        libwmf-0.2.8.4-CVE-2007-3472.patch
        libwmf-0.2.8.4-CVE-2007-3473.patch
        libwmf-0.2.8.4-CVE-2007-3477.patch
        libwmf-0.2.8.4-CVE-2009-3546.patch
        libwmf-0.2.8.4-CVE-2015-0848+CVE-2015-4588.patch
        libwmf-0.2.8.4-CVE-2015-4695.patch
        libwmf-0.2.8.4-CVE-2015-4696.patch
		libwmf-0.2.8.4-CVE-2016-9011.patch)
sha1sums=('822ab3bd0f5e8f39ad732f2774a8e9f18fc91e89'
          '42aa4c2a82e4e14044c875a7f439baea732a355a'
          'ea6d28880840e86c96f9079bfd591da54dcffa5c'
          '6f130ea9f639ccf88fef0fda74cf9fa3956f81b5'
          '2f8a46698dac6d5f5c3109cb56ad675ff1efaee0'
          '380d59744f174e12d4ba4f5cb63f14b6092850fa'
          '45ae37f79b351fe738212caa3a3c61c9b6fa2d5b'
          '1836f07750d3a8b4dd6354660875436b0e5c3b07'
          'c778b89445f621fd5e44b0bbf9d441cceea90d6c'
          'd0a6fefedd327f99c3ca1c2f7f19adddc2cef50a'
          '83f32dac05c1492eef1e652c553a5ffc80a3e656'
          '5608d0565890f2f89435bc13ad57279900ed83b4'
          '408cfff29160b037b8baa26b4647e02f373b8b85'
          'e250f5ecefde4bf5c06f7fbc562566ce64204f2a'
          '9f8670ef0b4862bb84aecc582bfbec45573a8831')

prepare() {
    cd ${_basename}-${pkgver}

    patch -p1 -i "${srcdir}/libwmf-0.2.8.4-libpng-1.5.patch"
    patch -p1 -i "${srcdir}/libwmf-0.2.8.4-useafterfree-CVE-2009-1364.patch"
    patch -p1 -i "${srcdir}/libwmf-0.2.8.4-intoverflow-CVE-2006-3376.patch"
    patch -p1 -i "${srcdir}/libwmf-0.2.8.4-CAN-2004-0941.patch"
    patch -p1 -i "${srcdir}/libwmf-0.2.8.4-CVE-2007-0455.patch"
    patch -p1 -i "${srcdir}/libwmf-0.2.8.4-CVE-2007-2756.patch"
    patch -p1 -i "${srcdir}/libwmf-0.2.8.4-CVE-2007-3472.patch"
    patch -p1 -i "${srcdir}/libwmf-0.2.8.4-CVE-2007-3473.patch"
    patch -p1 -i "${srcdir}/libwmf-0.2.8.4-CVE-2007-3477.patch"
    patch -p1 -i "${srcdir}/libwmf-0.2.8.4-CVE-2009-3546.patch"
    patch -p1 -i "${srcdir}/libwmf-0.2.8.4-CVE-2015-0848+CVE-2015-4588.patch"
    patch -p1 -i "${srcdir}/libwmf-0.2.8.4-CVE-2015-4695.patch"
    patch -p1 -i "${srcdir}/libwmf-0.2.8.4-CVE-2015-4696.patch"
    patch -p1 -i "${srcdir}/libwmf-0.2.8.4-CVE-2016-9011.patch"
}

build() {
    cd ${_basename}-${pkgver}

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    export FREETYPE_CONFIG='/usr/bin/pkg-config-32 freetype2'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --with-gsfontdir=/usr/share/fonts/Type1 \
        --with-fontdir=/usr/share/fonts/Type1 \
        --with-gsfontmap=/usr/share/ghostscript/9.10/Resource/Init/Fontmap.GS

    make
}

package() {
    cd ${_basename}-${pkgver}

    make DESTDIR="${pkgdir}" install

    rm -r "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/include"

    #Remove fonts, these are in gsfonts
    rm -rf "${pkgdir}/usr/share/fonts"
}
