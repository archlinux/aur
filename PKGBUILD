# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Patches applied by: Lito Parra <lito.15@proton.me>

# Change this value to an interval shorter than
# your monitor's max refresh rate, perhaps
# the floored result of 1000 / your_monitor_refresh_rate
# 4 ms smooths up to 240 Hz animations, balanced default
HIFPS_TARGET_TIMER_INTERVAL=4

pkgbase=qt6-base-hifps
pkgname=(qt6-base-hifps
         qt6-xcb-private-headers-hifps)
_pkgver=6.10.0
pkgver=${_pkgver/-/}
pkgrel=4
pkgdesc='A cross-platform application and UI framework - patched for high refresh rates for animations'
arch=(x86_64)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
depends=(brotli
         dbus
         double-conversion
         fontconfig
         freetype2
         gcc-libs
         glib2
         glibc
         harfbuzz
         icu
         krb5
         libb2
         libcups
         libdrm
         libgl
         libice
         libinput
         libjpeg-turbo
         libpng
         libproxy
         libsm
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
	     rsync
	     sed
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
_pkgfn=${pkgbase/6-/}
_pkgfn=${_pkgfn/-hifps/}
source=(git+https://code.qt.io/qt/$_pkgfn.git
        sync_official.sh
        0005-low-timer.patch)
sha256sums=('SKIP'
            '56510cbf9141185f6b2f6e8048c64ab0368e4288884fd538baf388555df29496'
            'SKIP')

prepare() {
  echo ">>> Syncing official Arch qt6-base repo files..."
  bash "$srcdir/sync_official.sh" "$PWD"

  echo ">>> Checking out $pkgname source at tag v${pkgver}..."

  pushd "$srcdir/$_pkgfn"

  # Checkout exact tag
  if git rev-parse "v${pkgver}" >/dev/null 2>&1; then
    git checkout "v${pkgver}"
  else
    echo ">>> WARNING: tag v${pkgver} not found; using master branch as fallback."
    git checkout master
  fi

  # sanity check
  if [ ! -f CMakeLists.txt ]; then
    echo ">>> ERROR: CMakeLists.txt not found after checkout!"
    ls -la
    return 1
  fi

  echo ">>> Applying default Arch patches..."
  patch -Np1 -i "${srcdir}/qt6-base-cflags.patch"  # Use system CFLAGS
  patch -Np1 -i "${srcdir}/qt6-base-nostrip.patch" # Don't strip binaries with qmake

  echo ">>> Reducing Qt animation timer interval down to ${HIFPS_TARGET_TIMER_INTERVAL} ms to smooth out animations..."
  tmpfile=$(mktemp)

  sed -E "s|^\+#define DEFAULT_TIMER_INTERVAL .*|+#define DEFAULT_TIMER_INTERVAL ${HIFPS_TARGET_TIMER_INTERVAL}|" \
  "$srcdir/0005-low-timer.patch" > "$tmpfile"

  mv "$tmpfile" "$srcdir/0005-low-timer.patch"

  patch -Np1 -i "${srcdir}/0005-low-timer.patch" # apply 1 ms timing patch to make animations smoother
  git cherry-pick -n a374ab6ce9f01f1f559403ec377cde990a689890 # Fix yakuake

  echo ">>> Patches applied"

  popd
}

build() {
  cd "${srcdir}"
  cmake -B build -S $_pkgfn -G Ninja \
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

package_qt6-base-hifps() {
  pkgdesc='A cross-platform application and UI framework - patched for high refresh rates for animations'
  depends+=(qt6-translations)
  conflicts=('qt6-base')
  provides=('qt6-base')
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir"/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgbase

# Install symlinks for user-facing tools
  cd "$pkgdir"
  mkdir usr/bin
  while read _line; do
    ln -s $_line
  done < "$srcdir"/build/user_facing_tool_links.txt
}

package_qt6-xcb-private-headers-hifps() {
  pkgdesc='Private headers for Qt6 Xcb - patched for high refresh rates for animations'

  depends=("qt6-base-hifps=$pkgver")
  optdepends=()
  groups=()
  conflicts=('qt6-xcb-private-headers')
  provides=('qt6-xcb-private-headers')

  cd "$srcdir/$_pkgfn"
  install -d -m755 "$pkgdir"/usr/include/qt6xcb-private/{gl_integrations,nativepainting}
  cp -r src/plugins/platforms/xcb/*.h "$pkgdir"/usr/include/qt6xcb-private/
  cp -r src/plugins/platforms/xcb/gl_integrations/*.h "$pkgdir"/usr/include/qt6xcb-private/gl_integrations/
  cp -r src/plugins/platforms/xcb/nativepainting/*.h "$pkgdir"/usr/include/qt6xcb-private/nativepainting/
}
