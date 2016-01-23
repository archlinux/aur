# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=asciidoc-git
_pkgname=asciidoc
pkgver=8.6.9.84.gd919c61
pkgrel=1
pkgdesc='Text document format for short documents, articles, books and UNIX man pages.'
arch=('any')
url='git+http://www.methods.co.nz/asciidoc/'
license=('GPL')
depends=('python2' 'libxslt' 'docbook-xsl')
provides=('asciidoc')
conflicts=('asciidoc')
optdepends=('lilypond: music-filter'
            'imagemagick: music-filter (used in conjunction with lilypond)'
            'source-highlight: source-highlight-filter'
            'dblatex: pdf generation'
            'fop: alternative pdf generation'
            'lynx: text generation'
            'w3m: text generation (alternative to lynx)')
source=('git+https://github.com/asciidoc/asciidoc.git')
sha1sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/-/./g;s/^v//'
}

prepare() {
    cd $_pkgname

    # python2 fix
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' \
        a2x.py \
        asciidoc.py \
        asciidocapi.py \
        filters/code/code-filter.py \
        filters/graphviz/graphviz2png.py \
        filters/latex/latex2img.py \
        filters/music/music2png.py
    sed -i 's_python a2x.py_./a2x.py_' \
        Makefile.in
}

build() {
    cd $_pkgname

    autoconf -i
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc
}

package() {
    cd $_pkgname

    make install DESTDIR=$pkgdir

    install -Dm644 asciidocapi.py \
        $pkgdir/usr/lib/python2.7/site-packages/asciidocapi.py
}
