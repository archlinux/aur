# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: taotieren <admin@taotieren.com>

pkgbase=webkit2gtk-hvml
pkgname=(webkit2gtk-{3,4}.0-hvml webkit2hbd)
pkgver=2.34.1
pkgrel=9
pkgdesc="Web content engine for GTK (HVML)"
url="https://hvml.fmsoft.cn/"
arch=(x86_64)
license=(custom)
provides=(${pkgname} 'webkithbd')
conflicts=(webkit2gtk 'webkithbd')
depends=(cairo fontconfig freetype2 libgcrypt glib2 gtk3 gtk4 harfbuzz harfbuzz-icu
  icu libjpeg libsoup libsoup3 libxml2 zlib libpng sqlite atk libwebp at-spi2-core
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
options=(!strip !lto)
_date=20231116
_time=015630
_name=WebKitHBD-${pkgver}-${_date}-${_time}-Source
source=("https://files.fmsoft.cn/sources/${_name}.tar.xz")
sha256sums=('522aa2bd80db6c24bd8d7f9da424aed7243acede048ed2fbcd321c256f3a77f9')

# prepare() {
#   cd webkitgtk-$pkgver
# }

build() {
  export LDFLAGS="-L/lib64"
  if test -n "$LD_LIBRARY_PATH"; then
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/lib64"
  else
    export LD_LIBRARY_PATH=/lib64
  fi
  # Produce minimal debug info: 4.3 GB of debug data makes the
  # build too slow and is too much to package for debuginfod
  CFLAGS+=' -g1'
  CXXFLAGS+=' -g1'

  sed -i '/#pragma once/i #include <cstdio>' ${_name}/Source/bmalloc/bmalloc/IsoSharedPageInlines.h
  sed -i '/#include <vector>/a #include <cstdint>' ${_name}/Source/ThirdParty/ANGLE/src/common/angleutils.h
  sed -i '/#include <vector>/a #include <cstdint>' ${_name}/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h

  # webkit2gtk-3.0-hvml Using Gtk3 and Soup2
  cmake -S ${_name} -B build-gtk3 -G Ninja \
    -DPORT=GTK \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DENABLE_HVML_ATTRS=ON \
    -DENABLE_GAMEPAD=OFF \
    -DENABLE_INTROSPECTION=OFF \
    -DUSE_SOUP2=OFF \
    -DUSE_WPE_RENDERER=OFF \
    -DUSE_LCMS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations -Wno-dangling-reference"

  ninja -C build-gtk3

  # webkit2gtk-4.0-hvml Using Gtk4.0 and Soup3
  cmake -S ${_name} -B build-gtk4 -G Ninja \
    -DPORT=GTK \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DENABLE_HVML_ATTRS=ON \
    -DENABLE_GAMEPAD=OFF \
    -DENABLE_INTROSPECTION=OFF \
    -DUSE_SOUP3=ON \
    -DUSE_WPE_RENDERER=OFF \
    -DUSE_LCMS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations -Wno-dangling-reference"

  ninja -C build-gtk4

  # WebKit2HBD Using  Minigui and Soup2
  cmake -S ${_name} -B build-hbd -G Ninja \
    -DPORT=HBD \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DENABLE_HVML_ATTRS=ON \
    -DENABLE_RSQL=OFF \
    -DENABLE_NOTIFICATIONS=OFF \
    -DENABLE_NETSCAPE_PLUGIN_API=OFF \
    -DENABLE_PDFKIT_PLUGIN=OFF \
    -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DUSE_SOUP2=ON \
    -DENABLE_GAMEPAD=OFF \
    -DENABLE_INTROSPECTION=OFF \
    -DUSE_WPE_RENDERER=OFF \
    -DUSE_LCMS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations -Wno-dangling-reference"

  ninja -C build-hbd
}

package_webkit2gtk-3.0-hvml() {
  depends+=(libwpe-1.0.so libWPEBackend-fdo-1.0.so)
  provides+=(libjavascriptcoregtk-4.0.so libwebkit2gtk-4.0.so)

  DESTDIR="${pkgdir}" ninja -C build-gtk3.0 install

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

package_webkit2gtk-4.0-hvml() {
  depends+=(libwpe-1.0.so libWPEBackend-fdo-1.0.so)
  provides+=(libjavascriptcoregtk-4.0.so libwebkit2gtk-4.0.so)

  DESTDIR="${pkgdir}" ninja -C build-gtk4.0 install

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

package_webkit2hbd() {
  depends+=(libwpe-1.0.so libWPEBackend-fdo-1.0.so)
  provides+=(libjavascriptcoregtk-4.0.so libwebkit2gtk-4.0.so)

  DESTDIR="${pkgdir}" ninja -C build-hbd install

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
