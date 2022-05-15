# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=python2-wxpython3
pkgver=3.0.2.0
pkgrel=3
pkgdesc="Classic wxWidgets GUI toolkit for Python"
arch=('x86_64')
license=('custom:wxWindows')
url="https://www.wxpython.org"
depends=('wxgtk3' 'python2')
makedepends=('mesa' 'glu')
conflicts=(wxpython)
replaces=(wxpython)
provides=(wxpython=$pkgver)
source=("https://downloads.sourceforge.net/wxpython/wxPython-src-${pkgver}.tar.bz2"
        "fix-plot.patch"
        "fix-editra-removal.patch")
sha256sums=('d54129e5fbea4fb8091c87b2980760b72c22a386cb3b9dd2eebc928ef5e8df61'
            '2d8b2bdbf55172738c7bf93955e552aac61842800c3b8b0a2e1f07f4314abc65'
            '559b076f206c44e66b33857f49068d66f59a3fc15b97972486e32a8105885554')

prepare() {
    find . -type f -exec sed -i 's/env python/env python2/' {} \;

    cd wxPython-src-${pkgver}/wxPython
    # Fix plot library (FS#42807)
    patch -Np1 -i ../../fix-plot.patch

    # Fix editra removal (FS#63563)
    patch -Np2 -i ../../fix-editra-removal.patch
}

build() {
    cd wxPython-src-${pkgver}
    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib \
        --includedir=/usr/include \
        --with-gtk=3 \
        --with-opengl \
        --enable-unicode \
        --enable-graphics_ctx \
        --disable-precomp-headers \
        --with-regex=sys \
        --with-libpng=sys \
        --with-libxpm=sys \
        --with-libjpeg=sys \
        --with-libtiff=sys \
        --with-wx-config=/usr/bin/wx-config-gtk3
    cd wxPython
    python2 setup.py WX_CONFIG=/usr/bin/wx-config-gtk3 WXPORT=gtk3 UNICODE=1 build
}

package() {
    cd wxPython-src-${pkgver}/wxPython
    python2 setup.py WX_CONFIG=/usr/bin/wx-config-gtk3 WXPORT=gtk3 UNICODE=1 install --root="${pkgdir}" --optimize=1
    for file in "${pkgdir}"/usr/bin/*; do mv "${file}" "${file}2"; done
    install -Dm644 ../docs/licence.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
