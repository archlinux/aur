# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

_pkgname=scribus
pkgname=${_pkgname}-devel
pkgver=1.5.2
pkgrel=2
pkgdesc="Desktop publishing software"
arch=('i686' 'x86_64')
url="https://www.scribus.net/"
license=('GPL')
depends=('hunspell' 'libcdr' 'libmspub' 'libpagemaker' 'libvisio' 'podofo'
         'poppler' 'python2' 'qt5-declarative' 'hicolor-icon-theme')
makedepends=('cmake' 'boost' 'mesa' 'qt5-tools')
optdepends=('tk: scripts based on tkinter'
            'hyphen-lang: hyphenation patterns for desired languages')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("https://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"{,.asc}
        "fix-qt-5.8-build.patch")
sha256sums=('ec5eec23aeda655d3a761cffb85853dcd2ede3973b9e62a1b3c28bd1093c74f5' 'SKIP'
            '317e9bc8832b71accd9903cd97d9041cb39cd6afc304196fa2f84a9024dc34b6')
validpgpkeys=('5086B8D68E70FDDF4C40045AEF7B95E7F60166DA') # Peter Linnell <plinnell@scribus.net>

prepare() {
    cd ${_pkgname}-${pkgver}

    patch -p1 -i ../fix-qt-5.8-build.patch

    sed \
        -e 's|#!/usr/bin/python|#!/usr/bin/python2|' \
        -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
        -i scribus/plugins/scriptplugin/{samples,scripts}/*

    mkdir -p build
}

build() {
    cd ${_pkgname}-${pkgver}/build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON
    make
}

package() {
    cd ${_pkgname}-${pkgver}/build

    make DESTDIR="${pkgdir}" install

    cd ..

    install -Dm644 scribus.desktop -t "${pkgdir}"/usr/share/applications

    for i in 16x16 32x32 128x128 256x256 512x512 1024x1024
    do
        install -Dm644 resources/iconsets/artwork/icon_${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}/apps/scribus.png
    done

    # Use system hyphen
    rm -rf "${pkgdir}"/usr/share/scribus/dicts/hyph
    ln -sf /usr/share/hyphen "${pkgdir}"/usr/share/scribus/dicts/hyph
}
