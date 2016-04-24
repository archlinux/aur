# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=wxwidgets-light
pkgname=('wxbase-light' 'wxgtk-light' 'wxcommon-light')
pkgver=3.0.2
pkgrel=6
pkgdesc="wxWidgets suite for Base and GTK2 toolkits (GNOME/GStreamer free!)"
arch=('i686' 'x86_64')
url='http://wxwidgets.org'
license=('custom:wxWindows')
makedepends=('git'
             'glu'
             'bash'
             'gtk2'
             'libsm'
             'libgl'
             )
source=("wxwidgets::git+https://github.com/wxWidgets/wxWidgets.git#tag=v${pkgver}"
        'config.conf'
        'wx-config.sh'
        'make-abicheck-non-fatal.patch'
        )
sha1sums=('SKIP'
          '55436b5c57eae798f716e3e486c6834d6274cec5'
          '47df8d82e6c9671212428ea769ff4a3e3f725917'
          'dfe38650c655395b90bf082b5734c4093508bfa3'
          )

prepare() {
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
    --enable-{unicode,graphics_ctx} \
    --without-{libnotify,gnome{vfs,print}} \
    --disable-{precomp-headers,mediactrl,webview}
  make
  make -C ../wxwidgets/locale allmo
}

package_wxbase-light() {
  pkgdesc="wxWidgets Base (GNOME/GStreamer free!)"
  depends=('wxcommon-light' 'expat' 'zlib')
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
  pkgdesc="wxWidgets GTK2 Toolkit (GNOME/GStreamer free!)"
  depends=('wxbase-light' 'gtk2' 'libsm' 'sdl')
  provides=("wxgtk=${pkgver}")
  conflicts=('wxgtk')
  options=('!emptydirs')

  make -C build-gtk DESTDIR="${pkgdir}" install

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

  make -C build-gtk DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin"

  make -C build-base DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin"
  rm -fr "${pkgdir}/usr/lib"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxcommon-light/LICENSE"

  install -Dm644 config.conf "${pkgdir}/etc/wx/config"
  install -Dm755 wx-config.sh "${pkgdir}/usr/bin/wx-config"
}
