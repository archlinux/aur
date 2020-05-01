# Maintainer: Cian McGovern <cian@cianmcgovern.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=qt5-base-595
pkgname=(qt5-base-595 qt5-xcb-private-headers-595)
_qtver=5.9.5
pkgver=${_qtver/-/}
pkgrel=2
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework (v5.9.5)'
depends=('libjpeg-turbo' 'xcb-util-keysyms' 'xcb-util-renderutil' 'libgl' 'fontconfig'
         'xcb-util-wm' 'libxrender' 'libxi' 'sqlite' 'xcb-util-image' 'icu' 'pcre2'
         'tslib' 'libinput' 'libsm' 'libxkbcommon-x11' 'libproxy' 'libcups' 'openssl-1.0' 'double-conversion')
makedepends=('libfbclient' 'libmariadbclient' 'sqlite' 'unixodbc' 'postgresql-libs' 'alsa-lib' 'gst-plugins-base-libs'
             'gtk3' 'libpulse' 'cups' 'freetds')
conflicts=('qtchooser')
_pkgfqn="qtbase-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        harmony-fix.diff
        QTBUG-62893.diff)
sha256sums=('7d3ef666d2efcf260a5a0780a1ccd49f897e839e1d9932225be4859ec26730d4'
            '8451c0a86e887492b706950ce533c616e687b790c54e86fb1f405dc2074737a3'
            'b52c6fef1c1d3d7de946144631379d8391a0fbe3905021011ef29fd6f37e84a2')

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

  # https://bugreports.qt.io/browse/QTBUG-62893
  patch -p1 -i ../QTBUG-62893.diff
}

build() {
  cd ${_pkgfqn}

  # FS#38796
  [[ "${CARCH}" = "i686" ]] && SSE2="-no-sse2"

  echo "INCLUDEPATH += /usr/include/openssl-1.0" >> src/network/network.pro
  export OPENSSL_LIBS='-L/usr/lib/openssl-1.0 -lssl -lcrypto'

  PYTHON=/usr/bin/python2 ./configure -confirm-license -opensource -v \
    -prefix /opt/qt595 \
    -docdir /opt/qt595/share/doc/qt \
    -headerdir /opt/qt595/include/qt \
    -archdatadir /opt/qt595/lib/qt \
    -datadir /opt/qt595/share/qt \
    -sysconfdir /etc/xdg \
    -examplesdir /opt/qt595/share/doc/qt/examples \
    -plugin-sql-{psql,mysql,sqlite,odbc,ibase} \
    -system-sqlite \
    -openssl-linked \
    -nomake examples \
    -rpath \
    -optimized-qmake \
    -dbus-linked \
    -system-harfbuzz \
    -journald \
    -no-use-gold-linker \
    -reduce-relocations ${SSE2}

  make
}

package_qt5-base-595() {
  pkgdesc='A cross-platform application and UI framework (v5.9.5)'

  cd ${_pkgfqn}
  make INSTALL_ROOT="${pkgdir}" install

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/opt/qt595/share/licenses/qt5-base-595/LGPL_EXCEPTION.txt

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}/opt/qt595/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  # Fix wrong qmake path in pri file
  sed -i "s|${srcdir}/${_pkgfqn}|/opt/qt595|" \
    "${pkgdir}"/opt/qt595/lib/qt/mkspecs/modules/qt_lib_bootstrap_private.pri

  # Symlinks for backwards compatibility
  for b in "${pkgdir}"/opt/qt595/bin/*; do
    ln -s /opt/qt595/bin/$(basename $b) "${pkgdir}"/opt/qt595/bin/$(basename $b)-qt5
  done
}

package_qt5-xcb-private-headers-595() {
  pkgdesc='Private headers for Qt5 Xcb (v5.9.5)'

  depends=("qt5-base-595=$pkgver")
  optdepends=()
  groups=()
  conflicts=()

  cd ${_pkgfqn}
  install -d -m755 "$pkgdir"/opt/qt595/include/qtxcb-private
  cp -r src/plugins/platforms/xcb/*.h "$pkgdir"/opt/qt595/include/qtxcb-private/
}
