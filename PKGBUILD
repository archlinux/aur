# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase="lib32-wxwidgets-light"
pkgname=('lib32-wxbase-light' 'lib32-wxgtk-light' 'lib32-wxcommon-light')
pkgver=3.0.2
pkgrel=4
pkgdesc="wxWidgets suite for Base and GTK2 toolkits (GNOME/GStreamer free!) (32 bits)"
arch=('x86_64')
url='http://wxwidgets.org'
license=('custom:wxWindows')
makedepends=('lib32-gcc-libs'
             'git'
             'lib32-glu'
             'lib32-gtk2'
             'lib32-libsm'
             'lib32-sdl'
             'lib32-expat'
             'lib32-zlib'
             )
source=("wxwidgets::git+https://github.com/wxWidgets/wxWidgets.git#tag=v${pkgver}"
        'lib32-make-abicheck-non-fatal.patch'
        'lib32-wxwidgets-collision.patch'
        'config32.conf'
        'wx-config32.sh')
sha1sums=('SKIP'
          'ef7d3727381adf62b9f3a9b28120cb7646163666'
          'ef6bf800b1505bb617eeeb0516ab43a6226920a4'
          '55436b5c57eae798f716e3e486c6834d6274cec5'
          '218ec754f1f93affc8f51396304abf5d11b898f2')

prepare() {
  patch -d wxwidgets -Np1 -i ../lib32-wxwidgets-collision.patch

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
      --enable-{unicode,graphics_ctx} \
      --without-{libnotify,gnome{vfs,print}} \
      --disable-{precomp-headers,mediactrl,webview}
  make
  make -C ../wxwidgets/locale allmo
}

package_lib32-wxbase-light() {
  pkgdesc="wxWidgets Base (GNOME/GStreamer free!) (32 bits)"
  depends=('lib32-gcc-libs' 'lib32-wxcommon-light' 'lib32-expat' 'lib32-zlib')
  provides=("lib32-wxbase=${pkgver}")
  conflicts=('lib32-wxbase')
  options=('!emptydirs')

  make -C build-base DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin/"wx-config32*
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share/"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/lib32-wxbase-light/LICENSE"
}

package_lib32-wxgtk-light() {
  pkgdesc="wxWidgets GTK2 Toolkit (GNOME/GStreamer free!) (32 bits)"
  depends=('lib32-wxbase-light' 'lib32-gtk2' 'lib32-libsm' 'lib32-sdl')
  provides=("lib32-wxgtk=${pkgver}")
  conflicts=('lib32-wxgtk')
  options=('!emptydirs')

  make -C build-gtk DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin/"wx-config32*
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib32/"*baseu*
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/lib32-wxgtk-light/LICENSE"
}

package_lib32-wxcommon-light() {
  pkgdesc="wxWidgets common (GNOME/GStreamer free!) (32 bits)"
  arch=('any')
  depends=('wxcommon-light')
  provides=("lib32-wxcommon=${pkgver}")
  conflicts=('lib32-wxcommon')
  options=('!emptydirs')
  backup=('etc/wx/config32')

  make -C build-gtk DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin"

  make -C build-base DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin"
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib32"
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/lib32-wxcommon-light/LICENSE"

  install -Dm644 config32.conf "${pkgdir}/etc/wx/config32"
  install -Dm755 wx-config32.sh "${pkgdir}/usr/bin/wx-config32"
  ln -s wx-config32 "${pkgdir}/usr/bin/wx-config32-3.0"
}