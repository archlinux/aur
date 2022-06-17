# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt6-base-headless
_qtver=6.3.1
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework - headless build, no QtGui or QtWidgets'
depends=(sqlite double-conversion brotli libb2)
makedepends=(cmake ninja mariadb-libs unixodbc postgresql xmlstarlet systemd)
optdepends=('postgresql-libs: PostgreSQL driver'
            'mariadb-libs: MariaDB driver'
            'md4c: C Markdown parser'
            'unixodbc: ODBC driver'
            'shared-mime-info: Freedesktop.org Shared MIME Info')
groups=(qt6)
conflicts=(qt6-base)
provides=(qt6-base)
options=(debug)
_pkgfn="qtbase-everywhere-src-$_qtver"
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz
        qt6-base-cflags.patch
        qt6-base-nostrip.patch)
sha256sums=('0a64421d9c2469c2c48490a032ab91d547017c9cc171f3f8070bc31888f24e03'
            '5411edbe215c24b30448fac69bd0ba7c882f545e8cf05027b2b6e2227abc5e78'
            '4b93f6a79039e676a56f9d6990a324a64a36f143916065973ded89adc621e094')

prepare() {
  patch -d $_pkgfn -p1 < qt6-base-cflags.patch # Use system CFLAGS
  patch -d $_pkgfn -p1 < qt6-base-nostrip.patch # Don't strip binaries with qmake
}

build() {
  cmake -B build -S "$_pkgfn" -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DINSTALL_BINDIR=lib/qt6/bin \
    -DINSTALL_PUBLICBINDIR=usr/bin \
    -DINSTALL_LIBEXECDIR=lib/qt6 \
    -DINSTALL_DOCDIR=share/doc/qt6 \
    -DINSTALL_ARCHDATADIR=lib/qt6 \
    -DINSTALL_DATADIR=share/qt6 \
    -DINSTALL_INCLUDEDIR=include/qt6 \
    -DINSTALL_MKSPECSDIR=lib/qt6/mkspecs \
    -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples \
    -DQT_FEATURE_journald=ON \
    -DQT_FEATURE_openssl_linked=ON \
    -DQT_FEATURE_system_sqlite=ON \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    \
    -DQT_FEATURE_gui=OFF \
    -DQT_FEATURE_widgets=OFF \
    -DQT_FEATURE_freetype=OFF \
    -DQT_FEATURE_harfbuzz=OFF \
    -DQT_FEATURE_zstd=OFF

  cmake --build build
}

package() {
  optdepends+=('qt6-translations: Translations')
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $_pkgfn/LICENSE* -t "$pkgdir"/usr/share/licenses/$pkgbase

# Install symlinks for user-facing tools
  cd "$pkgdir"
  mkdir usr/bin
  while read _line; do
    ln -s $_line
  done < "$srcdir"/build/user_facing_tool_links.txt
}
