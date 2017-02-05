# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgbase=mingw-w64-gst-plugins-bad-git
pkgname=('mingw-w64-gst-plugins-bad-git' 'mingw-w64-gst-plugins-bad-git-vslib')
pkgver=1.11.1.r66.9b778f726
pkgrel=1
_gitname=gst-plugins-bad
pkgdesc="GStreamer Multimedia Framework Bad Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-glib2' 'mingw-w64-libxml2' 'mingw-w64-gstreamer-git' 'mingw-w64-orc')
makedepends=('git' 'mingw-w64-configure' 'mingw-w64-tools' 'mingw-w64-openh264' 'mingw-w64-nettle' 'mingw-w64-opus' 'mingw-w64-bzip2' 'mingw-w64-libsrtp' 'mingw-w64-vo-aacenc' 'mingw-w64-libkate' 'mingw-w64-librsvg' 'mingw-w64-openjpeg2' 'mingw-w64-opencv' 'mingw-w64-libfdk-aac')
optdepends=('mingw-w64-gst-plugins-bad-git-vslib: Visual Studio import lib')
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('mingw-w64-gst-plugins-bad')

source=("$_gitname::git://anongit.freedesktop.org/gstreamer/$_gitname")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd $_gitname 
  NOCONFIGURE=1 ./autogen.sh
}

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "${srcdir}/$_gitname"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure \
      --with-package-name="GStreamer Bad Plugins (Arch Linux)" \
      --with-package-origin="http://www.archlinux.org/" \
      --disable-examples \

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
    cd ..
  done
}

libs=('libgstcodecparsers-1.0-0.dll'
  'libgstmpegts-1.0-0.dll'
  'libgsturidownloader-1.0-0.dll'
  'libgstbasecamerabinsrc-1.0-0.dll'
  'libgstphotography-1.0-0.dll'
  'libgstgl-1.0-0.dll'
  'libgstbadbase-1.0-0.dll'
  'libgstbadvideo-1.0-0.dll'
  'libgstinsertbin-1.0-0.dll'
  'libgstadaptivedemux-1.0-0.dll'
  'libgstplayer-1.0-0.dll'
  'libgstbadaudio-1.0-0.dll')

package_mingw-w64-gst-plugins-bad-git() {
  cd "${srcdir}/$_gitname"

  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="${pkgdir}" install

    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.a
    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.la
    rm -rf "$pkgdir"/usr/${_arch}/share/${aclocal,man,locale}

    # generate vs import lib
    mkdir -p "$srcdir/$pkgname-vslib/${_arch}" && pushd "$srcdir/$pkgname-vslib/${_arch}"
    DLL_PATH="$pkgdir"/usr/${_arch}/bin/
    for dll in ${libs[@]};
    do
            gendef ${DLL_PATH}${dll}
            ${_arch}-dlltool -d ${dll::-4}.def -l ${dll:3:-6}.lib -D ${DLL_PATH}
    done
    popd

    find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;

    cd ..
  done
}

package_mingw-w64-gst-plugins-bad-git-vslib() {
  pkgdesc="GStreamer Multimedia Framework Bad Plugins import lib for Visual Studio (mingw-w64)"
  depends=("mingw-w64-gst-plugins-bad-git=$pkgver")
  unset optdepends

  for _arch in ${_architectures}; do
    LIB_PATH="$pkgdir"/usr/${_arch}/lib/
    mkdir -p ${LIB_PATH}
    cp "$srcdir/$pkgname/${_arch}/"{*.lib,*.def} "${LIB_PATH}"
  done
}

# vim: ts=2 sw=2 et:
