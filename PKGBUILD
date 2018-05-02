# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

_pkgname=scribus
pkgname=${_pkgname}-devel
pkgver=1.5.4
pkgrel=1
pkgdesc="Desktop publishing software"
arch=('i686' 'x86_64')
url="https://www.scribus.net/"
license=('GPL')
depends=('hunspell' 'libcdr' 'libmspub' 'libpagemaker' 'libvisio' 'libzmf' 'podofo'
         'poppler' 'python2' 'qt5-base' 'hicolor-icon-theme' 'harfbuzz-icu')
makedepends=('cmake' 'boost' 'mesa' 'qt5-tools')
optdepends=('tk: scripts based on tkinter'
            'hyphen-lang: hyphenation patterns for desired languages')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("https://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"{,.asc}
        'fix-15289.patch'
        'fix-15289-2.patch')
sha256sums=('6480925250b2bb07028e2f378c02b67fe3e33206743671e03c07c701cd05da03'
            'SKIP'
            '0a782958360ad70145a588a5e1c0044d162344e96b4ff9b0aeb31388cc9b2e36'
            'edb124793e1b838e60cff4c21c536e16c77e91322f9837eab75d9ff06439ad4f')
validpgpkeys=('5086B8D68E70FDDF4C40045AEF7B95E7F60166DA'  # Peter Linnell <plinnell@scribus.net>
              '757F5E9B13DD648887AD50092D47C099E782504E') # The Scribus Team (www.scribus.net) <the_scribus_team@scribus.net>

prepare() {
    cd ${_pkgname}-${pkgver}

    patch -p1 -i ../fix-15289.patch
    patch -p1 -i ../fix-15289-2.patch

    # Fix python name
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
        -DCMAKE_BUILD_TYPE=None \
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
