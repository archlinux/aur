# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgbase=scribus
pkgname=scribus-devel
pkgver=1.5.2
pkgrel=1
pkgdesc='Desktop publishing software'
url='http://www.scribus.net/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('hunspell' 'libcdr' 'libcups' 'libmspub' 'libpagemaker'
         'libvisio' 'podofo' 'poppler' 'python2' 'qt5-declarative'
         'desktop-file-utils' 'hicolor-icon-theme' 'shared-mime-info')
makedepends=('cmake' 'boost' 'mesa' 'qt5-tools')
optdepends=('tk: scripts based on tkinter')
validpgpkeys=('5086B8D68E70FDDF4C40045AEF7B95E7F60166DA')
source=("http://downloads.sourceforge.net/${pkgbase}/${pkgbase}-${pkgver}.tar.xz"{,.asc})
sha256sums=('ec5eec23aeda655d3a761cffb85853dcd2ede3973b9e62a1b3c28bd1093c74f5' 'SKIP')
conflicts=("${pkgbase}")
provides=("${pkgbase}")

prepare() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    sed \
        -e 's|#!/usr/bin/python|#!/usr/bin/python2|' \
        -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
        -i scribus/plugins/scriptplugin/{samples,scripts}/*

    install -d build
}

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}/build"
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON \
        -DLIB_SUFFIX=""
    make
}

package_scribus-devel() {
    cd "${srcdir}/${pkgbase}-${pkgver}/build"

    make DESTDIR="${pkgdir}" install
    install -Dm644 ../scribus.desktop "${pkgdir}/usr/share/applications/scribus.desktop"

    for i in 16x16 32x32 128x128 256x256 512x512 1024x1024
    do
        install -Dm644 ../resources/iconsets/artwork/icon_${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}/apps/scribus.png"
    done
}

