# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt6-base-headless
pkgver=6.10.1
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='A cross-platform application and UI framework - headless build, no QtGui or QtWidgets'
depends=(brotli
         double-conversion
         libb2
         sqlite
         zlib
         zstd)
makedepends=(cmake
             git
             jemalloc
             mariadb-libs
             ninja
             postgresql
             systemd
             unixodbc
             xmlstarlet)
optdepends=('postgresql-libs: PostgreSQL driver'
            'mariadb-libs: MariaDB driver')
groups=(qt6)
conflicts=(qt6-base)
provides=(qt6-base)
_pkgfn=qtbase
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$pkgver
        qt6-base-cflags.patch
        qt6-base-nostrip.patch)
sha256sums=('fa40e720d488d256704d6a7dfc23dd178eda5e4774dfdfdf1f63cdb52d53cf86'
            '5411edbe215c24b30448fac69bd0ba7c882f545e8cf05027b2b6e2227abc5e78'
            '4b93f6a79039e676a56f9d6990a324a64a36f143916065973ded89adc621e094')

prepare() {
  patch -d $_pkgfn -p1 < qt6-base-cflags.patch # Use system CFLAGS
  patch -d $_pkgfn -p1 < qt6-base-nostrip.patch # Don't strip binaries with qmake
}

build() {
  # Set no_direct_extern_access based on architecture
  if [[ $CARCH == "aarch64" ]]; then
    _no_direct_extern_access=OFF
  else
    _no_direct_extern_access=ON
  fi

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
    -DFEATURE_journald=ON \
    -DFEATURE_openssl_linked=ON \
    -DFEATURE_system_sqlite=ON \
    -DFEATURE_no_direct_extern_access=$_no_direct_extern_access \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS \
    \
    -DQT_FEATURE_gui=OFF \
    -DQT_FEATURE_widgets=OFF \
    -DQT_FEATURE_freetype=OFF \
    -DQT_FEATURE_harfbuzz=OFF \
    -DQT_FEATURE_zstd=ON

  cmake --build build
}

package() {
  optdepends+=('qt6-translations: Translations')
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $_pkgfn/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgbase

# Install symlinks for user-facing tools
  cd "$pkgdir"
  mkdir usr/bin
  while read _line; do
    ln -s $_line
  done < "$srcdir"/build/user_facing_tool_links.txt
}
