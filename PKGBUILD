# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Michał Lisowski <lisu [at] riseup [dot] net>
# Contributor: Florian Pritz <flo [at] xssn [dot] at>
# Contributor: Felix Yan <felixonmars [at] archlinux [dot] org>
# Contributor: Andrea Scarpino <andrea[at] archlinux [dot] org>
# Contributor: Pierre Schmitz <pierre [at] archlinux [dot] de>

pkgname=lib32-qt4
pkgver=4.8.7
pkgrel=8
pkgdesc='A cross-platform application and UI framework (32-bit)'
arch=('x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL' 'FDL' 'custom')
depends=("${pkgname#lib32-}" 'lib32-alsa-lib' 'lib32-dbus' 'lib32-fontconfig' 'lib32-glib2'
         'lib32-libgl' 'lib32-libmng' 'lib32-libpng' 'lib32-libsm' 'lib32-libtiff'
         'lib32-libxi' 'lib32-libxrandr' 'lib32-libxv' 'lib32-openssl' 'lib32-sqlite')
makedepends=('cups' 'gcc-multilib'  'lib32-gtk2' 'lib32-libcups' 'lib32-libxfixes' 'lib32-mesa')
optdepends=('lib32-libxcursor: Xcursor support'
            'lib32-libxfixes: Xfixes support'
            'lib32-libxinerama: Xinerama support'
            'lib32-sni-qt: StatusNotifierItem (AppIndicators) support')
options=('staticlibs') # libQtUiTools builds as static only FS#36606
conflicts=('lib32-qt')
replaces=('lib32-qt<=4.8.4')
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("http://download.qt.io/official_releases/qt/4.8/${pkgver}/${_pkgfqn}.tar.gz"
        'improve-cups-support.patch'
        'moc-boost-workaround.patch'
        'kubuntu_14_systemtrayicon.diff'
        'kde4-settings.patch'
        'glib-honor-ExcludeSocketNotifiers-flag.diff'
        'disable-sslv3.patch'
        'l-qclipboard_fix_recursive.patch'
        'l-qclipboard_delay.patch'
        'qt4-gcc6.patch')
sha515sums=('d990ee66bf7ab0c785589776f35ba6ad'
            'c439c7731c25387352d8453ca7574971'
            'da387bde22ae1c446f12525d2a31f070'
            'a523644faa8f98a73f55c4aa23c114a6'
            '66dfea63916c8dbf47b23cb012ffdccc'
            '85679531c8a7310317adfb7002d9f99a'
            '1803ab6313df762d807678e58fc85f53'
            '009de09b4e589a7770fba74405656c99'
            'addc5e88d538ee55e17bd49ba337ca67'
            '98e00c5c7e5fee12e11ecbedd03f01ff')

prepare() {
  cd $_pkgfqn

  # (FS#28381) (KDEBUG#180051)
  patch -p1 -i "${srcdir}"/improve-cups-support.patch

  # QTBUG#22829
  patch -p1 -i "${srcdir}"/moc-boost-workaround.patch

  # http://blog.martin-graesslin.com/blog/2014/06/where-are-my-systray-icons/
  patch -p1 -i "${srcdir}"/kubuntu_14_systemtrayicon.diff

  # FS#45106
  patch -p0 -i "${srcdir}"/kde4-settings.patch

  # fixes for LibreOffice from the upstream Qt bug tracker FS#46436, FS#41648, FS#39819
  # https://bugreports.qt.io/browse/QTBUG-37380
  patch -p1 -i "${srcdir}"/glib-honor-ExcludeSocketNotifiers-flag.diff
  # https://bugreports.qt.io/browse/QTBUG-34614
  patch -p0 -i "${srcdir}"/l-qclipboard_fix_recursive.patch
  # https://bugreports.qt.io/browse/QTBUG-38585
  patch -p0 -i "${srcdir}"/l-qclipboard_delay.patch

  # React to OpenSSL's OPENSSL_NO_SSL3 define
  patch -p1 -i "${srcdir}"/disable-sslv3.patch

  sed -i "s|-O2|${CXXFLAGS} -m32|" mkspecs/common/{g++,gcc}-base.conf
  sed -i "/^QMAKE_LFLAGS_RPATH/s| -Wl,-rpath,||g" mkspecs/common/gcc-base-unix.conf
  sed -i "/^QMAKE_LFLAGS\s/s|+=|+= ${LDFLAGS} -m32|g" mkspecs/common/gcc-base.conf

  sed -i "/^QMAKE_LINK\s/s|g++|g++ -m32|g" mkspecs/common/g++-base.conf
  sed -i "s|-Wl,-O1|-m32 -Wl,-O1|" mkspecs/common/g++-unix.conf
  sed -e "s|-O2|$CXXFLAGS -m32|" \
      -e "/^QMAKE_RPATH/s| -Wl,-rpath,||g" \
      -e "/^QMAKE_LINK\s/s|g++|g++ -m32|g" \
      -e "/^QMAKE_LFLAGS\s/s|+=|+= $LDFLAGS|g" \
      -i mkspecs/common/g++.conf

  cp mkspecs/common/linux{,32}.conf
  sed -i "/^QMAKE_LIBDIR\s/s|=|= /usr/lib32|g" mkspecs/common/linux32.conf
  sed -i "s|common/linux.conf|common/linux32.conf|" mkspecs/linux-g++-32/qmake.conf

  # Fix build with GCC6 (Fedora)
  patch -p1 -i "$srcdir"/qt4-gcc6.patch
}

build() {
  cd $_pkgfqn
  export QT4DIR=${srcdir}/${_pkgfqn}
  export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}
  export CXXFLAGS+=" -std=gnu++98" # Fix build with GCC 6
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'
  
  ./configure -confirm-license -opensource -platform linux-g++-32 \
    -prefix /usr \
    -bindir /usr/lib/qt4/bin \
    -headerdir /usr/include/qt4 \
    -libdir /usr/lib32 \
    -plugindir /usr/lib32/qt4/plugins \
    -importdir /usr/lib32/qt4/imports \
    -datadir /usr/share/qt4 \
    -translationdir /usr/share/qt4/translations \
    -sysconfdir /etc/xdg \
    -system-sqlite \
    -no-phonon \
    -no-phonon-backend \
    -no-webkit \
    -graphicssystem raster \
    -openssl-linked \
    -nomake demos \
    -nomake examples \
    -nomake docs \
    -silent \
    -no-rpath \
    -optimized-qmake \
    -no-reduce-relocations \
    -dbus-linked \
    -no-openvg
  make
}

package() {
  cd $_pkgfqn
  make INSTALL_ROOT="${pkgdir}" install

  # Remove conflicting files.
  rm -rf "${pkgdir}"/usr/{bin,include,lib,share}

  # install license addition
  install -D -m644 LGPL_EXCEPTION.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LGPL_EXCEPTION

  # Fix wrong libs path in pkgconfig files
  find "${pkgdir}/usr/lib32/pkgconfig" -type f -name '*.pc' \
    -exec perl -pi -e "s, -L${srcdir}/?\S+,,g" {} \;

  # Fix wrong bins path in pkgconfig files
  find "${pkgdir}/usr/lib32/pkgconfig" -type f -name '*.pc' \
    -exec sed -i 's|/usr/bin/|/usr/lib/qt4/bin/|g' {} \;

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  # The TGA plugin is broken (FS#33568)
  rm "${pkgdir}"/usr/lib32/qt4/plugins/imageformats/libqtga.so
}
