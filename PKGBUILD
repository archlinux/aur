# Merged with official ABS qt6-base PKGBUILD by João, 2024/07/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=qt6-base-git
pkgname=(qt6-base-git
         qt6-xcb-private-headers-git)
pkgver=6.8.0_r69786.g8f5ee7acbdf
pkgrel=1
arch=($CARCH)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework'
makedepends=(git alsa-lib cmake cups freetds git gst-plugins-base-libs gtk3 libfbclient libpulse mariadb-libs ninja postgresql unixodbc xmlstarlet)
depends=(brotli dbus double-conversion fontconfig freetype2 gcc-libs glib2 glibc harfbuzz icu krb5 libb2 libcups libdrm libgl libice libinput libjpeg-turbo libpng libproxy libsm libx11 libxcb libxkbcommon libxkbcommon-x11 md4c mesa mtdev openssl pcre2 shared-mime-info sqlite systemd-libs tslib vulkan-headers xcb-util-cursor xcb-util-image xcb-util-keysyms xcb-util-renderutil xcb-util-wm xdg-utils zlib zstd qt6-translations)
optdepends=('freetds: MS SQL driver'
            'gdk-pixbuf2: GTK platform plugin'
            'gtk3: GTK platform plugin'
            'libfbclient: Firebird/iBase driver'
            'mariadb-libs: MariaDB driver'
            'pango: GTK platform plugin'
            'perl: for syncqt'
            'postgresql-libs: PostgreSQL driver'
            'qt6-wayland: to run Qt6 applications in a Wayland session'
            'unixodbc: ODBC driver')
groups=(qt6-git)
source=(git+https://code.qt.io/qt/qtbase.git#branch=dev)
sha256sums=('SKIP')

pkgver() {
  cd qtbase
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S qtbase -G Ninja \
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
    -DFEATURE_libproxy=ON \
    -DFEATURE_openssl_linked=ON \
    -DFEATURE_system_sqlite=ON \
    -DFEATURE_system_xcb_xinput=ON \
    -DFEATURE_no_direct_extern_access=ON \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
  cmake --build build
}

package_qt6-base-git() {
  conflicts=(${pkgname[0]%-git})
  provides=(${pkgname[0]%-git})


  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 qtbase/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgbase

  # Install symlinks for user-facing tools
  cd "$pkgdir"
  mkdir usr/bin
  while read _line; do
    ln -s $_line
  done < "$srcdir"/build/user_facing_tool_links.txt
}

package_qt6-xcb-private-headers-git() {
  pkgdesc='Private headers for Qt6 Xcb'
  depends=("qt6-base-git=$pkgver")
  optdepends=()
  conflicts=(${pkgname[1]%-git})
  provides=(${pkgname[1]%-git})

  cd qtbase
  install -d -m755 "$pkgdir"/usr/include/qt6xcb-private/{gl_integrations,nativepainting}
  cp -r src/plugins/platforms/xcb/*.h "$pkgdir"/usr/include/qt6xcb-private/
  cp -r src/plugins/platforms/xcb/gl_integrations/*.h "$pkgdir"/usr/include/qt6xcb-private/gl_integrations/
  cp -r src/plugins/platforms/xcb/nativepainting/*.h "$pkgdir"/usr/include/qt6xcb-private/nativepainting/
}
