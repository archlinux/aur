# Maintainer: George Katevenis <george_kate[at]hotmail[dot]com>
# wxgtk-dev (non-opt) maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgbase=wxgtk-dev-314-opt
pkgname=(wxgtk2-dev-314-opt wxgtk3-dev-314-opt wxgtk-common-dev-314-opt)
pkgver=3.1.4
pkgrel=1
arch=('x86_64')
url="https://wxwidgets.org"
license=('custom:wxWindows')
makedepends=('gst-plugins-base' 'glu' 'webkit2gtk' 'libnotify' 'gtk2')
options=('!emptydirs')
source=("https://github.com/wxWidgets/wxWidgets/releases/download/v${pkgver}/wxWidgets-${pkgver}.tar.bz2")
sha1sums=('f8c77e6336b5f6414b07e27baa489fb8abc620c4')
sha256sums=('3ca3a19a14b407d0cdda507a7930c2e84ae1c8e74f946e0144d2fa7d881f1a94')

prepare() {
  cp -a wxWidgets-${pkgver} wxWidgets-${pkgver}-gtk3
}

build() {
  cd wxWidgets-${pkgver}
  ./configure --prefix=/opt/wxgtk-dev-314 --libdir=/opt/wxgtk-dev-314/lib --with-gtk=2 --with-opengl --enable-unicode \
    --enable-graphics_ctx --enable-mediactrl --with-regex=builtin \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --disable-precomp-headers
  make
  make -C locale allmo

  cd ../wxWidgets-${pkgver}-gtk3
  ./configure --prefix=/opt/wxgtk-dev-314 --libdir=/opt/wxgtk-dev-314/lib --with-gtk=3 --with-opengl --enable-unicode \
    --enable-graphics_ctx --enable-mediactrl --enable-webview --with-regex=builtin \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --disable-precomp-headers
  make
}

package_wxgtk-common-dev-314-opt() {
  pkgdesc='Common libraries and headers for wxgtk2 and wxgtk3 (/opt)'
  depends=('zlib' 'gcc-libs' 'expat')

  cd wxWidgets-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "$pkgdir"/opt/wxgtk-dev-314/{bin/wx-config,lib/{wx,libwx_gtk*}}

  install -D -m644 docs/licence.txt "${pkgdir}/opt/wxgtk-dev-314/share/licenses/${pkgname}/LICENSE"
}

package_wxgtk2-dev-314-opt() {
  pkgdesc='GTK+2 implementation of wxWidgets API for GUI (/opt)'
  depends=('gtk2' 'libgl' 'gst-plugins-base-libs' 'libsm' 'libxxf86vm' 'wxgtk-common-dev-314-opt' 'libnotify')

  cd wxWidgets-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "$pkgdir"/opt/wxgtk-dev-314/{include,share,lib/libwx_base*,bin/wxrc*}

  install -D -m644 docs/licence.txt "${pkgdir}/opt/wxgtk-dev-314/share/licenses/${pkgname}/LICENSE"
}

package_wxgtk3-dev-314-opt() {
  pkgdesc='GTK+3 implementation of wxWidgets API for GUI (/opt)'
  depends=('gtk3' 'gst-plugins-base-libs' 'libsm' 'libxxf86vm' 'wxgtk-common-dev-314-opt' 'libnotify')
  optdepends=('webkit2gtk: for webview support')

  cd wxWidgets-${pkgver}-gtk3
  make DESTDIR="${pkgdir}" install  
  rm -r "$pkgdir"/opt/wxgtk-dev-314/{include,share,lib/libwx_base*,bin/wxrc*}
  mv "$pkgdir"/opt/wxgtk-dev-314/bin/wx-config{,-gtk3}

  install -D -m644 docs/licence.txt "${pkgdir}/opt/wxgtk-dev-314/share/licenses/${pkgname}/LICENSE"
}
