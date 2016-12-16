# Contributer: Eric Bélanger <eric@archlinux.org>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=wxgtk-gtk3
pkgver=3.0.2
pkgrel=6
pkgdesc="GTK+ implementation of wxWidgets API for GUI"
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
depends=('gtk3' 'gstreamer0.10-base' 'libsm'
         'wxgtk' # Some files are shared between these 2 packages.
        )
makedepends=('gstreamer0.10-base-plugins' 'gconf' 'webkitgtk' 'glu')
optdepends=('webkitgtk: for webview support')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/wxwindows/wxWidgets-${pkgver}.tar.bz2
        make-abicheck-non-fatal.patch
        fix-stc-compilation-with-gcc6.patch)
sha1sums=('6461eab4428c0a8b9e41781b8787510484dea800'
          'dfe38650c655395b90bf082b5734c4093508bfa3'
          '498202334c69d49c1ebbc9d36ad382cfa237f3f8')

prepare() {
  cd wxWidgets-${pkgver}

  # C++ ABI check is too strict and breaks with GCC 5.1
  # https://bugzilla.redhat.com/show_bug.cgi?id=1200611
  patch -Np1 -i ../make-abicheck-non-fatal.patch
  patch -Np1 -i ../fix-stc-compilation-with-gcc6.patch
}

build() {
  cd wxWidgets-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib --with-gtk=3 --with-opengl --enable-unicode \
    --enable-graphics_ctx --enable-mediactrl --enable-webview --with-regex=builtin \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --disable-precomp-headers
  make
  make -C locale allmo
}

package() {
  cd wxWidgets-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{bin,include,share} "${pkgdir}/usr/lib/libwx_base"*
  install -D -m644 docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
