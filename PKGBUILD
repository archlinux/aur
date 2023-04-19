# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: K900 <me@0upti.me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-base-headless
_basever=5.15.9
pkgver=5.15.9+kde+r151
pkgrel=1
_commit=84152777a48af444a902bbf4df8b38146171c20d
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework - headless build, no QtGui or QtWidgets'
depends=('sqlite' 'libproxy' 'double-conversion')
makedepends=('mariadb-libs' 'unixodbc' 'postgresql-libs' 'dbus' 'systemd' 'md4c' 'git')
optdepends=('postgresql-libs: PostgreSQL driver'
            'mariadb-libs: MariaDB driver'
            'unixodbc: ODBC driver'
            'md4c: C Markdown parser'
            'shared-mime-info: Freedesktop.org Shared MIME Info')
conflicts=('qtchooser' 'qt5-base')
provides=('qt5-base')
groups=('qt' 'qt5')
_pkgfqn=qtbase
source=(git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit
        qmake-cflags.patch
        qmake-config.patch)
sha256sums=('SKIP'
            '5411edbe215c24b30448fac69bd0ba7c882f545e8cf05027b2b6e2227abc5e78'
            '4abc22150fa3e06b2fdcec32146abc9be4e316692aa4d5bd5aa53b4b726783fa')

pkgver() {
  cd $_pkgfqn
  echo "$_basever+kde+r"`git rev-list --count v$_basever-lts-lgpl..$_commit` | sed -e 's|+kde+r0||'
}

prepare() {
  cd ${_pkgfqn}
  patch -p1 < ../qmake-cflags.patch # Use system CFLAGS in qmake
  patch -p1 < ../qmake-config.patch # Don't strip binaries with qmake and use -ltcg, cf. QTBUG-73834
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
    -no-reduce-relocations \
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
    \
    -no-strip \
    -ltcg
# No configure flag for fat static libs with lto
  bin/qmake CONFIG+=fat-static-lto -- -redo
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
