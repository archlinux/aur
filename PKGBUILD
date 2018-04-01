# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

_pkgname=scribus
pkgname=${_pkgname}-devel
pkgver=1.5.3
pkgrel=3
pkgdesc="Desktop publishing software"
arch=('i686' 'x86_64')
url="https://www.scribus.net/"
license=('GPL')
depends=('hunspell' 'libcdr' 'libmspub' 'libpagemaker' 'libvisio' 'podofo'
         'poppler' 'python2' 'qt5-base' 'hicolor-icon-theme' 'harfbuzz-icu')
makedepends=('cmake' 'boost' 'mesa' 'qt5-tools')
optdepends=('tk: scripts based on tkinter'
            'hyphen-lang: hyphenation patterns for desired languages')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("https://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"{,.asc}
        'findOpenSSL.patch'
        'fix-poppler-issue.patch'
        'fix-icu-0.61.1-compilation.patch')
sha256sums=('73a30b4727e19f5d301a936d23a84275cc4f5613a92416cbd843f5167721d74f' 'SKIP'
            'd6d798a370442026e04d56769848761111d63af2ca69a6c2591233da3703dfb4'
            '9e9e954cb30fe606196cb8fc1864983fa571f3a729aec0c3ef01fc577be238a1'
            '9faa7fe6d5c7744511b5472ad0e376162360099b9456aaaf3ec78290b1bfef11')
validpgpkeys=('5086B8D68E70FDDF4C40045AEF7B95E7F60166DA'  # Peter Linnell <plinnell@scribus.net>
              '757F5E9B13DD648887AD50092D47C099E782504E') # The Scribus Team (www.scribus.net) <the_scribus_team@scribus.net>

prepare() {
    cd ${_pkgname}-${pkgver}

    patch -p1 -i ../findOpenSSL.patch
    patch -p1 -i ../fix-poppler-issue.patch
    patch -p1 -i ../fix-icu-0.61.1-compilation.patch

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
