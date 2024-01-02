# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: taotieren <admin@taotieren.com>

pkgname=webkit2gtk-hvml
pkgver=2.34.1
pkgrel=3
pkgdesc="Web content engine for GTK (HVML)"
url="https://hvml.fmsoft.cn/"
arch=(x86_64)
license=(custom)
provides=(${pkgname}  'webkithbd')
conflicts=(webkit2gtk 'webkithbd')
depends=(cairo fontconfig freetype2 libgcrypt glib2 gtk3 harfbuzz harfbuzz-icu
         icu libjpeg libsoup libxml2 zlib libpng sqlite atk libwebp at-spi2-core
         libegl libgl libgles libwpe wpebackend-fdo libxslt libsecret libtasn1
         enchant libx11 libxext libice libxt wayland libnotify hyphen openjpeg2
         woff2 libsystemd bubblewrap libseccomp xdg-dbus-proxy gstreamer
         gst-plugins-base-libs libmanette)
makedepends=(cmake ninja gtk-doc python ruby gobject-introspection
             wayland-protocols systemd gst-plugins-bad gperf)
optdepends=('geoclue: Geolocation support'
  'gst-plugins-good: media decoding'
  'gst-plugins-bad: media decoding'
  'gst-libav: nonfree media decoding'
  'purc: The prime HVML interpreter for C Language.'
  'purc-midnight-commander: A generic HVML renderer in text mode for development and debugging.'
  'xguipro: xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit.')
# options=(debug)
options=()
_date=20231116
_time=015630
_name=WebKitHBD-${pkgver}-${_date}-${_time}-Source
source=("https://files.fmsoft.cn/sources/${_name}.tar.xz")
sha256sums=('522aa2bd80db6c24bd8d7f9da424aed7243acede048ed2fbcd321c256f3a77f9')


# prepare() {
#   cd webkitgtk-$pkgver
# }

build() {
  # Produce minimal debug info: 4.3 GB of debug data makes the
  # build too slow and is too much to package for debuginfod
  CFLAGS+=' -g1'
  CXXFLAGS+=' -g1'

  sed -i '/#pragma once/i #include <cstdio>' ${_name}/Source/bmalloc/bmalloc/IsoSharedPageInlines.h
  sed -i '/#include <vector>/a #include <cstdint>' ${_name}/Source/ThirdParty/ANGLE/src/common/angleutils.h
  sed -i '/#include <vector>/a #include <cstdint>' ${_name}/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h

  cmake -S ${_name} -B build -G Ninja \
    -DPORT=GTK \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_SOUP2=ON \
    -DENABLE_HVML_ATTRS=ON \
    -DENABLE_GTKDOC=OFF \
    -DENABLE_MINIBROWSER=ON

#   cmake --build build
    ninja -C build
}

package() {
  depends+=(libwpe-1.0.so libWPEBackend-fdo-1.0.so)
  provides+=(libjavascriptcoregtk-4.0.so libwebkit2gtk-4.0.so)

#   DESTDIR="$pkgdir" cmake --install build
    DESTDIR="${pkgdir}" ninja -C build install

  rm -r "$pkgdir/usr/bin"

  cd ${_name}
  find Source -name 'COPYING*' -or -name 'LICENSE*' -print0 | sort -z |
    while IFS= read -d $'\0' -r _f; do
      echo "### $_f ###"
      cat "$_f"
      echo
    done |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set sw=2 et:
