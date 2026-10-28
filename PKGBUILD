# Maintainer: dec05eba <dec05eba@protonmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=qt6-base-phoenix
pkgname=(qt6-base-phoenix
         qt6-xcb-private-headers-phoenix)
_pkgver=6.12.0
pkgver=${_pkgver/-/}
pkgrel=1
arch=(x86_64)
url='https://github.com/dec05eba/qtbase'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='A fork of Qt Base with support for per-monitor fractional scaling on X11'
depends=(brotli
         dbus
         double-conversion
         fontconfig
         freetype2
         glib2
         glibc
         harfbuzz
         icu
         krb5
         libb2
         libcups
         libdrm
         libgcc
         libgl
         libice
         libinput
         libjpeg-turbo
         libpng
         libproxy
         libsm
         libstdc++
         liburing
         libx11
         libxcb
         libxkbcommon
         libxkbcommon-x11
         md4c
         mesa
         mtdev
         openssl
         pcre2
         shared-mime-info
         sqlite
         systemd-libs
         tslib
         wayland
         xcb-util-cursor
         xcb-util-image
         xcb-util-keysyms
         xcb-util-renderutil
         xcb-util-wm
         xdg-utils
         zlib
         zstd)
makedepends=(alsa-lib
             cmake
             cups
             freetds
             git
             gst-plugins-base-libs
             gtk3
             jemalloc
             libfbclient
             libpulse
             mariadb-libs
             ninja
             postgresql
             renderdoc
             unixodbc
             vulkan-headers
             xmlstarlet)
optdepends=('freetds: MS SQL driver'
            'gdk-pixbuf2: GTK platform plugin'
            'gtk3: GTK platform plugin'
            'libfbclient: Firebird/iBase driver'
            'mariadb-libs: MariaDB driver'
            'pango: GTK platform plugin'
            'perl: for syncqt'
            'postgresql-libs: PostgreSQL driver'
            'unixodbc: ODBC driver')
groups=(qt6)
_pkgfn=qtbase
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$_pkgver
        qt6-base-cflags.patch
        qt6-base-nostrip.patch
        qt6-base-randr-dpi.patch)
sha256sums=('d97ef157dc50bdf0425337e9adede8135ab508a4ab2f1abae7e9cfc42c5f86db'
            '5411edbe215c24b30448fac69bd0ba7c882f545e8cf05027b2b6e2227abc5e78'
            '4b93f6a79039e676a56f9d6990a324a64a36f143916065973ded89adc621e094'
            '2fd6387e2244021928eec8e1932770eac2693120fecafa7ae2c1e47cc3c762f2')

prepare() {
  patch -d $_pkgfn -p1 < qt6-base-cflags.patch # Use system CFLAGS
  patch -d $_pkgfn -p1 < qt6-base-nostrip.patch # Don't strip binaries with qmake
  patch -d $_pkgfn -p1 < qt6-base-randr-dpi.patch

  git -C $_pkgfn cherry-pick -n e320c929207aaea0d4c8fb2cd29b16de6cbd2b2c # Fix QtWebEngine detection in cmake
  git -C $_pkgfn cherry-pick -n 032643f99e090e0304ef935c2ee11c109d55c8a1 # Fix build with md4c 0.6
  git -C $_pkgfn cherry-pick -n 6b7ee05def510c333fbb8944ae669b72a48367f3 # Fix tab scrolling with mouse wheel
}

build() {
  # Set no_direct_extern_access based on architecture
  if [[ $CARCH == "aarch64" || $CARCH == "riscv64" ]]; then
    _no_direct_extern_access=OFF
  else
    _no_direct_extern_access=ON
  fi

  cmake -B build -S $_pkgfn -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DINSTALL_BINDIR=lib/qt6/bin \
    -DINSTALL_PUBLICBINDIR=bin \
    -DINSTALL_LIBEXECDIR=lib/qt6 \
    -DINSTALL_DOCDIR=share/doc/qt6 \
    -DINSTALL_ARCHDATADIR=lib/qt6 \
    -DINSTALL_DATADIR=share/qt6 \
    -DINSTALL_INCLUDEDIR=include/qt6 \
    -DINSTALL_MKSPECSDIR=lib/qt6/mkspecs \
    -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples \
    -DFEATURE_journald=ON \
    -DFEATURE_libproxy=ON \
    -DFEATURE_openssl_linked=ON \
    -DFEATURE_system_sqlite=ON \
    -DFEATURE_system_xcb_xinput=ON \
    -DFEATURE_no_direct_extern_access=$_no_direct_extern_access \
    -DFEATURE_mimetype_database=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
  cmake --build build
}

package_qt6-base-phoenix() {
  depends+=(qt6-translations)
  provides=("qt6-base=$pkgver")
  conflicts=(qt6-base)
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $_pkgfn/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgbase
}

package_qt6-xcb-private-headers-phoenix() {
  pkgdesc='Private headers for Qt6 Xcb'

  depends=("qt6-base-phoenix=$pkgver")
  provides=("qt6-xcb-private-headers=$pkgver")
  conflicts=(qt6-xcb-private-headers)
  optdepends=()
  groups=()

  cd $_pkgfn
  install -d -m755 "$pkgdir"/usr/include/qt6xcb-private/gl_integrations
  cp -r src/plugins/platforms/xcb/*.h "$pkgdir"/usr/include/qt6xcb-private/
  cp -r src/plugins/platforms/xcb/gl_integrations/*.h "$pkgdir"/usr/include/qt6xcb-private/gl_integrations/
}
