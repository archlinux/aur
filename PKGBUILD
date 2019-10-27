# Maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgbase=wxgtk-dev
pkgname=(wxgtk2-dev wxgtk3-dev wxgtk-common-dev)
pkgver=3.1.3
pkgrel=1
arch=('x86_64')
url="https://wxwidgets.org"
license=('custom:wxWindows')
makedepends=('gst-plugins-base' 'gconf' 'glu' 'webkit2gtk' 'libnotify' 'gtk2')
options=('!emptydirs')
source=("https://github.com/wxWidgets/wxWidgets/archive/v${pkgver}.tar.gz")
sha256sums=('a5cb5ea326d76b5e472e9400933cef17c900d5c9b549e40eef00b64fe86d7cb0')

prepare() {
  cp -a wxWidgets-${pkgver} wxWidgets-${pkgver}-gtk3
}

build() {
  cd wxWidgets-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib --with-gtk=2 --with-opengl --enable-unicode \
    --enable-graphics_ctx --enable-mediactrl --with-regex=builtin \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --disable-precomp-headers
  make
  make -C locale allmo

  cd ../wxWidgets-${pkgver}-gtk3
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib --with-gtk=3 --with-opengl --enable-unicode \
    --enable-graphics_ctx --enable-mediactrl --enable-webview --with-regex=builtin \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --disable-precomp-headers
  make
}

package_wxgtk-common-dev() {
  pkgdesc='Common libraries and headers for wxgtk2 and wxgtk3'
  depends=('zlib' 'gcc-libs' 'expat')
  conflicts=('wxgtk-common')
  provides=('wxgtk-common')

  cd wxWidgets-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "$pkgdir"/usr/{bin/wx-config,lib/{wx,libwx_gtk*}}

  install -D -m644 docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_wxgtk2-dev() {
  pkgdesc='GTK+2 implementation of wxWidgets API for GUI'
  depends=('gtk2' 'gst-plugins-base-libs' 'libsm' 'libxxf86vm' 'wxgtk-common-dev' 'libnotify')
  conflicts=('wxgtk' 'wxgtk2')
  provides=('wxgtk' 'wxgtk2')
  replaces=('wxgtk')

  cd wxWidgets-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "$pkgdir"/usr/{include,share,lib/libwx_base*,bin/wxrc*}
  
  install -D -m644 docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_wxgtk3-dev() {
  pkgdesc='GTK+3 implementation of wxWidgets API for GUI'
  depends=('gtk3' 'gst-plugins-base-libs' 'libsm' 'libxxf86vm' 'wxgtk-common-dev' 'libnotify')
  optdepends=('webkit2gtk: for webview support')
  conflicts=('wxgtk<3.0.3.1-2' 'wxgtk3')
  provides=('wxgtk3')

  cd wxWidgets-${pkgver}-gtk3
  make DESTDIR="${pkgdir}" install  
  rm -r "$pkgdir"/usr/{include,share,lib/libwx_base*,bin/wxrc*}
  mv "$pkgdir"/usr/bin/wx-config{,-gtk3}
   
  install -D -m644 docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
