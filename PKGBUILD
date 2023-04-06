# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=wxwidgets-dev-light
pkgname=(
  'wxgtk2-dev-light'
  'wxgtk3-dev-light'
  'wxcommon-dev-light'
)
pkgver=3.2.2.1
_shortver=$(sed -E -e 's@^([0-9]+\.[0-9]+).*$@\1@' <(echo $pkgver))
pkgrel=1
pkgdesc="wxWidgets suite for Base, GTK2 and GTK3 toolkits . Development branch (GNOME/GStreamer free!)"
arch=('x86_64')
# http://wxwidgets.org
url="https://github.com/wxWidgets/wxWidgets"
license=('custom:wxWindows')
makedepends=(
  'bash'
  'curl'
  'git'
  'glu'
  'gtk2'
  'gtk3'
  'libnotify'
  'libsecret'
  'libsm'
  'libxtst'
)
source=(
  "wxwidgets::git+$url#tag=v$pkgver"

  "catch"::"git+https://github.com/wxWidgets/Catch"
  "expat"::"git+https://github.com/wxWidgets/libexpat"
  "jpeg"::"git+https://github.com/wxWidgets/libjpeg-turbo"
  "nanosvg"::"git+https://github.com/wxWidgets/nanosvg"
  "pcre"::"git+https://github.com/wxWidgets/pcre"
  "png"::"git+https://github.com/wxWidgets/libpng"
  "tiff"::"git+https://github.com/wxWidgets/libtiff"
  "zlib"::"git+https://github.com/wxWidgets/zlib"

  'wxGTK-collision.patch'
  'wxgtk-abicheck.patch'
)
sha256sums=(
  'SKIP'

  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'

  '605df102a0f1610ab37c5294166644de0d17592d806147b0fb283cb5c3ce172e'
  '81d596168253b05a36758235b054542f53e00e488a20da60f458126d46992ce3'
)
options=('debug')

prepare() {
  mkdir -p build-{base,gtk{2,3}}

  cd wxwidgets

  _submodules=(
    src/expat
    src/jpeg
    src/png
    src/tiff
    src/zlib
    3rdparty/catch
    3rdparty/nanosvg
    3rdparty/pcre
  )
  for submodule in ${_submodules[@]} ; do
    git submodule init ${submodule}
    git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
    git -c protocol.file.allow=always submodule update ${submodule}
  done

  for p in "$srcdir"/*.patch ; do
    echo "Applying patch: ${p##*/}"
    patch -Np1 -i "$p"
  done
}

build() {
  echo "Build WxBASE"
  cd "$srcdir/build-base"
  ../wxwidgets/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-regex=builtin \
    --disable-{precomp-headers,gui}

  make
  make -C ../wxwidgets/locale allmo

  echo "Build WxGTK2"
  cd "$srcdir/build-gtk2"
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

  echo "Build WxGTK3"
  cd "$srcdir/build-gtk3"
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
  depends=(
    'wxcommon-dev-light'
    'gtk2'
    'libsm'
    'sdl2'
    'libnotify'
    'libxtst'
  )
  provides=('wxgtk2-dev')
  conflicts=('wxgtk2-dev')
  options=('!emptydirs')

  make -C build-gtk2 DESTDIR="$pkgdir" install
  make -C build-gtk2 DESTDIR="$pkgdir" uninstall_basedll uninstall_netdll uninstall_xmldll locale_uninstall
  make -C build-gtk2/utils DESTDIR="$pkgdir" uninstall_wxrc

  cp -P "$pkgdir/usr/bin/wx-config-$_shortver" "$pkgdir/usr/bin/wx-config-gtk2-$_shortver"
  rm -fr "$pkgdir/usr/include"
  rm -fr "$pkgdir/usr/share/bakefile"

  install -Dm644 wxwidgets/docs/licence.txt "$pkgdir/usr/share/licenses/wxgtk2-dev-light/LICENSE"
}

package_wxgtk3-dev-light() {
  pkgdesc="wxWidgets GTK3 Toolkit. Development branch (GNOME/GStreamer free!)"
  depends=(
    'wxcommon-dev-light'
    'gtk3'
    'libsm'
    'sdl2'
    'libnotify'
  )
  provides=('wxgtk3-dev')
  conflicts=('wxgtk3-dev')
  options=('!emptydirs')

  make -C build-gtk3 DESTDIR="$pkgdir" install
  make -C build-gtk3 DESTDIR="$pkgdir" uninstall_basedll uninstall_netdll uninstall_xmldll locale_uninstall
  make -C build-gtk3/utils DESTDIR="$pkgdir" uninstall_wxrc

  mv "$pkgdir/usr/bin/wx-config-$_shortver" "$pkgdir/usr/bin/wx-config-gtk3-$_shortver"
  rm -fr "$pkgdir/usr/include"
  rm -fr "$pkgdir/usr/share/bakefile"

  install -Dm644 wxwidgets/docs/licence.txt "$pkgdir/usr/share/licenses/wxgtk3-dev-light/LICENSE"
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

  make -C build-gtk2 DESTDIR="$pkgdir" install
  make -C build-gtk3 DESTDIR="$pkgdir" install
  make -C build-base DESTDIR="$pkgdir" install

  make -C build-gtk2 DESTDIR="$pkgdir" uninstall_advdll uninstall_auidll uninstall_coredll uninstall_gldll uninstall_htmldll uninstall_propgriddll uninstall_qadll uninstall_ribbondll uninstall_richtextdll uninstall_stcdll uninstall_xrcdll
  make -C build-gtk3 DESTDIR="$pkgdir" uninstall_advdll uninstall_auidll uninstall_coredll uninstall_gldll uninstall_htmldll uninstall_propgriddll uninstall_qadll uninstall_ribbondll uninstall_richtextdll uninstall_stcdll uninstall_xrcdll

  mv "$pkgdir/usr/bin/wx-config-$_shortver" "$pkgdir/usr/bin/wx-config-base-$_shortver"
  rm -fr "$pkgdir/usr/bin/wxrc"
  rm -fr "$pkgdir/usr/lib/wx/"{config,include}/gtk*

  install -Dm644 wxwidgets/docs/licence.txt "$pkgdir/usr/share/licenses/wxcommon-dev-light/LICENSE"
}
