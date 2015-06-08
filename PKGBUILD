# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase="wxwidgets2.8-light"
pkgname=('wxbase2.8-light' 'wxgtk2.8-light' 'wxcommon2.8-light')
pkgver=2.8.12.1
pkgrel=8
pkgdesc="wxWidgets suite for Base and GTK2 toolkits (GNOME/GStreamer free!)"
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
makedepends=('git' 'bash' 'glu' 'gtk2' 'libsm' 'sdl' 'expat' 'zlib')
source=("wxwidgets::git+https://github.com/wxWidgets/wxPython.git#tag=wxPy-${pkgver}"
        'wxwidgets-2.8-collision.patch'
        'config-2.8.conf'
        'wx-config-2.8.sh'
        'make-abicheck-non-fatal.patch')
sha1sums=('SKIP'
          '75d2292a0058570aa6071b4bee6eef69e47f1208'
          '1539fb4299a05d32dc739b478986cf3b3017d1b9'
          '4156d992b8fbbdc8e596a7c4e548e90295d3cf95'
          'dfe38650c655395b90bf082b5734c4093508bfa3')

prepare() {
  patch -d wxwidgets -p1 -i ../wxwidgets-2.8-collision.patch

  # C++ ABI check is too strict and breaks with GCC 5.1
  # https://bugzilla.redhat.com/show_bug.cgi?id=1200611
  patch -d wxwidgets -Np1 -i ../make-abicheck-non-fatal.patch

  mkdir -p build-{base,gtk}
}

build() {
  cd "${srcdir}/build-base"
  ../wxwidgets/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-regex='builtin' \
    --enable-unicode \
    --disable-{precomp-headers,gui}
  make
  make -C ../wxwidgets/locale allmo

  cd "${srcdir}/build-gtk"
  ../wxwidgets/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
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

package_wxbase2.8-light() {
  pkgdesc="wxWidgets 2.8 Base (GNOME/GStreamer free!)"
  depends=('wxcommon2.8-light' 'expat' 'zlib')
  provides=("wxbase2.8=${pkgver}")
  conflicts=('wxbase2.8')
  options=('!emptydirs')

  make -C build-base DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin/wx-config-2.8"
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share/"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxbase2.8-light/LICENSE"
}

package_wxgtk2.8-light() {
  pkgdesc="wxWidgets 2.8 with GTK2 Toolkit (GNOME/GStreamer free!)"
  depends=('wxbase2.8-light' 'gtk2' 'libsm' 'sdl')
  provides=("wxgtk2.8=${pkgver}")
  conflicts=('wxgtk2.8')
  options=('!emptydirs')

  make -C build-gtk DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin/"wx-config*
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib/"*baseu*
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxgtk2.8-light/LICENSE"
}

package_wxcommon2.8-light() {
  pkgdesc="wxWidgets 2.8 common (GNOME/GStreamer free!)"
  arch=('any')
  depends=('bash')
  provides=("wxcommon2.8=${pkgver}")
  conflicts=('wxcommon2.8')
  options=('!emptydirs')
  backup=('etc/wx/config-2.8')

  make -C build-base DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin"

  make -C build-gtk DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin"
  rm -fr "${pkgdir}/usr/lib"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxcommon2.8-light/LICENSE"

  install -Dm644 config-2.8.conf "${pkgdir}/etc/wx/config-2.8"
  install -Dm755 wx-config-2.8.sh "${pkgdir}/usr/bin/wx-config-2.8"
}