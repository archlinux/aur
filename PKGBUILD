# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgbase=scribus
pkgname=scribus-devel
pkgver=1.5.1
pkgrel=2
pkgdesc='Desktop publishing software'
url='http://www.scribus.net/'
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('cmake' 'boost' 'mesa')
optdepends=('tk: scripts based on tkinter')
depends=('hunspell' 'libcdr' 'libcups' 'libmspub' 'libpagemaker'
         'libvisio' 'podofo' 'poppler' 'python2' 'qt5-declarative'
         'desktop-file-utils' 'hicolor-icon-theme' 'shared-mime-info')
validpgpkeys=('5086B8D68E70FDDF4C40045AEF7B95E7F60166DA')
source=("http://downloads.sourceforge.net/${pkgbase}/${pkgbase}-${pkgver}.tar.xz"{,.asc})
sha256sums=('1882e68713d91c2ab9d6ec7a251dbbe31a4438ee68e63e62d36770541e6f4a38' 'SKIP')
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

package() {
    cd "${srcdir}/${pkgbase}-${pkgver}/build"

    make DESTDIR="${pkgdir}" install
    install -Dm644 ../scribus.desktop "${pkgdir}/usr/share/applications/scribus.desktop"

    for i in 16x16 32x32 128x128 256x256 512x512 1024x1024
    do
        install -Dm644 ../resources/iconsets/artwork/icon_${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}/apps/scribus.png"
    done
}

