pkgname=wxgtk2-tb
pkgver=3.1.1
pkgrel=1
arch=('x86_64')
url="https://wxwidgets.org"
license=('custom:wxWindows')
makedepends=('gst-plugins-base' 'gconf' 'glu' 'webkit2gtk' 'libnotify' 'gtk2')
options=('!emptydirs')

source=(
	https://github.com/wxWidgets/wxWidgets/releases/download/v$pkgver/wxWidgets-$pkgver.tar.bz2
        make-abicheck-non-fatal.patch
	textctrl_osx_return.patch
	textentry_gtk_suppressevents.patch)

sha1sums=('f999c3cf1887c0a60e519214c14b15cb9bb5ea6e'
          'dfe38650c655395b90bf082b5734c4093508bfa3'
          '70006b82c6e0a41225f18f1794256feb61d40d94'
          '9ddee6f612101ed591742b8e93d0564136bd3998')

prepare() {
  cd wxWidgets-${pkgver}

  # C++ ABI check is too strict and breaks with GCC 5.1
  # https://bugzilla.redhat.com/show_bug.cgi?id=1200611
  patch -Np1 -i ../make-abicheck-non-fatal.patch

  # TrenchBroom specific patches
  patch -p0 < ../textctrl_osx_return.patch
  patch -p0 < ../textentry_gtk_suppressevents.patch

  cd ..
}

build() {
  cd wxWidgets-${pkgver}
  ./autogen.sh
  ./configure --prefix=/opt/${pkgname} --with-gtk=2 --with-opengl --enable-unicode \
    --enable-graphics_ctx --enable-mediactrl --with-regex=builtin \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --disable-precomp-headers
  make
  make -C locale allmo
}

package() {
  pkgdesc='GTK+2 implementation of wxWidgets API with TrenchBroom patches'
  depends=('gtk2' 'gst-plugins-base-libs' 'libsm' 'libxxf86vm' 'libnotify' 'zlib' 'gcc-libs' 'expat')
  provides=('wxgtk2-tb')

  cd wxWidgets-${pkgver}
  make DESTDIR="${pkgdir}" install
  
  install -D -m644 docs/licence.txt "${pkgdir}/opt/${pkgname}/share/licenses/${pkgname}/LICENSE"
}
