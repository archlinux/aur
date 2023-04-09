# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=wxwidgets-light
pkgname=('wxwidgets-common-light'
         'wxwidgets-gtk3-light'
#          'wxwidgets-gtk4-light'
         'wxwidgets-qt5-light'
         )
pkgver=3.2.2.1
pkgrel=2
pkgdesc="wxWidgets suite for Base, Qt5 and GTK3 toolkits (GNOME/GStreamer free!)"
arch=('x86_64')
url='http://wxwidgets.org'
license=('custom:wxWindows')
makedepends=('git'
             'cmake'
             'glu'
             'webkit2gtk'
             'gtk3'
#              'gtk4'
             'libnotify'
             'qt5-base'
             'sdl2'
             'libmspack'
             'libsecret'
             'sh'
             'gspell'
             )
source=("wxwidgets::git+https://github.com/wxWidgets/wxWidgets.git#tag=v${pkgver}"
        'git+https://github.com/wxWidgets/nanosvg.git'
        )
sha256sums=('SKIP'
            'SKIP'
            )
options=('debug')

prepare() {
  cd wxwidgets

  # fix https://github.com/wxWidgets/wxWidgets/issues/22750
  git cherry-pick 19100f63ca0e19234010230bcd854b53d4989f7b -m 1

  git config submodule.3rdparty/nanosvg.url "${srcdir}/nanosvg"
  git -c protocol.file.allow=always submodule update --init \
    3rdparty/nanosvg
}

build() {
  msg2 "Build WxBASE"
  cmake -S wxwidgets -B build-base \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DwxUSE_GUI=OFF \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys \
    -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=ON \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_LIBSDL=ON \
    -DwxUSE_STL=ON \
    -DwxUSE_PRIVATE_FONTS=ON

  cmake --build build-base

  msg2 "Build WxGTK3"
    cmake -S wxwidgets -B build-gtk3 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DwxBUILD_TOOLKIT=gtk3 \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys \
    -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=ON \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_LIBSDL=ON \
    -DwxUSE_STL=ON \
    -DwxUSE_MEDIACTRL=OFF \
    -DwxUSE_PRIVATE_FONTS=ON \
    -DwxUSE_GTKPRINT=ON \
    -DwxUSE_DETECT_SM=ON \
    -DwxUSE_AUTOID_MANAGEMENT=ON

  cmake --build build-gtk3

#   msg2 "Build WxGTK4"
#     cmake -S wxwidgets -B build-gtk4 \
#     -DCMAKE_INSTALL_PREFIX=/usr \
#     -DCMAKE_BUILD_TYPE=None \
#     -DwxBUILD_TOOLKIT=gtk4 \
#     -DwxUSE_OPENGL=ON \
#     -DwxUSE_REGEX=sys \
#     -DwxUSE_ZLIB=sys \
#     -DwxUSE_EXPAT=sys \
#     -DwxUSE_LIBJPEG=sys \
#     -DwxUSE_LIBPNG=sys \
#     -DwxUSE_LIBTIFF=sys \
#     -DwxUSE_LIBLZMA=ON \
#     -DwxUSE_LIBMSPACK=ON \
#     -DwxUSE_LIBSDL=ON \
#     -DwxUSE_STL=ON \
#     -DwxUSE_MEDIACTRL=OFF \
#     -DwxUSE_PRIVATE_FONTS=ON \
#     -DwxUSE_GTKPRINT=ON \
#     -DwxUSE_DETECT_SM=ON \
#     -DwxUSE_AUTOID_MANAGEMENT=ON

#   cmake --build build-gtk4

  msg2 "Build WxQT5"
  cmake -S wxwidgets -B build-qt5 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DwxBUILD_TOOLKIT=qt \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys \
    -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=ON \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_LIBSDL=ON \
    -DwxUSE_STL=ON \
    -DwxUSE_MEDIACTRL=OFF \
    -DwxUSE_PRIVATE_FONTS=ON \
    -DwxUSE_DETECT_SM=ON \
    -DwxUSE_AUTOID_MANAGEMENT=ON

  cmake --build build-qt5

  # Run configure to generate the Makefile, cmake doesn't install translations
  cd wxwidgets
  ./configure \
    --prefix=/usr \
    --disable-tests
}

package_wxwidgets-qt5-light() {
pkgdesc="wxWidgets Qt5 Toolkit (GNOME/GStreamer free!)"
  depends=('wxwidgets-common-light'
           'qt5-base'
           'sdl2'
           'libmspack.so'
           )
  provides=('wxwidgets-qt5'
            'wxwidgets'
            )
  conflicts=('wxwidgets-qt5')

  make -C build-qt5 DESTDIR="${pkgdir}" install

  mv "${pkgdir}/usr/bin/wx-config" "${pkgdir}/usr/bin/wx-config-qt"
  rm -fr "${pkgdir}/usr/bin/"wxrc{,-3*}
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib/"*base*
  rm -fr "${pkgdir}/usr/lib/cmake"
  rm -fr "${pkgdir}/usr/share/bakefile"
  rm -fr "${pkgdir}/usr/share/"{aclocal,locale}

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxwidgets-qt5-light/LICENSE"
}

package_wxwidgets-gtk3-light() {
  pkgdesc="wxWidgets GTK3 Toolkit (GNOME/GStreamer free!)"
  depends=('wxwidgets-common-light'
           'sdl2'
           'libgspell-1.so'
           'libgtk-3.so'
           'libmspack.so'
           'libnotify.so'
           'libtiff.so'
           )
  optdepends=('webkit2gtk: for webview support')
  provides=('wxwidgets'
            'wxwidgets-gtk3'
            'wxgtk3'
            )
  conflicts=('wxwidgets-gtk3'
             'wxgtk3'
             )
  replaces=('wxgtk3-light'
            'wxgtk3'
            )

  make -C build-gtk3 DESTDIR="${pkgdir}" install

  ln -s wx-config "${pkgdir}/usr/bin/wx-config-gtk3"
  rm -fr "${pkgdir}/usr/bin/"wxrc{,-3*}
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib/"*base*
  rm -fr "${pkgdir}/usr/lib/cmake"
  rm -fr "${pkgdir}/usr/share/bakefile"
  rm -fr "${pkgdir}/usr/share/"{aclocal,locale}


  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxwidgets-gtk3-light/LICENSE"
}

package_wxwidgets-gtk4-light() {
  pkgdesc="wxWidgets GTK4 Toolkit (GNOME/GStreamer free!)"
  depends=('wxwidgets-common-light'
           'sdl2'
           'libgspell-1.so'
           'libgtk-4.so'
           'libmspack.so'
           'libnotify.so'
           'libtiff.so'
           )
  optdepends=('webkit2gtk: for webview support')
  provides=('wxwidgets'
            'wxwidgets-gtk4'
            'wxgtk4'
            )
  conflicts=('wxwidgets-gtk4'
             'wxgtk4'
             )
  replaces=('wxgtk4-light'
            'wxgtk4'
            )

  make -C build-gtk3 DESTDIR="${pkgdir}" install

  ln -s wx-config "${pkgdir}/usr/bin/wx-config-gtk4"
  rm -fr "${pkgdir}/usr/bin/"wxrc{,-3*}
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib/"*base*
  rm -fr "${pkgdir}/usr/lib/cmake"
  rm -fr "${pkgdir}/usr/share/bakefile"
  rm -fr "${pkgdir}/usr/share/"{aclocal,locale}


  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxwidgets-gtk4-light/LICENSE"
}

package_wxwidgets-common-light() {
  pkgdesc="wxWidgets common & base (GNOME/GStreamer free!)"
  depends=('sh'
           'libexpat.so'
           'libsecret-1.so'
           'libpcre2-32.so'
           )
  provides=('wxbase'
            'wxbase-light'
            'wxgtk-common'
            'wxwidgets-common'
            )
  conflicts=('wxbase'
             'wxbase-light'
             'wxgtk-common'
             'wxwidgets-common'
             )
  replaces=('wxcommon-light'
            'wxgtk-common'
            )

  make -C build-qt5 DESTDIR="${pkgdir}" install
  make -C build-gtk3 DESTDIR="${pkgdir}" install
#   make -C build-gtk4 DESTDIR="${pkgdir}" install
  make -C build-base DESTDIR="${pkgdir}" install

  mv "${pkgdir}/usr/bin/wx-config" "${pkgdir}/usr/bin/wx-config-base"
  rm -fr "${pkgdir}/usr/lib/"*qt*.so*
  rm -fr "${pkgdir}/usr/lib/"*gtk*.so*
  rm -fr "${pkgdir}/usr/lib/wx/"{config,include}/{gtk,qt}*
  rm -fr "${pkgdir}/usr/lib/wx/"3*

  install -Dm644 wxwidgets/wxwin.m4 -t "${pkgdir}/usr/share/aclocal"
  # Install translations
  make DESTDIR="${pkgdir}" -C wxwidgets locale_install

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxwidgets-common-light/LICENSE"
}
