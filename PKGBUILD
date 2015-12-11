# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=wxpython-light
pkgver=3.0.2.0
pkgrel=2
pkgdesc="A wxWidgets GUI toolkit for Python (GNOME/GStreamer free!)"
arch=('i686' 'x86_64')
license=('custom:wxWindows')
url='http://www.wxpython.org'
depends=('wxgtk-light'
         'python2-opengl'
         'python2-cairo'
         )
makedepends=('git'
             'svn'
             'mesa'
             )
provides=('wxpython')
conflicts=('wxpython')
source=("git+https://github.com/wxWidgets/wxPython.git#tag=wxPy-${pkgver}"
        'svn+http://svn.wxwidgets.org/svn/wx/wxPython/3rdParty/AGW/agw'
        'svn+http://svn.wxwidgets.org/svn/wx/wxPython/3rdParty/FloatCanvas/floatcanvas'
        'svn+http://svn.wxwidgets.org/svn/wx/wxPython/3rdParty/PDFViewer/pdfviewer'
        'svn+http://svn.wxwidgets.org/svn/wx/wxPython/3rdParty/PubSub/pubsub'
        'svn+http://svn.wxwidgets.org/svn/wx/wxPython/3rdParty/XRCed'
        'svn+http://svn.wxwidgets.org/svn/wx/wxPython/3rdParty/Editra')
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

prepare() {
  cd wxPython/wxPython/wx/lib
  cp -R ${srcdir}/agw .
  cp -R ${srcdir}/floatcanvas .
  cp -R ${srcdir}/pdfviewer .
  cp -R ${srcdir}/pubsub .
  cd ../tools
  cp -R ${srcdir}/XRCed .
  cp -R ${srcdir}/Editra .
  sed 's|sys.exit(1)||' -i "Editra/setup.py"
  cd "${srcdir}"
  # Make sure really use python2
  find . -type f -exec sed -i 's/env python/env python2/' {} \;
}

build() {
  cd wxPython
  ./configure --prefix=/usr --libdir=/usr/lib \
              --with-{gtk=2,libjpeg=sys,libpng=sys,libtiff=sys,libxpm=sys,regex=builtin,opengl,sdl} \
              --without-{libnotify,gnomevfs,gnomeprint} \
              --enable-{graphics_ctx,unicode} \
              --disable-{mediactrl,precomp-headers,webview}
  cd wxPython
  python2 setup.py WXPORT=gtk2 UNICODE=1 BUILD_GLCANVAS=1 build
}

package() {
  cd wxPython/wxPython
  python2 setup.py WXPORT=gtk2 UNICODE=1 BUILD_GLCANVAS=1 install --root="${pkgdir}"
  install -D -m644 ../docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd wx/tools/Editra
  python2 setup.py install --root="${pkgdir}"
  rm -r "${pkgdir}/usr/lib/python2.7/site-packages/wx-3.0-gtk2/wx/tools/Editra"
}
