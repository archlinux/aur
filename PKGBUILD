# Maintainer: Martchus <martchus@gmx.net>
# Based on: AUR package qt6-base-git, official qt5-base package

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=qt6-base
_qtver=6.0.0-rc
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework'
depends=(libjpeg-turbo xcb-util-keysyms xcb-util-cursor libgl fontconfig xdg-utils
         shared-mime-info xcb-util-wm libxrender libxi sqlite mesa
         tslib libinput libxkbcommon-x11 libproxy libcups double-conversion md4c brotli libb2)
makedepends=(cmake libfbclient mariadb-libs unixodbc postgresql alsa-lib gst-plugins-base-libs
             gtk3 libpulse cups freetds vulkan-headers ninja)
optdepends=('postgresql-libs: PostgreSQL driver'
            'mariadb-libs: MariaDB driver'
            'unixodbc: ODBC driver'
            'libfbclient: Firebird/iBase driver'
            'freetds: MS SQL driver'
            'gtk3: GTK platform plugin'
            'perl: for fixqt4headers and syncqt')
groups=(qt6)
_pkgfqn="${pkgname/6-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/development_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('8dc2c6fe053235e4a2866d8e1927fd667e5e8c853c96de708b9688012089138d')

build() {
  cmake -G Ninja -B build -S $_pkgfqn \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALL_BINDIR=lib/qt6/bin \
    -DINSTALL_DOCDIR=share/doc/qt6 \
    -DINSTALL_ARCHDATADIR=lib/qt6 \
    -DINSTALL_DATADIR=share/qt6 \
    -DINSTALL_INCLUDEDIR=include/qt6 \
    -DINSTALL_MKSPECSDIR=lib/qt6/mkspecs \
    -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples \
    -DQT_FEATURE_journald=ON \
    -DQT_FEATURE_openssl_linked=ON
  VERBOSE=1 cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $_pkgfqn/LICENSE* -t "$pkgdir"/usr/share/licenses/$pkgname

  # Symlinks for backwards compatibility
  mkdir -p "$pkgdir"/usr/bin
  for _b in uic rcc qmake; do
    ln -rs "$pkgdir"/usr/lib/qt6/bin/$_b "$pkgdir"/usr/bin/$_b-qt6
  done
}
