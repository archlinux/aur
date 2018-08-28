pkgbase=wxgtk-dev
pkgname=(wxgtk2-dev wxgtk3-dev wxgtk-common-dev)
pkgver=3.1.1
pkgrel=1
arch=('x86_64')
url="https://wxwidgets.org"
license=('custom:wxWindows')
makedepends=('gst-plugins-base' 'gconf' 'glu' 'webkit2gtk' 'libnotify' 'gtk2')
options=('!emptydirs')
source=(https://github.com/wxWidgets/wxWidgets/releases/download/v$pkgver/wxWidgets-$pkgver.tar.bz2
        make-abicheck-non-fatal.patch wxgtk-webkit2gtk.patch::"https://github.com/wxWidgets/wxWidgets/commit/ec6e54bc.patch"
        wxgtk2-fix-webview.patch::"https://github.com/wxWidgets/wxWidgets/commit/fd247cca.patch"
        wxgtk-filezilla-assert.patch::"https://github.com/wxWidgets/wxWidgets/commit/ce1dce11.patch")
sha1sums=('f999c3cf1887c0a60e519214c14b15cb9bb5ea6e'
          'dfe38650c655395b90bf082b5734c4093508bfa3'
          'd2bd62d0852f3647782780565849692e7837c10c'
          '550c368a68eec8b6c32c61da289df76e4dd5a798'
          '1da8af91ef6c590da9c43dd115f52d605730f16a')

prepare() {
  cd wxWidgets-${pkgver}

  # C++ ABI check is too strict and breaks with GCC 5.1
  # https://bugzilla.redhat.com/show_bug.cgi?id=1200611
  #patch -Np1 -i ../make-abicheck-non-fatal.patch

  # Support webkit2gtk
  #sed -e 's|setup0.h|setup.h|g' -i ../wxgtk-webkit2gtk.patch
  #patch -p1 -i ../wxgtk-webkit2gtk.patch
  # fix webview after webkit2gtk port
  #patch -p1 -i ../wxgtk2-fix-webview.patch
  # fix assert in FileZilla
  #patch -p1 -i ../wxgtk-filezilla-assert.patch

  cd ..
  cp -r wxWidgets-${pkgver} wxWidgets-${pkgver}-gtk3
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
  depends=('gtk2' 'gst-plugins-base-libs' 'libsm' 'libxxf86vm' 'wxgtk-common' 'libnotify')
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
  depends=('gtk3' 'gst-plugins-base-libs' 'libsm' 'libxxf86vm' 'wxgtk-common' 'libnotify')
  optdepends=('webkit2gtk: for webview support')
  conflicts=('wxgtk<3.0.3.1-2' 'wxgtk3')
  provides=('wxgtk3')

  cd wxWidgets-${pkgver}-gtk3
  make DESTDIR="${pkgdir}" install  
  rm -r "$pkgdir"/usr/{include,share,lib/libwx_base*,bin/wxrc*}
  mv "$pkgdir"/usr/bin/wx-config{,-gtk3}
   
  install -D -m644 docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
