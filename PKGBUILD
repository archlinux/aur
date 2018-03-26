# Maintainer: Frederic Van Assche <frederic@fredericva.com>
# Original maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=wxpython-gtk2
pkgver=3.0.2.0
pkgrel=6
pkgdesc="A wxWidgets GUI toolkit for Python (GTK2 version)"
arch=('x86_64')
license=('custom:wxWindows')
url="https://www.wxpython.org"
depends=('wxgtk2' 'python2')
makedepends=('mesa' 'glu' 'svn')
provides=('wxpython')
conflicts=('wxpython')
source=("https://github.com/wxWidgets/wxPython/archive/wxPy-${pkgver}.tar.gz"
        "fix-plot.patch")
sha256sums=('b068d76e9773c5b0cb0620a66827fca35b8ab9364a2fc8b865ef125720b26afc'
            '2d8b2bdbf55172738c7bf93955e552aac61842800c3b8b0a2e1f07f4314abc65')

prepare() {
    find . -type f -exec sed -i 's/env python/env python2/' {} \;

    cd wxPython-wxPy-${pkgver}/wxPython
    # Fix plot library (FS#42807)
    patch -Np1 -i ../../fix-plot.patch
}

build() {
    cd wxPython-wxPy-${pkgver}
    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib \
        --includedir=/usr/include \
        --with-gtk=2 \
        --with-opengl \
        --enable-unicode \
        --enable-graphics_ctx \
        --disable-precomp-headers \
        --with-regex=sys \
        --with-libpng=sys \
        --with-libxpm=sys \
        --with-libjpeg=sys \
        --with-libtiff=sys
#        --with-wx-config=/usr/bin/wx-config-gtk3
    cd wxPython
    bin/subrepos-make
    python2 setup.py WXPORT=gtk2 UNICODE=1 build
}

package() {
    cd wxPython-wxPy-${pkgver}/wxPython
    python2 setup.py WXPORT=gtk2 UNICODE=1 install --root="${pkgdir}"
    install -Dm644 ../docs/licence.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
