# Maintainer: George Katevenis <george_kate[at]hotmail[dot]com>
# wxgtk-dev (non-opt) maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgbase=wxgtk-dev-opt
pkgname=(wxgtk2-dev-opt wxgtk3-dev-opt wxgtk-common-dev-opt)
pkgver=3.1.5
pkgrel=1
arch=('x86_64')
url="https://wxwidgets.org"
license=('custom:wxWindows')
makedepends=('gst-plugins-base' 'glu' 'webkit2gtk' 'libnotify' 'gtk2')
options=('!emptydirs')
source=("https://github.com/wxWidgets/wxWidgets/releases/download/v${pkgver}/wxWidgets-${pkgver}.tar.bz2")
sha1sums=('725455d6324baa808259b56a42199237327e0638')
sha256sums=('d7b3666de33aa5c10ea41bb9405c40326e1aeb74ee725bb88f90f1d50270a224')

prepare() {
  cp -a wxWidgets-${pkgver} wxWidgets-${pkgver}-gtk3
}

build() {
  cd wxWidgets-${pkgver}
  ./configure --prefix=/opt/wxgtk-dev --libdir=/opt/wxgtk-dev/lib --with-gtk=2 --with-opengl --enable-unicode \
    --enable-graphics_ctx --enable-mediactrl --with-regex=builtin \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --disable-precomp-headers
  make
  make -C locale allmo

  cd ../wxWidgets-${pkgver}-gtk3
  ./configure --prefix=/opt/wxgtk-dev --libdir=/opt/wxgtk-dev/lib --with-gtk=3 --with-opengl --enable-unicode \
    --enable-graphics_ctx --enable-mediactrl --enable-webview --with-regex=builtin \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --disable-precomp-headers
  make
}

package_wxgtk-common-dev-opt() {
  pkgdesc='Common libraries and headers for wxgtk2 and wxgtk3 (/opt)'
  depends=('zlib' 'gcc-libs' 'expat')

  cd wxWidgets-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "$pkgdir"/opt/wxgtk-dev/{bin/wx-config,lib/{wx,libwx_gtk*}}

  install -D -m644 docs/licence.txt "${pkgdir}/opt/wxgtk-dev/share/licenses/${pkgname}/LICENSE"
}

package_wxgtk2-dev-opt() {
  pkgdesc='GTK+2 implementation of wxWidgets API for GUI (/opt)'
  depends=('gtk2' 'libgl' 'gst-plugins-base-libs' 'libsm' 'libxxf86vm' 'wxgtk-common-dev-opt' 'libnotify')

  cd wxWidgets-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "$pkgdir"/opt/wxgtk-dev/{include,share,lib/libwx_base*,bin/wxrc*}

  install -D -m644 docs/licence.txt "${pkgdir}/opt/wxgtk-dev/share/licenses/${pkgname}/LICENSE"
}

package_wxgtk3-dev-opt() {
  pkgdesc='GTK+3 implementation of wxWidgets API for GUI (/opt)'
  depends=('gtk3' 'gst-plugins-base-libs' 'libsm' 'libxxf86vm' 'wxgtk-common-dev-opt' 'libnotify')
  optdepends=('webkit2gtk: for webview support')

  cd wxWidgets-${pkgver}-gtk3
  make DESTDIR="${pkgdir}" install  
  rm -r "$pkgdir"/opt/wxgtk-dev/{include,share,lib/libwx_base*,bin/wxrc*}
  mv "$pkgdir"/opt/wxgtk-dev/bin/wx-config{,-gtk3}

  install -D -m644 docs/licence.txt "${pkgdir}/opt/wxgtk-dev/share/licenses/${pkgname}/LICENSE"
}
