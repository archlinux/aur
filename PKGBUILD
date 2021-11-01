# Merged with official ABS qt5-base PKGBUILD by João, 2021/08/30 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Valentin Hăloiu <vially.ichb+aur@gmail.com>
# Contributor: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgbase=qt5-base-git
pkgname=(qt5-base-git qt5-xcb-private-headers-git)
pkgver=5.15.2+kde_r43999.gc9fde86b0a
pkgrel=1
arch=($CARCH)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework'
depends=(libjpeg-turbo xcb-util-keysyms xcb-util-renderutil libgl fontconfig xdg-utils
         shared-mime-info xcb-util-wm libxrender libxi sqlite xcb-util-image mesa
         tslib libinput libxkbcommon-x11 libproxy libcups double-conversion md4c)
makedepends=(git libfbclient mariadb-libs unixodbc postgresql-libs alsa-lib gst-plugins-base-libs
             gtk3 libpulse cups freetds vulkan-headers)
conflicts=(qtchooser{,-git})
optdepends=('qt5-svg: to use SVG icon themes'
            'qt5-wayland: to run Qt applications in a Wayland session'
            'qt5-translations: for some native UI translations'
            'postgresql-libs: PostgreSQL driver'
            'mariadb-libs: MariaDB driver'
            'unixodbc: ODBC driver'
            'libfbclient: Firebird/iBase driver'
            'freetds: MS SQL driver'
            'gtk3: GTK platform plugin'
            'perl: for fixqt4headers and syncqt')
groups=(qt-git qt5-git)
source=("git+https://invent.kde.org/qt/qt/qtbase.git" qt5-base-cflags.patch qt5-base-nostrip.patch)
sha256sums=('SKIP'
            'cf707cd970650f8b60f8897692b36708ded9ba116723ec8fcd885576783fe85c'
            '4b93f6a79039e676a56f9d6990a324a64a36f143916065973ded89adc621e094')

pkgver() {
  cd qtbase/dist
  _ver="$(ls | sort -V | tail -1 | sed 's/changes-//')"
  echo "$_ver+kde_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd qtbase
  git checkout kde/5.15

  patch -p1 < ../qt5-base-cflags.patch # Use system CFLAGS in qmake
  patch -p1 < ../qt5-base-nostrip.patch # Don't strip binaries with qmake
}

build() {
  cd qtbase
  ./configure -confirm-license -opensource -v \
    -prefix /usr \
    -docdir /usr/share/doc/qt \
    -headerdir /usr/include/qt \
    -archdatadir /usr/lib/qt \
    -datadir /usr/share/qt \
    -sysconfdir /etc/xdg \
    -examplesdir /usr/share/doc/qt/examples \
    -plugin-sql-{psql,mysql,sqlite,odbc,ibase} \
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
    -no-strip
  make
}

package_qt5-base-git() {
  pkgdesc='A cross-platform application and UI framework'
  conflicts=(qt5-base)
  provides=(qt5-base=$pkgver)

  cd qtbase
  make INSTALL_ROOT="${pkgdir}" install

  install -Dm644 LICENSE* -t "$pkgdir"/usr/share/licenses/${pkgbase%-git}

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  # Fix wrong qmake path in pri file
  sed -i "s|${srcdir}/qtbase|/usr|" \
    "${pkgdir}"/usr/lib/qt/mkspecs/modules/qt_lib_bootstrap_private.pri

  # Symlinks for backwards compatibility
  for b in "${pkgdir}"/usr/bin/*; do
    ln -s $(basename $b) "${pkgdir}"/usr/bin/$(basename $b)-qt5
  done
}

package_qt5-xcb-private-headers-git() {
  pkgdesc='Private headers for Qt5 Xcb'

  depends=("qt5-base-git=$pkgver")
  conflicts=(qt5-xcb-private-headers)
  provides=(qt5-xcb-private-headers=$pkgver)

  cd qtbase
  install -d -m755 "$pkgdir"/usr/include/qtxcb-private
  cp -r src/plugins/platforms/xcb/*.h "$pkgdir"/usr/include/qtxcb-private/
}
