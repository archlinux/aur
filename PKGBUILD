# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=wxwidgets-dev-light
pkgname=('wxgtk2-dev-light'
         'wxgtk3-dev-light'
         'wxcommon-dev-light'
         )
pkgver=3.1.6
pkgrel=1
pkgdesc="wxWidgets suite for Base, GTK2 and GTK3 toolkits . Development branch (GNOME/GStreamer free!)"
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
        'wxgtk-abicheck.patch'
        'git+https://github.com/wxWidgets/Catch.git'
        'git+https://github.com/wxWidgets/pcre.git'
        'git+https://github.com/wxWidgets/nanosvg.git'
        'wxGTK-collision.patch'
        )
sha256sums=('SKIP'
            '81d596168253b05a36758235b054542f53e00e488a20da60f458126d46992ce3'
            'SKIP'
            'SKIP'
            'SKIP'
            '605df102a0f1610ab37c5294166644de0d17592d806147b0fb283cb5c3ce172e'
            )
options=('debug')

prepare() {
  mkdir -p build-{base,gtk{2,3}}

  cd wxwidgets

  git config submodule.3rdparty/catch.url "${srcdir}/Catch"
  git config submodule.3rdparty/pcre.url "${srcdir}/pcre"
  git config submodule.3rdparty/nanosvg.url "${srcdir}/nanosvg"
  git submodule update --init \
    3rdparty/catch \
    3rdparty/pcre \
    3rdparty/nanosvg

  patch -Np1 -i "${srcdir}/wxGTK-collision.patch"

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
  pkgdesc="wxWidgets common & base. Development branch (GNOME/GStreamer free!)"
  depends=('expat'
           'curl'
           'libsecret'
           )
  provides=('wxbase-dev-light'
            'wxbase-dev'
            'wxgtk-common-dev'
            )
  conflicts=('wxbase-dev-light'
             'wxbase-dev'
             'wxgtk-common-dev'
             )
  options=('!emptydirs')

  make -C build-gtk2 DESTDIR="${pkgdir}" install
  make -C build-gtk3 DESTDIR="${pkgdir}" install
  make -C build-base DESTDIR="${pkgdir}" install

  make -C build-gtk2 DESTDIR="${pkgdir}" uninstall_advdll uninstall_auidll uninstall_coredll uninstall_gldll uninstall_htmldll uninstall_propgriddll uninstall_qadll uninstall_ribbondll uninstall_richtextdll uninstall_stcdll uninstall_xrcdll
  make -C build-gtk3 DESTDIR="${pkgdir}" uninstall_advdll uninstall_auidll uninstall_coredll uninstall_gldll uninstall_htmldll uninstall_propgriddll uninstall_qadll uninstall_ribbondll uninstall_richtextdll uninstall_stcdll uninstall_xrcdll

  mv "${pkgdir}/usr/bin/wx-config-3.1" "${pkgdir}/usr/bin/wx-config-base-3.1"
  rm -fr "${pkgdir}/usr/bin/wxrc"
  rm -fr "${pkgdir}/usr/lib/wx/"{config,include}/gtk*

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxcommon-dev-light/LICENSE"
}
