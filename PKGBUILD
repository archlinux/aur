# Maintainer: George Katevenis <george_kate[at]hotmail[dot]com>
# wxgtk-dev (non-opt) maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgbase=wxgtk-3.1.5
pkgname=(wxgtk2-3.1.5 wxgtk3-3.1.5 wxgtk-common-3.1.5)
pkgver=3.1.5
pkgrel=1
arch=('x86_64')
url="https://wxwidgets.org"
license=('custom:wxWindows')
makedepends=('gst-plugins-base' 'glu' 'webkit2gtk' 'libnotify' 'gtk2')
options=('!emptydirs')
source=("https://github.com/wxWidgets/wxWidgets/releases/download/v${pkgver}/wxWidgets-${pkgver}.tar.bz2"
        wxgtk-3.15.conf)
sha1sums=('725455d6324baa808259b56a42199237327e0638'
          '14c776df227acabcb0c40eeca131041bace05b67')
sha256sums=('d7b3666de33aa5c10ea41bb9405c40326e1aeb74ee725bb88f90f1d50270a224'
            '23305c5ee0cf209401b872d3e28d2b1ea3a3a6447bda732047cae01a32dc4175')

prepare() {
  cp -a wxWidgets-${pkgver} wxWidgets-${pkgver}-gtk3
}

build() {
  cd wxWidgets-${pkgver}
  ./configure --prefix=/opt/wxgtk-3.1.5 --libdir=/opt/wxgtk-3.1.5/lib --with-gtk=2 --with-opengl --enable-unicode \
    --enable-graphics_ctx --enable-mediactrl --with-regex=builtin \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --disable-precomp-headers
  make
  make -C locale allmo

  cd ../wxWidgets-${pkgver}-gtk3
  ./configure --prefix=/opt/wxgtk-3.1.5 --libdir=/opt/wxgtk-3.1.5/lib --with-gtk=3 --with-opengl --enable-unicode \
    --enable-graphics_ctx --enable-mediactrl --enable-webview --with-regex=builtin \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --disable-precomp-headers
  make
}

package_wxgtk-common-3.1.5() {
  pkgdesc='Common libraries and headers for wxgtk2 and wxgtk3, v3.1.5 installed in /opt/wxgtk-3.1.5/'
  depends=('zlib' 'gcc-libs' 'expat')

  cd wxWidgets-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "$pkgdir"/opt/wxgtk-3.1.5/{bin/wx-config,lib/{wx,libwx_gtk*}}

  install -D -m644  ../wxgtk-3.15.conf -t "${pkgdir}/etc/ld.so.conf.d/"
  install -D -m644 docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_wxgtk2-3.1.5() {
  pkgdesc='GTK+2 implementation of wxWidgets API for GUI, v3.1.5 installed in /opt/wxgtk-3.1.5/'
  depends=('gtk2' 'libgl' 'gst-plugins-base-libs' 'libsm' 'libxxf86vm' 'wxgtk-common-3.1.5' 'libnotify')

  cd wxWidgets-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "$pkgdir"/opt/wxgtk-3.1.5/{include,share,lib/libwx_base*,bin/wxrc*}

  install -D -m644 docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_wxgtk3-3.1.5() {
  pkgdesc='GTK+3 implementation of wxWidgets API for GUI, v3.1.5 installed in /opt/wxgtk-3.1.5/'
  depends=('gtk3' 'gst-plugins-base-libs' 'libsm' 'libxxf86vm' 'wxgtk-common-3.1.5' 'libnotify')
  optdepends=('webkit2gtk: for webview support')

  cd wxWidgets-${pkgver}-gtk3
  make DESTDIR="${pkgdir}" install  
  rm -r "$pkgdir"/opt/wxgtk-3.1.5/{include,share,lib/libwx_base*,bin/wxrc*}
  mv "$pkgdir"/opt/wxgtk-3.1.5/bin/wx-config{,-gtk3}

  install -D -m644 docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
