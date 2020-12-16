# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: K900 <me@0upti.me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-base-headless
_qtver=5.15.2
pkgver=${_qtver/-/}
pkgrel=1
arch=('x86_64')
url='https://www.qt.io/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework - headless build, no QtGui or QtWidgets'
depends=('sqlite' 'libproxy' 'double-conversion')
makedepends=('mariadb-libs' 'sqlite' 'unixodbc' 'postgresql-libs' 'dbus' 'systemd' 'md4c')
optdepends=('postgresql-libs: PostgreSQL driver'
            'mariadb-libs: MariaDB driver'
            'unixodbc: ODBC driver'
            'md4c: C Markdown parser'
            'shared-mime-info: Freedesktop.org Shared MIME Info')
conflicts=('qtchooser' 'qt5-base')
provides=('qt5-base')
_pkgfqn="qtbase-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        qt5-base-cflags.patch)
sha256sums=('909fad2591ee367993a75d7e2ea50ad4db332f05e1c38dd7a5a274e156a4e0f8'
	    'cf707cd970650f8b60f8897692b36708ded9ba116723ec8fcd885576783fe85c')

prepare() {
  cd ${_pkgfqn}

  patch -p1 -i ../qt5-base-cflags.patch # Use system CFLAGS
}

build() {
  cd ${_pkgfqn}

  ./configure -confirm-license -opensource -v \
    -prefix /usr \
    -docdir /usr/share/doc/qt \
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
    -dbus-linked \
    -system-harfbuzz \
    -journald \
    -no-mimetype-database \
    -no-use-gold-linker \
    -reduce-relocations \
    \
    -no-gui \
    -no-widgets \
    -no-accessibility \
    -no-cups \
    -no-freetype \
    -no-harfbuzz \
    -no-directfb \
    -no-eglfs \
    -no-linuxfb \
    -no-xcb \
    -no-evdev \
    -no-strip
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
