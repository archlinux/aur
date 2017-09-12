# Maintainer: Herry Sugiharto <herrysugiharto@gmail.com>
# Original Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=wxpython-nuitka
pkgver=3.0.2.0
pkgrel=3
pkgdesc="A wxWidgets GUI toolkit for Python. Nuitka compilable version."
arch=('i686' 'x86_64' 'armv7h')
license=('custom:wxWindows')
url="https://www.wxpython.org"
depends=('wxgtk3' 'python2')
makedepends=('mesa' 'glu')
provides=('wxpython=3.0.2.0')
conflicts=('wxpython')
source=("https://downloads.sourceforge.net/wxpython/wxPython-src-${pkgver}.tar.bz2"
        "wxpython-nuitka-methods.patch")
sha256sums=('d54129e5fbea4fb8091c87b2980760b72c22a386cb3b9dd2eebc928ef5e8df61'
            'c9266e81f6b9206675717c7c2aa082ec44bf694cd7f10318b2581831d9e517cc')

prepare() {
    find . -type f -exec sed -i 's/env python/env python2/' {} \;
    cd wxPython-src-${pkgver}
    patch -Np1 -i ../../wxpython-nuitka-methods.patch
    cd ${srcdir}
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
    python2 setup.py WX_CONFIG=/usr/bin/wx-config-gtk3 WXPORT=gtk3 UNICODE=1 install --root="${pkgdir}"
    install -Dm644 ../docs/licence.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
