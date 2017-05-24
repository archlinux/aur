# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=wxwidgets-light
pkgname=('wxbase-light'
         'wxgtk-light'
         'wxcommon-light'
         )
pkgver=3.0.3
pkgrel=1
pkgdesc="wxWidgets suite for Base and GTK2 and GTK3 toolkits (GNOME/GStreamer free!)"
arch=('i686' 'x86_64')
url='http://wxwidgets.org'
license=('custom:wxWindows')
makedepends=('git'
             'glu'
             'bash'
             'gtk2'
             'gtk3'
             'libsm'
             'libgl'
             )
source=("wxwidgets::git+https://github.com/wxWidgets/wxWidgets.git#tag=v${pkgver}"
        'config.conf'
        'wx-config.sh'
        'make-abicheck-non-fatal.patch'
        )
sha256sums=('SKIP'
            '770b976681e7b5fe513b1b6dcabc1472802eb67fc777a07e903a77772825120f'
            '55a54da8396923f413bdf0c582ade281e014dc6f7ab65854b0f0fe24d4697c2a'
            '46a1bb97d69163547da13d5e23a4c73e68de27ee601da5d2fb5bc5c417931453'
            )

prepare() {
  mkdir -p build-{base,gtk{2,3}}

  cd wxwidgets

  # C++ ABI check is too strict and breaks with GCC 5.1
  # https://bugzilla.redhat.com/show_bug.cgi?id=1200611
  patch -Np1 -i "${srcdir}/make-abicheck-non-fatal.patch"
}

build() {
  cd "${srcdir}/build-base"
  ../wxwidgets/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-regex=builtin \
    --enable-unicode \
    --disable-{precomp-headers,gui}
  make
  make -C ../wxwidgets/locale allmo

  cd "${srcdir}/build-gtk2"
  ../wxwidgets/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
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
    --libdir=/usr/lib \
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

package_wxbase-light() {
  pkgdesc="wxWidgets Base (GNOME/GStreamer free!)"
  depends=('wxcommon-light'
           'expat'
           'zlib'
           )
  provides=("wxbase=${pkgver}")
  conflicts=('wxbase')
  options=('!emptydirs')

  make -C build-base DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin/wx-config"
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share/"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxbase-light/LICENSE"
}

package_wxgtk-light() {
  pkgdesc="wxWidgets GTK2 and GTK3 Toolkit (GNOME/GStreamer free!)"
  depends=('wxbase-light'
           'gtk2'
           'gtk3'
           'libsm'
           'sdl'
           )
  provides=("wxgtk=${pkgver}")
  conflicts=('wxgtk')
  options=('!emptydirs')

  make -C build-gtk2 DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/usr/bin"

  make -C build-gtk3 DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin/wx-config"
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib/"*baseu*
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxgtk-light/LICENSE"
}

package_wxcommon-light() {
  pkgdesc="wxWidgets common (GNOME/GStreamer free!)"
  arch=('any')
  depends=('bash')
  provides=("wxcommon=${pkgver}")
  conflicts=('wxcommon')
  options=('!emptydirs')
  backup=('etc/wx/config')

  make -C build-gtk2 DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/usr/bin"

  make -C build-gtk3 DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/usr/bin"

  make -C build-base DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/usr/bin"

  rm -fr "${pkgdir}/usr/lib"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxcommon-light/LICENSE"

  install -Dm644 config.conf "${pkgdir}/etc/wx/config"
  install -Dm755 wx-config.sh "${pkgdir}/usr/bin/wx-config"
}
