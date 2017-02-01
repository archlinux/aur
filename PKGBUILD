# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgbase=mingw-w64-gst-rtsp-server-git
pkgname=('mingw-w64-gst-rtsp-server-git' 'mingw-w64-gst-rtsp-server-git-vslib')
pkgver=1.11.1.r5.cd4e675
pkgrel=1
_gitname=gst-rtsp-server
pkgdesc="RTSP server library based on GStreamer (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gstreamer-git' 'mingw-w64-gst-plugins-base-git')
options=('!strip' '!buildflags' 'staticlibs')
makedepends=('mingw-w64-configure' 'mingw-w64-tools' 'git')
conflicts=('mingw-w64-gst-rtsp-server')

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
      --with-package-name="GStreamer RTSP Server Library (Arch Linux)" \
      --with-package-origin="http://www.archlinux.org/" 

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
    cd ..
  done
}

libs=('libgstrtspserver-1.0-0.dll')

package_mingw-w64-gst-rtsp-server-git() {
  cd "${srcdir}/$_gitname"

  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="${pkgdir}" install

    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.a
    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.la

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


package_mingw-w64-gst-rtsp-server-git-vslib() {
  pkgdesc="RTSP server library based on GStreamer import lib for Visual Studio (mingw-w64)"
  depends=("mingw-w64-gst-rtsp-server-git=$pkgver")
  unset optdepends

  for _arch in ${_architectures}; do
    LIB_PATH="$pkgdir"/usr/${_arch}/lib/
    mkdir -p ${LIB_PATH}
    cp "$srcdir/$pkgname/${_arch}/"{*.lib,*.def} "${LIB_PATH}"
  done
}

# vim: ts=2 sw=2 et:
