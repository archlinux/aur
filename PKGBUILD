# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=wxwidgets-light
pkgname=('wxgtk2-light'
         'wxgtk3-light'
         'wxcommon-light'
         )
pkgver=3.0.5.1
pkgrel=3
pkgdesc="wxWidgets suite for Base, GTK2 and GTK3 toolkits (GNOME/GStreamer free!)"
arch=('x86_64')
url='http://wxwidgets.org'
license=('custom:wxWindows')
makedepends=('git'
             'glu'
             'sh'
             'gtk2'
             'gtk3'
             'libsm'
             'libgl'
             'libnotify'
             )
source=("wxwidgets::git+https://github.com/wxWidgets/wxWidgets.git#tag=v${pkgver}"
        'https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/wxgtk/trunk/wxgtk-abicheck.patch'
        )
sha256sums=('SKIP'
            '53501db871290b71967af08b60aedb738c920a307ef9bd32dd19c30498732cf8'
            )
options=('debug')

prepare() {
  mkdir -p build-{base,gtk{2,3}}

  cd wxwidgets

  # C++ ABI check is too strict
  patch -Np1 -i "${srcdir}/wxgtk-abicheck.patch"
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

package_wxgtk2-light() {
  pkgdesc="wxWidgets GTK2 Toolkit (GNOME/GStreamer free!)"
  depends=('wxcommon-light'
           'libgl'
           'gtk2'
           'libsm'
           'sdl2'
           'libnotify'
           )
  provides=('wxgtk'
            'wxgtk2'
            )
  conflicts=('wxgtk'
             'wxgtk2'
             )
  options=('!emptydirs')

  make -C build-gtk2 DESTDIR="${pkgdir}" install
  make -C build-gtk2 DESTDIR="${pkgdir}" uninstall_basedll uninstall_netdll uninstall_xmldll locale_uninstall
  make -C build-gtk2/utils DESTDIR="${pkgdir}" uninstall_wxrc

  cp -P "${pkgdir}/usr/bin/wx-config" "${pkgdir}/usr/bin/wx-config-gtk2"
  rm -fr "${pkgdir}/usr/bin/"wxrc{,-3.0}
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share/bakefile"
  rm -fr "${pkgdir}/usr/share/"{aclocal,locale}

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxgtk2-light/LICENSE"
}

package_wxgtk3-light() {
  pkgdesc="wxWidgets GTK3 Toolkit (GNOME/GStreamer free!)"
  depends=('wxcommon-light'
           'gtk3'
           'libsm'
           'sdl2'
           'libnotify'
           )
  provides=('wxgtk3')
  conflicts=('wxgtk3')
  options=('!emptydirs')

  make -C build-gtk3 DESTDIR="${pkgdir}" install
  make -C build-gtk3 DESTDIR="${pkgdir}" uninstall_basedll uninstall_netdll uninstall_xmldll locale_uninstall
  make -C build-gtk3/utils DESTDIR="${pkgdir}" uninstall_wxrc

  mv "${pkgdir}/usr/bin/wx-config" "${pkgdir}/usr/bin/wx-config-gtk3"
  rm -fr "${pkgdir}/usr/bin/"wxrc{,-3.0}
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share/bakefile"
  rm -fr "${pkgdir}/usr/share/"{aclocal,locale}

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxgtk3-light/LICENSE"
}

package_wxcommon-light() {
  pkgdesc="wxWidgets common & base (GNOME/GStreamer free!)"
  depends=('sh'
           'expat'
           'zlib'
           )
  provides=('wxbase'
            'wxbase-light'
            'wxgtk-common'
            )
  conflicts=('wxbase'
             'wxbase-light'
             'wxgtk-common'
             )
  options=('!emptydirs')

  make -C build-gtk2 DESTDIR="${pkgdir}" install
  make -C build-gtk3 DESTDIR="${pkgdir}" install
  make -C build-base DESTDIR="${pkgdir}" install

  make -C build-gtk2 DESTDIR="${pkgdir}" uninstall_advdll uninstall_auidll uninstall_coredll uninstall_gldll uninstall_htmldll uninstall_propgriddll uninstall_qadll uninstall_ribbondll uninstall_richtextdll uninstall_stcdll uninstall_xrcdll
  make -C build-gtk3 DESTDIR="${pkgdir}" uninstall_advdll uninstall_auidll uninstall_coredll uninstall_gldll uninstall_htmldll uninstall_propgriddll uninstall_qadll uninstall_ribbondll uninstall_richtextdll uninstall_stcdll uninstall_xrcdll

  mv "${pkgdir}/usr/bin/wx-config" "${pkgdir}/usr/bin/wx-config-base"
  rm -fr "${pkgdir}/usr/bin/wxrc"
  rm -fr "${pkgdir}/usr/lib/wx/"{config,include}/gtk*

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxcommon-light/LICENSE"
}
