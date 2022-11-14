# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt6-base-git
pkgver=6.0.0_r58826.g6fa2ee7f4a
pkgrel=1
arch=($CARCH)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework'
depends=(libjpeg-turbo xcb-util-keysyms xcb-util-renderutil libgl fontconfig xdg-utils
         shared-mime-info xcb-util-wm libxrender libxi sqlite xcb-util-image mesa
         tslib libinput libxkbcommon-x11 libproxy libcups double-conversion md4c brotli)
makedepends=(cmake libfbclient mariadb-libs unixodbc postgresql-libs alsa-lib gst-plugins-base-libs
             gtk3 libpulse cups freetds vulkan-headers git)
optdepends=('postgresql-libs: PostgreSQL driver'
            'mariadb-libs: MariaDB driver'
            'unixodbc: ODBC driver'
            'libfbclient: Firebird/iBase driver'
            'freetds: MS SQL driver'
            'gtk3: GTK platform plugin'
            'perl: for fixqt4headers and syncqt')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(qt6)
source=(git+https://code.qt.io/qt/qtbase.git#branch=dev)
sha256sums=('SKIP')

pkgver() {
  cd qtbase
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S qtbase \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALL_BINDIR=lib/qt6/bin \
    -DINSTALL_DOCDIR=share/doc/qt6 \
    -DINSTALL_ARCHDATADIR=lib/qt6 \
    -DINSTALL_DATADIR=share/qt6 \
    -DINSTALL_INCLUDEDIR=include/qt6 \
    -DINSTALL_MKSPECSDIR=lib/qt6/mkspecs \
    -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples \
    -DQT_FEATURE_journald=ON
#    -DQT_FEATURE_openssl_linked=ON
  VERBOSE=1 cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 qtbase/LICENSE* -t "$pkgdir"/usr/share/licenses/$pkgbase

  # Symlinks for backwards compatibility
  mkdir -p "$pkgdir"/usr/bin
  for _b in uic rcc qmake; do
    ln -rs "$pkgdir"/usr/lib/qt6/bin/$_b "$pkgdir"/usr/bin/$_b-qt6
  done
}
