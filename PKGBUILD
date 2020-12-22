# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt6-base-headless
_qtver=6.0.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework - headless build, no QtGui or QtWidgets'
depends=(sqlite double-conversion brotli libb2) # md4c - not supported yet
makedepends=(cmake ninja mariadb-libs unixodbc postgresql xmlstarlet systemd)
optdepends=('postgresql-libs: PostgreSQL driver'
            'mariadb-libs: MariaDB driver'
            'unixodbc: ODBC driver'
            'shared-mime-info: Freedesktop.org Shared MIME Info')
groups=(qt6)
conflicts=(qt6-base)
provides=(qt6-base)
_pkgfn="qtbase-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz")
sha256sums=('ae227180272d199cbb15318e3353716afada5c57fd5185b812ae26912c958656')

build() {
  cmake -G Ninja -B build -S "$_pkgfn" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALL_BINDIR=lib/qt6/bin \
    -DINSTALL_DOCDIR=share/doc/qt6 \
    -DINSTALL_ARCHDATADIR=lib/qt6 \
    -DINSTALL_DATADIR=share/qt6 \
    -DINSTALL_INCLUDEDIR=include/qt6 \
    -DINSTALL_MKSPECSDIR=lib/qt6/mkspecs \
    -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples \
    -DQT_FEATURE_journald=ON \
    -DQT_FEATURE_openssl_linked=ON \
    \
    -DQT_FEATURE_gui=OFF \
    -DQT_FEATURE_widgets=OFF \
    -DQT_FEATURE_freetype=OFF \
    -DQT_FEATURE_harfbuzz=OFF

  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $_pkgfn/LICENSE* -t "$pkgdir"/usr/share/licenses/$pkgbase

  # Symlinks for backwards compatibility
  mkdir -p "$pkgdir"/usr/bin
  for _b in $(ls "$pkgdir"/usr/lib/qt6/bin); do
    ln -rs "$pkgdir"/usr/lib/qt6/bin/$_b "$pkgdir"/usr/bin/$_b-qt6
  done
}
