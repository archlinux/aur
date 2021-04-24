# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: K900 <me@0upti.me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-base-headless
pkgver=5.15.2+kde+r180
pkgrel=1
_commit=ec9a731bc6f4e4bd4262a2500e98d20388bdae09
arch=('x86_64')
url='https://www.qt.io/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework - headless build, no QtGui or QtWidgets'
groups=('qt' 'qt5')
depends=('sqlite' 'libproxy' 'double-conversion')
makedepends=('mariadb-libs' 'unixodbc' 'postgresql-libs' 'dbus' 'systemd' 'md4c' 'git')
optdepends=('postgresql-libs: PostgreSQL driver'
            'mariadb-libs: MariaDB driver'
            'unixodbc: ODBC driver'
            'md4c: C Markdown parser'
            'shared-mime-info: Freedesktop.org Shared MIME Info')
conflicts=('qtchooser' 'qt5-base')
provides=('qt5-base')
_pkgfqn=qtbase
source=(git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit
        qt5-base-cflags.patch
        qt5-base-nostrip.patch)
sha256sums=('SKIP'
            'cf707cd970650f8b60f8897692b36708ded9ba116723ec8fcd885576783fe85c'
            '4b93f6a79039e676a56f9d6990a324a64a36f143916065973ded89adc621e094')

pkgver() {
  cd $_pkgfqn
  echo "5.15.2+kde+r"`git rev-list --count origin/5.15.2..$_commit`
}

prepare() {
  cd ${_pkgfqn}

  git revert -n 6344955d17e17e2398720fe60c34cfc2a4a95208 # Revert version bump
  patch -p1 < ../qt5-base-cflags.patch # Use system CFLAGS in qmake
  patch -p1 < ../qt5-base-nostrip.patch # Don't strip binaries with qmake
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
