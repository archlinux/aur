# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgbase=mingw-w64-gst-plugins-base-git
pkgname=('mingw-w64-gst-plugins-base-git' 'mingw-w64-gst-plugins-base-git-vslib')
pkgver=1.11.1.r24.6b5617c2a
pkgrel=1
_gitname=gst-plugins-base
pkgdesc="GStreamer Multimedia Framework Base Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-glib2' 'mingw-w64-libxml2' 'mingw-w64-gstreamer-git' 'mingw-w64-orc')
makedepends=('git' 'mingw-w64-configure' 'mingw-w64-tools' 'mingw-w64-opus' 'mingw-w64-libvorbis' 'mingw-w64-pango' 'mingw-w64-libtheora' 'mingw-w64-libvisual')
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('mingw-w64-gst-plugins-base')

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
      --with-package-name="GStreamer Base Plugins (Arch Linux)" \
      --with-package-origin="http://www.archlinux.org/" \
      --disable-examples \

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
   
    make
    cd ..
  done
}

libs=('libgstallocators-1.0-0.dll'
  'libgstapp-1.0-0.dll'
  'libgstaudio-1.0-0.dll'
  'libgstfft-1.0-0.dll'
  'libgstpbutils-1.0-0.dll'
  'libgstriff-1.0-0.dll'
  'libgstrtp-1.0-0.dll'
  'libgstrtsp-1.0-0.dll'
  'libgstsdp-1.0-0.dll'
  'libgsttag-1.0-0.dll'
  'libgstvideo-1.0-0.dll')

package_mingw-w64-gst-plugins-base-git() {
  cd "${srcdir}/$_gitname"

  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="${pkgdir}" install

    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.a
    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.la
    rm -rf "$pkgdir"/usr/${_arch}/share/{aclocal,man,locale}

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
    find "$pkgdir" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;

    cd ..
  done
}

package_mingw-w64-gst-plugins-base-git-vslib() {
  pkgdesc="GStreamer Multimedia Framework Base Plugins import lib for Visual Studio (mingw-w64)"
  depends=("mingw-w64-gst-plugins-base-git=$pkgver")
  unset optdepends
  
  for _arch in ${_architectures}; do
    LIB_PATH="$pkgdir"/usr/${_arch}/lib/
    mkdir -p ${LIB_PATH} 
    cp "$srcdir/$pkgname/${_arch}/"{*.lib,*.def} "${LIB_PATH}"
  done
}

# vim: ts=2 sw=2 et:
