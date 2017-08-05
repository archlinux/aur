# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase="lib32-wxwidgets-light"
pkgname=('lib32-wxbase-light'
         'lib32-wxgtk2-light'
         'lib32-wxgtk3-light'
         'lib32-wxcommon-light'
         )
pkgver=3.0.3
pkgrel=3
pkgdesc="wxWidgets suite for Base and GTK2 and GTK3 toolkits (GNOME/GStreamer free!) (32 bits)"
arch=('x86_64')
url='http://wxwidgets.org'
license=('custom:wxWindows')
makedepends=('lib32-gcc-libs'
             'git'
             'lib32-glu'
             'lib32-gtk2'
             'lib32-gtk3'
             'lib32-libsm'
             'lib32-sdl'
             'lib32-expat'
             'lib32-zlib'
             )
source=("wxwidgets::git+https://github.com/wxWidgets/wxWidgets.git#tag=v${pkgver}"
        'lib32-make-abicheck-non-fatal.patch'
        'lib32-wxwidgets-collision.patch'
        )
sha256sums=('SKIP'
            'd4c2d070a06eb63f0a018c8cf687589e5ffdec601225b4d16a268ffe390fb58b'
            'c73c51f4b65a779462a4e0923a7e3bc7fe28457258fc8bfb5d843d87df119364'
            )

prepare() {
  mkdir -p build-{base,gtk{2,3}}

  cd wxwidgets

  patch -p1 -i "${srcdir}/lib32-wxwidgets-collision.patch"

  # C++ ABI check is too strict and breaks with GCC 5.1
  # https://bugzilla.redhat.com/show_bug.cgi?id=1200611
  patch -p1 -i "${srcdir}/lib32-make-abicheck-non-fatal.patch"
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
      --with-regex=builtin \
      --enable-unicode \
      --disable-{precomp-headers,gui}

  make
  make -C ../wxwidgets/locale allmo

  cd "${srcdir}/build-gtk2"
  ../wxwidgets/configure \
      --prefix=/usr \
      --libdir=/usr/lib32 \
      --with-gtk=2 \
      --with-lib{jpeg,png,tiff,xpm}=sys \
      --with-regex=builtin \
      --with-{opengl,sdl} \
      --enable-{unicode,graphics_ctx} \
      --without-{libnotify,gnome{vfs,print}} \
      --disable-{precomp-headers,mediactrl,webview}

  make
  make -C ../wxwidgets/locale allmo

  cd "${srcdir}/build-gtk3"
  ../wxwidgets/configure \
      --prefix=/usr \
      --libdir=/usr/lib32 \
      --with-gtk=3 \
      --with-lib{jpeg,png,tiff,xpm}=sys \
      --with-regex=builtin \
      --with-{opengl,sdl} \
      --enable-{unicode,graphics_ctx} \
      --without-{libnotify,gnome{vfs,print}} \
      --disable-{precomp-headers,mediactrl,webview}

  make
  make -C ../wxwidgets/locale allmo
}

package_lib32-wxbase-light() {
  pkgdesc="wxWidgets Base (GNOME/GStreamer free!) (32 bits)"
  depends=('bash'
           'wxbase-light'
           'lib32-gcc-libs'
           'lib32-expat'
           'lib32-zlib'
           )
  provides=('lib32-wxbase')
  conflicts=('lib32-wxbase')
  options=('!emptydirs')

  make -C build-base DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin/wx-config32"
  mv "${pkgdir}/usr/bin/wx-config32-3.0" "${pkgdir}/usr/bin/wx-config32-3.0-base"
  (cd "${pkgdir}/usr/bin"; ln -s wx-config32-3.0-base wx-config32-base)
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/lib32-wxbase-light/LICENSE"
}

package_lib32-wxgtk2-light() {
  pkgdesc="wxWidgets GTK2 Toolkit (GNOME/GStreamer free!) (32 bits)"
  depends=('wxgtk2-light'
           'lib32-wxbase-light'
           'lib32-gtk2'
           'lib32-libsm'
           'lib32-sdl2'
           )
  provides=('lib32-wxgtk'
            'lib32-wxgtk2'
            )
  conflicts=('lib32-wxgtk'
             'lib32-wxgtk2'
             )
  options=('!emptydirs')

  make -C build-gtk2 DESTDIR="${pkgdir}" install

  cp -P "${pkgdir}/usr/bin/wx-config32" "${pkgdir}/usr/bin/wx-config32-gtk2"
  cp -P "${pkgdir}/usr/bin/wx-config32-3.0" "${pkgdir}/usr/bin/wx-config32-3.0-gtk2"
  rm -fr "${pkgdir}/usr/bin/"wxrc32{,-3.0}
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib32/"*baseu*
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/lib32-wxgtk2-light/LICENSE"
}

package_lib32-wxgtk3-light() {
  pkgdesc="wxWidgets GTK3 Toolkit (GNOME/GStreamer free!) (32 bits)"
  depends=('wxgtk3-light'
           'lib32-wxbase-light'
           'lib32-gtk3'
           'lib32-libsm'
           'lib32-sdl2'
           )
  provides=('lib32-wxgtk3')
  conflicts=('lib32-wxgtk3')
  options=('!emptydirs')

  make -C build-gtk3 DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin/wx-config32"
  mv "${pkgdir}/usr/bin/wx-config32-3.0" "${pkgdir}/usr/bin/wx-config32-3.0-gtk3"
  (cd "${pkgdir}/usr/bin"; ln -s wx-config32-3.0-gtk3 wx-config32-gtk3)
  rm -fr "${pkgdir}/usr/bin/"wxrc32{,-3.0}
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib32/"*baseu*
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/lib32-wxgtk3-light/LICENSE"
}

package_lib32-wxcommon-light() {
  pkgdesc="wxWidgets common (GNOME/GStreamer free!) (32 bits)"
  depends=('wxcommon-light'
           'lib32-wxbase-light'
           )
  provides=('lib32-wxcommon'
            'lib32-wxgtk-common'
            )
  conflicts=('lib32-wxcommon'
             'lib32-wxgtk-common'
            )
  options=('!emptydirs')

  make -C build-gtk2 DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/usr/bin"
  make -C build-gtk3 DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/usr/bin/"wx-config32{,-3.0}
  make -C build-base DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin/"wx-config32{,-3.0}
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib32"
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/lib32-wxcommon-light/LICENSE"
}
