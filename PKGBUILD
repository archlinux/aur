# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Headless by: K900 <me@0upti.me>

pkgname=qt5-base-headless
_qtver=5.13.0
pkgver=${_qtver/-/}
pkgrel=1
arch=('x86_64')
url='https://www.qt.io/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework - headless build (no QtGui or QtWidgets)'
depends=('sqlite' 'libproxy' 'double-conversion' 'pcre2' 'glib2' 'icu' 'zstd')
makedepends=('mariadb-libs' 'sqlite' 'unixodbc' 'postgresql-libs' 'dbus')
optdepends=('postgresql-libs: PostgreSQL driver'
            'mariadb-libs: MariaDB driver'
            'unixodbc: ODBC driver'
            'freetds: MS SQL driver'
	    'python: build scripts for Apple platforms'
	    'dbus: DBus module')
conflicts=('qtchooser' 'qt5-base')
provides=('qt5-base')
_pkgfqn="qtbase-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        qtbase-zlib-compression.patch::"https://code.qt.io/cgit/qt/qtbase.git/patch/?id=cbdc9a77")
sha256sums=('ff6964b3b528cd3b1d21bcf3470006e8e5cbe69591923f982871d886ea0488fe'
            '9300d8ab7abe4145e92eea75178a26ad3d5a71b0646665c3776ca2c375dd1233')

prepare() {
  cd ${_pkgfqn}

  # Build qmake using Arch {C,LD}FLAGS
  # This also sets default {C,CXX,LD}FLAGS for projects built using qmake
  sed -i -e "s|^\(QMAKE_CFLAGS_RELEASE.*\)|\1 ${CFLAGS}|" \
    mkspecs/common/gcc-base.conf
  sed -i -e "s|^\(QMAKE_LFLAGS_RELEASE.*\)|\1 ${LDFLAGS}|" \
    mkspecs/common/g++-unix.conf

  patch -p1 -i ../qtbase-zlib-compression.patch # Change the default compression back to zlib for backwards compatibility
}

build() {
  cd ${_pkgfqn}

  ./configure -confirm-license -opensource -v \
    -prefix /usr \
    -headerdir /usr/include/qt \
    -archdatadir /usr/lib/qt \
    -datadir /usr/share/qt \
    -sysconfdir /etc/xdg \
    -examplesdir /usr/share/doc/qt/examples \
    -plugin-sql-{psql,mysql,sqlite,odbc} \
    -system-sqlite \
    -openssl-linked \
    -nomake examples \
    -no-rpath \
    -optimized-qmake \
    -dbus-linked \
    -system-harfbuzz \
    -journald \
    -no-mimetype-database \
    -no-use-gold-linker \
    -reduce-relocations \
    \
    \
    -no-gui \
    -no-widgets \
    -no-xcb \
    -no-eglfs \
    -no-directfb \
    -no-cups \
    -no-accessibility \
    -no-freetype \
    -no-harfbuzz
  
  make
}

package() {
  cd ${_pkgfqn}
  make INSTALL_ROOT="${pkgdir}" install

  install -Dm644 LICENSE* -t "$pkgdir"/usr/share/licenses/$pkgbase

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  # Fix wrong qmake path in pri file
  sed -i "s|${srcdir}/${_pkgfqn}|/usr|" \
    "${pkgdir}"/usr/lib/qt/mkspecs/modules/qt_lib_bootstrap_private.pri

  # Symlinks for backwards compatibility
  for b in "${pkgdir}"/usr/bin/*; do
    ln -s $(basename $b) "${pkgdir}"/usr/bin/$(basename $b)-qt5
  done
}
