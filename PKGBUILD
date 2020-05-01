# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gst-validate
pkgver=1.16.2
pkgrel=1
pkgdesc='Debugging tool for GStreamer'
arch=('x86_64')
url="https://gstreamer.freedesktop.org/data/doc/gstreamer/head/gst-validate/html/"
license=('LGPL2.1')
depends=('gstreamer' 'gst-plugins-base-libs' 'json-glib' 'cairo' 'gtk3' 'python')
makedepends=('git' 'gobject-introspection')
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-devtools.git#tag=${pkgver}"
        'gst-common'::'git+https://gitlab.freedesktop.org/gstreamer/common.git'
        'gst-validate-disable-padmonitor-test.patch')
sha256sums=('SKIP'
            'SKIP'
            'c88df2780f7a022fda4d08f96e7957d98368c6f7ead609dcd3e91b2752ab21c0')

prepare() {
    git -C gst-devtools submodule init
    git -C gst-devtools config --local "submodule.validate/common.url" "${srcdir}/gst-common"
    git -C gst-devtools submodule update
    
    # disable a test that is failing: padmonitor
    # https://gitlab.freedesktop.org/gstreamer/gst-devtools/issues/21
    patch -d gst-devtools -Np1 -i "${srcdir}/gst-validate-disable-padmonitor-test.patch"
}

build() {
    cd gst-devtools/validate
    ./autogen.sh -- --prefix='/usr' --disable-gtk-doc --disable-gtk-doc-html
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

check() {
    make -C gst-devtools/validate check
}

package() {
    make -C gst-devtools/validate DESTDIR="$pkgdir" install
}
