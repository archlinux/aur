# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt6-base-headless
_qtver=6.7.3
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework - headless build, no QtGui or QtWidgets'
depends=(brotli
         double-conversion
         libb2
         sqlite
         zlib
         zstd)
makedepends=(cmake
             git
             mariadb-libs
             ninja
             postgresql
             systemd
             unixodbc
             xmlstarlet)
optdepends=('postgresql-libs: PostgreSQL driver'
            'mariadb-libs: MariaDB driver'
            'md4c: C Markdown parser'
            'unixodbc: ODBC driver'
            'shared-mime-info: Freedesktop.org Shared MIME Info')
groups=(qt6)
conflicts=(qt6-base)
provides=(qt6-base)
_pkgfn=qtbase
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$pkgver
        qt6-base-cflags.patch
        qt6-base-nostrip.patch)
sha256sums=('3da3df07b4bbd6a963af0c975ab6ff18c8c0aa73454048b0318899362c4adab9'
            '5411edbe215c24b30448fac69bd0ba7c882f545e8cf05027b2b6e2227abc5e78'
            '4b93f6a79039e676a56f9d6990a324a64a36f143916065973ded89adc621e094')

prepare() {
  patch -d $_pkgfn -p1 < qt6-base-cflags.patch # Use system CFLAGS
  patch -d $_pkgfn -p1 < qt6-base-nostrip.patch # Don't strip binaries with qmake

  cd $_pkgfn
  git cherry-pick -n f05cf3f11f4e42e05d069b5d9249d4b9aff41ffe # Fix locale issues
  git cherry-pick -n a8ef8ea55014546e0e835cd0eacf694919702a11 # https://bugreports.qt.io/browse/QTBUG-124386
  git cherry-pick -n 062f701a11d2c46660f5c5edd73f245477918a47 # Fix dependencies in pc files
  git cherry-pick -n 5ee9da89af7efe31ac45858bf1eb04e5155a3b50 # Fix dependencies in pc files
  git cherry-pick -n 0f35729f2cb43f0eb94e2a8d5e2d478a2c6a5007 # Fix potential Plasma crashes
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
    -DFEATURE_journald=ON \
    -DFEATURE_openssl_linked=ON \
    -DFEATURE_system_sqlite=ON \
    -DFEATURE_no_direct_extern_access=ON \
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
