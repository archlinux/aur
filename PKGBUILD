# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase="lib32-wxwidgets2.8-light"
pkgname=('lib32-wxbase2.8-light' 'lib32-wxgtk2.8-light' 'lib32-wxcommon2.8-light')
pkgver=2.8.12.1
pkgrel=4
pkgdesc="wxWidgets suite for Base and GTK2 toolkits (GNOME/GStreamer free!) (32 bits)"
arch=('x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
makedepends=('lib32-gcc-libs' 'git' 'lib32-glu' 'lib32-gtk2' 'lib32-libsm' 'lib32-sdl' 'lib32-expat' 'lib32-zlib')
source=("wxwidgets::git+https://github.com/wxWidgets/wxPython.git#tag=wxPy-${pkgver}"
        'lib32-make-abicheck-non-fatal.patch'
        'lib32-wxwidgets2.8-collision.patch'
        'config32-2.8.conf'
        'wx-config32-2.8.sh')
sha1sums=('SKIP'
          'dfe38650c655395b90bf082b5734c4093508bfa3'
          '21860e53f83f72acd4c184643dc59c9da07f2582'
          'eb89553e312f9b423121963bad1c1eeba36d2b8f'
          '218ec754f1f93affc8f51396304abf5d11b898f2')

prepare() {
  patch -d wxwidgets -p1 -i ../lib32-wxwidgets2.8-collision.patch

  # C++ ABI check is too strict and breaks with GCC 5.1
  # https://bugzilla.redhat.com/show_bug.cgi?id=1200611
  patch -d wxwidgets -Np1 -i ../lib32-make-abicheck-non-fatal.patch

  mkdir -p build-{base,gtk}
}

build() {

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS="-I/usr/include/libtiff32 $CFLAGS"
  export CXXFLAGS="-I/usr/include/libtiff32 $CXXFLAGS"

  cd "${srcdir}/build-base"
  ../wxwidgets/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-regex='builtin' \
    --enable-unicode \
    --disable-{precomp-headers,gui}
  make
  make -C ../wxwidgets/locale allmo

  cd "${srcdir}/build-gtk"
  ../wxwidgets/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-gtk='2' \
    --with-lib{jpeg,png,tiff,xpm}='sys' \
    --with-regex='builtin' \
    --with-{opengl,sdl} \
    --enable-{graphics_ctx,unicode} \
    --without-{libnotify,gnomevfs,gnomeprint} \
    --disable-{mediactrl,precomp-headers,webview}
  make
  make -C ../wxwidgets/locale allmo
}

package_lib32-wxbase2.8-light() {
  pkgdesc="wxWidgets 2.8 Base (GNOME/GStreamer free!) (32 bits)"
  depends=('lib32-gcc-libs' 'lib32-wxcommon2.8-light' 'lib32-expat' 'lib32-zlib')
  provides=("lib32-wxbase2.8=${pkgver}")
  conflicts=('lib32-wxbase2.8')
  options=('!emptydirs')

  make -C build-base DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin/"wx-config32*
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share/"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/lib32-wxbase2.8-light/LICENSE"
}

package_lib32-wxgtk2.8-light() {
  pkgdesc="wxWidgets 2.8 with GTK2 Toolkit (GNOME/GStreamer free!) (32 bits)"
  depends=('lib32-wxbase2.8-light' 'lib32-gtk2' 'lib32-libsm' 'lib32-sdl')
  provides=("lib32-wxgtk2.8=${pkgver}")
  conflicts=('lib32-wxgtk2.8')
  options=('!emptydirs')

  make -C build-gtk DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin/"wx-config32*
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib32/"*baseu*
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/lib32-wxgtk2.8-light/LICENSE"
}

package_lib32-wxcommon2.8-light() {
  pkgdesc="wxWidgets 2.8 common (GNOME/GStreamer free!) (32 bits)"
  arch=('any')
  depends=('wxcommon2.8-light')
  provides=("lib32-wxcommon2.8=${pkgver}")
  conflicts=('lib32-wxcommon2.8')
  options=('!emptydirs')
  backup=('etc/wx/config32-2.8')

  make -C build-base DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin"

  make -C build-gtk DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin"
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib32"
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/lib32-wxcommon2.8-light/LICENSE"

  install -Dm644 config32-2.8.conf "${pkgdir}/etc/wx/config32-2.8"
  install -Dm755 wx-config32-2.8.sh "${pkgdir}/usr/bin/wx-config32-2.8"
}