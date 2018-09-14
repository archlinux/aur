# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=qt5-pmp-base
pkgname=(qt5-pmp-base qt5-pmp-xcb-private-headers)
_qtver=5.9.5
pkgver=${_qtver/-/}
pkgrel=2
arch=('x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework (for plex-media-player)'
depends=('libjpeg-turbo' 'xcb-util-keysyms' 'xcb-util-renderutil' 'libgl' 'fontconfig'
         'xcb-util-wm' 'libxrender' 'libxi' 'sqlite' 'xcb-util-image' 'icu' 'pcre2'
         'tslib' 'libinput' 'libsm' 'libxkbcommon-x11' 'libproxy' 'libcups' 'openssl-1.0' 'double-conversion')
makedepends=('libfbclient' 'libmariadbclient' 'sqlite' 'unixodbc' 'postgresql-libs' 'alsa-lib' 'gst-plugins-base-libs'
             'gtk3' 'libpulse' 'cups' 'freetds')
groups=('qt5-pmp')
_pkgfqn="${pkgbase/5-pmp-/}-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        harmony-fix.diff)
sha256sums=('7d3ef666d2efcf260a5a0780a1ccd49f897e839e1d9932225be4859ec26730d4'
            '8451c0a86e887492b706950ce533c616e687b790c54e86fb1f405dc2074737a3')

prepare() {
  cd ${_pkgfqn}

  # Build qmake using Arch {C,LD}FLAGS
  # This also sets default {C,CXX,LD}FLAGS for projects built using qmake
  sed -i -e "s|^\(QMAKE_CFLAGS_RELEASE.*\)|\1 ${CFLAGS}|" \
    mkspecs/common/gcc-base.conf
  sed -i -e "s|^\(QMAKE_LFLAGS_RELEASE.*\)|\1 ${LDFLAGS}|" \
    mkspecs/common/g++-unix.conf

  # Use python2 for Python 2.x
  find . -name '*.py' -exec sed -i \
    's|#![ ]*/usr/bin/python$|&2|;s|#![ ]*/usr/bin/env python$|&2|' {} +

  # Fix missing private includes https://bugreports.qt.io/browse/QTBUG-37417
  sed -e '/CMAKE_NO_PRIVATE_INCLUDES\ \=\ true/d' -i mkspecs/features/create_cmake.prf

  # Freetype 2.8.1
  patch -p1 -i ../harmony-fix.diff
}

build() {
  cd ${_pkgfqn}

  # FS#38796
  [[ "${CARCH}" = "i686" ]] && SSE2="-no-sse2"

  echo "INCLUDEPATH += /usr/include/openssl-1.0" >> src/network/network.pro
  export OPENSSL_LIBS='-L/usr/lib/openssl-1.0 -lssl -lcrypto'

  PYTHON=/usr/bin/python2 ./configure -confirm-license -opensource -v \
    -prefix /opt/qt5-pmp/usr \
    -docdir /opt/qt5-pmp/usr/share/doc/qt \
    -headerdir /opt/qt5-pmp/usr/include/qt \
    -archdatadir /opt/qt5-pmp/usr/lib/qt \
    -datadir /opt/qt5-pmp/usr/share/qt \
    -sysconfdir /etc/xdg \
    -examplesdir /opt/qt5-pmp/usr/share/doc/qt/examples \
    -plugin-sql-{psql,mysql,sqlite,odbc,ibase} \
    -system-sqlite \
    -openssl-linked \
    -nomake examples \
    -no-rpath \
    -optimized-qmake \
    -dbus-linked \
    -system-harfbuzz \
    -journald \
    -no-use-gold-linker \
    -reduce-relocations ${SSE2}

  make
}

package_qt5-pmp-base() {
  pkgdesc='A cross-platform application and UI framework (for plex-media-player)'

  cd ${_pkgfqn}
  make INSTALL_ROOT="${pkgdir}" install

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/opt/qt5-pmp/usr/share/licenses/${pkgbase}/LGPL_EXCEPTION.txt

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}/opt/qt5-pmp/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  # Fix wrong qmake path in pri file
  sed -i "s|${srcdir}/${_pkgfqn}|/usr|" \
    "${pkgdir}"/opt/qt5-pmp/usr/lib/qt/mkspecs/modules/qt_lib_bootstrap_private.pri

  # Symlinks for backwards compatibility
  for b in "${pkgdir}"/opt/qt5-pmp/usr/bin/*; do
    ln -s /opt/qt5-pmp/usr/bin/$(basename $b) "${pkgdir}"/opt/qt5-pmp/usr/bin/$(basename $b)-qt5
  done
}

package_qt5-pmp-xcb-private-headers() {
  pkgdesc='Private headers for Qt5 Xcb (for plex-media-player)'

  depends=("qt5-pmp-base=$pkgver")
  optdepends=()
  groups=()
  conflicts=()

  cd ${_pkgfqn}
  install -d -m755 "$pkgdir"/opt/qt5-pmp/usr/include/qtxcb-private
  cp -r src/plugins/platforms/xcb/*.h "$pkgdir"/opt/qt5-pmp/usr/include/qtxcb-private/
}
