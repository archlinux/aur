# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=webkitgtk-6.0-devel
pkgname=(
  webkitgtk-6.0-devel
  webkitgtk-6.0-docs-devel
)
pkgver=2.49.3
pkgrel=2
pkgdesc="Web content engine for GTK (development release)"
url="https://webkitgtk.org"
arch=(x86_64)
license=(
  # :sort ui /\v^\s*['"]?/
  'AFL-2.0 OR GPL-2.0-or-later'
  Apache-2.0
  'Apache-2.0 WITH LLVM-exception'
  BSD-2-Clause
  BSD-2-Clause-Views
  BSD-3-Clause
  BSD-Source-Code
  BSL-1.0
  bzip2-1.0.6
  GPL-2.0-only
  'GPL-3.0-only WITH Autoconf-exception-3.0'
  'GPL-3.0-or-later WITH Bison-exception-2.2'
  ICU
  ISC
  LGPL-2.1-only
  LGPL-2.1-or-later
  MIT
  MPL-1.1
  MPL-2.0
  NCSA
  'NCSA OR MIT'
  OFL-1.1
  SunPro
  Unicode-TOU
)
depends=(
  at-spi2-core
  atk
  bubblewrap
  cairo
  enchant
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gst-plugins-bad-libs
  gst-plugins-base-libs
  gstreamer
  gtk4
  harfbuzz
  harfbuzz-icu
  hyphen
  icu
  lcms2
  libavif
  libbacktrace
  libdrm
  libegl
  libepoxy
  libgcrypt
  libgl
  libgles
  libjpeg-turbo
  libjxl
  libmanette
  libpng
  libseccomp
  libsecret
  libsoup3
  libsystemd
  libtasn1
  libwebp
  libx11
  libxml2
  libxslt
  mesa
  openjpeg2
  pango
  sqlite
  wayland
  woff2
  xdg-dbus-proxy
  zlib
)
makedepends=(
  clang
  cmake
  gi-docgen
  glib2-devel
  gobject-introspection
  gperf
  gst-plugins-bad
  lld
  ninja
  python
  ruby
  ruby-stdlib
  systemd
  unifdef
  wayland-protocols
)
source=(
  $url/releases/webkitgtk-$pkgver.tar.xz{,.asc}
)
sha256sums=('25f465bd1f7d615da9f5089575c58c8fbaf26d951de6adc569690e59319d72c1'
            'SKIP')
b2sums=('9b207405c16b1c6289463ca3a2b3a695dfada19b2c469e1aeb98866361c93e3e2ac843726756d08388e1bfb8c67d2297e7432847c24737707282d10003945fac'
        'SKIP')
validpgpkeys=(
  # https://www.webkitgtk.org/verifying.html
  5AA3BC334FD7E3369E7C77B291C559DBE4C9123B # Adrián Pérez de Castro <aperez@igalia.com>
  013A0127AC9C65B34FFA62526C1009B693975393 # Carlos Garcia Campos <cgarcia@igalia.com>
)

build() {
  local cmake_options=(
    -DPORT=GTK
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_INSTALL_LIBEXECDIR=lib
    -DCMAKE_SKIP_RPATH=ON
    -DUSE_GTK4=ON
    -DUSE_LIBBACKTRACE=ON
    -DUSE_SOUP2=OFF
    -DENABLE_DOCUMENTATION=ON
    -DENABLE_MINIBROWSER=ON
    -DENABLE_SPEECH_SYNTHESIS=OFF
  )

  # Upstream prefers Clang
  # https://gitlab.archlinux.org/archlinux/packaging/packages/webkitgtk-6.0/-/issues/4
  export CC=clang CXX=clang++
  LDFLAGS+=" -fuse-ld=lld"

  # Skia uses malloc_usable_size
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # JITted code crashes when CET is used
  CFLAGS+=' -fcf-protection=none'
  CXXFLAGS+=' -fcf-protection=none'

  cmake -S webkitgtk-$pkgver -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

package_webkitgtk-6.0-devel() {
  provides+=(
    libjavascriptcoregtk-6.0.so
    libwebkitgtk-6.0.so
    webkitgtk-6.0
  )
  conflicts+=(
    webkitgtk-6.0
  )
  optdepends=(
    'geoclue: Geolocation support'
    'gst-libav: nonfree media decoding'
    'gst-plugins-bad: media decoding'
    'gst-plugins-good: media decoding'
  )

  DESTDIR="$pkgdir" cmake --install build

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc

  cd webkitgtk-$pkgver
  find Source -name 'COPYING*' -or -name 'LICENSE*' -print0 | sort -z |
    while IFS= read -d $'\0' -r _f; do
      echo "### $_f ###"
      cat "$_f"
      echo
    done |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_webkitgtk-6.0-docs-devel() {
  pkgdesc+=" (documentation)"
  provides+=(webkitgtk-6.0-docs)
  conflicts+=(webkitgtk-6.0-docs)
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
