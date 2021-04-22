# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=wxwidgets-dev-light
pkgname=('wxbase-dev-light'
         'wxgtk2-dev-light'
         'wxgtk3-dev-light'
         'wxcommon-dev-light'
         )
pkgver=3.1.5
pkgrel=1
pkgdesc="wxWidgets suite for Base and GTK2 and GTK3 toolkits . Development branch (GNOME/GStreamer free!)"
arch=('x86_64')
url='http://wxwidgets.org'
license=('custom:wxWindows')
makedepends=('git'
             'glu'
             'bash'
             'gtk2'
             'gtk3'
             'libsm'
             'libnotify'
             'curl'
             'libsecret'
             'libxtst'
             )
source=("wxwidgets::git+https://github.com/wxWidgets/wxWidgets.git#tag=v${pkgver}"
        'make-abicheck-non-fatal.patch'
        'git+https://github.com/wxWidgets/Catch.git'
        'wxGTK-collision.patch'
        )
sha256sums=('SKIP'
            '214c2d9211e3505e94008747352f5fa07203d4d9087535985a1b6084d4e40ac7'
            'SKIP'
            '7b41947bc72bf8d6edae67837d854390555cc5afc48dda618efd3021b5f6d7a8'
            )

prepare() {
  mkdir -p build-{base,gtk{2,3}}

  cd wxwidgets

  git config submodule.3rdparty/catch.url "${srcdir}/Catch"
  git submodule update --init 3rdparty/catch

  patch -Np1 -i "${srcdir}/wxGTK-collision.patch"

  # C++ ABI check is too strict and breaks with GCC 5.1
  # https://bugzilla.redhat.com/show_bug.cgi?id=1200611
  patch -Np1 -i "${srcdir}/make-abicheck-non-fatal.patch"
}

build() {
  msg2 "Build WxBASE"
  cd "${srcdir}/build-base"
  ../wxwidgets/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-regex=builtin \
    --disable-{precomp-headers,gui}

  make
  make -C ../wxwidgets/locale allmo

  msg2 "Build WxGTK2"
  cd "${srcdir}/build-gtk2"
  ../wxwidgets/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-gtk=2 \
    --with-lib{jpeg,png,tiff,xpm}=sys \
    --with-regex=builtin \
    --with-{opengl,sdl} \
    --enable-graphics_ctx \
    --without-gnomevfs \
    --disable-{gtktest,sdltest,precomp-headers,mediactrl,webview}

  make
  make -C ../wxwidgets/locale allmo

  msg2 "Build WxGTK3"
  cd "${srcdir}/build-gtk3"
  ../wxwidgets/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-gtk=3 \
    --with-lib{jpeg,png,tiff,xpm}=sys \
    --with-regex=builtin \
    --with-{opengl,sdl} \
    --enable-graphics_ctx \
    --without-gnomevfs \
    --disable-{gtktest,sdltest,precomp-headers,mediactrl,webview}

  make
  make -C ../wxwidgets/locale allmo
}

package_wxbase-dev-light() {
  pkgdesc="wxWidgets Base. Development branch (GNOME/GStreamer free!)"
  depends=('expat'
           'curl'
           'libsecret'
           )
  provides=('wxbase-dev')
  conflicts=('wxbase-dev')
  options=('!emptydirs')

  make -C build-base DESTDIR="${pkgdir}" install
  make -C build-gtk2 DESTDIR="${pkgdir}" locale_uninstall

  mv "${pkgdir}/usr/bin/wx-config-3.1" "${pkgdir}/usr/bin/wx-config-base-3.1"
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share/bakefile"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxbase-dev-light/LICENSE"
}

package_wxgtk2-dev-light() {
  pkgdesc="wxWidgets GTK2 Toolkit. Development branch (GNOME/GStreamer free!)"
  depends=('wxcommon-dev-light'
           'gtk2'
           'libsm'
           'sdl2'
           'libnotify'
           'libxtst'
           )
  provides=('wxgtk2-dev')
  conflicts=('wxgtk2-dev')
  options=('!emptydirs')

  make -C build-gtk2 DESTDIR="${pkgdir}" install
  make -C build-gtk2 DESTDIR="${pkgdir}" uninstall_basedll uninstall_netdll uninstall_xmldll locale_uninstall
  make -C build-gtk2/utils DESTDIR="${pkgdir}" uninstall_wxrc

  cp -P "${pkgdir}/usr/bin/wx-config-3.1" "${pkgdir}/usr/bin/wx-config-gtk2-3.1"
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share/bakefile"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxgtk2-dev-light/LICENSE"
}

package_wxgtk3-dev-light() {
  pkgdesc="wxWidgets GTK3 Toolkit. Development branch (GNOME/GStreamer free!)"
  depends=('wxcommon-dev-light'
           'gtk3'
           'libsm'
           'sdl2'
           'libnotify'
           )
  provides=('wxgtk3-dev')
  conflicts=('wxgtk3-dev')
  options=('!emptydirs')

  make -C build-gtk3 DESTDIR="${pkgdir}" install
  make -C build-gtk3 DESTDIR="${pkgdir}" uninstall_basedll uninstall_netdll uninstall_xmldll locale_uninstall
  make -C build-gtk3/utils DESTDIR="${pkgdir}" uninstall_wxrc

  mv "${pkgdir}/usr/bin/wx-config-3.1" "${pkgdir}/usr/bin/wx-config-gtk3-3.1"
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share/bakefile"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxgtk3-dev-light/LICENSE"
}

package_wxcommon-dev-light() {
  pkgdesc="wxWidgets common. Development branch (GNOME/GStreamer free!)"
  depends=('wxbase-dev-light')
  provides=('wxgtk-common-dev')
  conflicts=('wxgtk-common-dev')
  options=('!emptydirs')

  make -C build-gtk2 DESTDIR="${pkgdir}" install
  make -C build-gtk3 DESTDIR="${pkgdir}" install
  make -C build-base DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin/wx-config-3.1"
  rm -fr "${pkgdir}/usr/lib"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxcommon-dev-light/LICENSE"
}
