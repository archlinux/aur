# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Schala Zeal <schalaalexiazeal@gmail.com>

pkgname=mingw-w64-librsvg
pkgver=2.42.3
pkgrel=1
pkgdesc="A SVG viewing library (mingw-w64)"
arch=(any)
url="https://wiki.gnome.org/action/show/Projects/LibRsvg"
license=("LGPL")
makedepends=(mingw-w64-configure mingw-w64-rust gdk-pixbuf2 intltool setconf)
depends=(mingw-w64-gdk-pixbuf2 mingw-w64-pango mingw-w64-cairo mingw-w64-libcroco mingw-w64-freetype2)
options=(staticlibs !strip !buildflags)
source=("https://download.gnome.org/sources/librsvg/${pkgver%.*}/librsvg-$pkgver.tar.xz"
        "configure-fix.patch"
        "makefile-fix.patch")
sha256sums=('704f2c44b9b170fc5498de36a161d01ca8f584ba9c42654b98565a7b7bcbe657'
            'fc77e9abc35af2502de7f8273913b10d2684f422012652822741194d4b35b6fc'
            '38b3b7dfffb709121f1154427238fc7fc92825687c00959235b1d0b5909ac4d0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}
  # fix wrong target in rust
  patch -Np0 -i configure-fix.patch

  cd "${srcdir}/librsvg-${pkgver}"
  autoreconf

  cd ${srcdir}
  # fix the name of rust static libaray
  # fix the way to link rust static libaray
  patch -Np0 -i makefile-fix.patch
}

build() {
  if [[ -d "$RUST_PATH" ]] ; then
    export PATH="$RUST_PATH:$PATH"
  else
    export PATH="/opt/rust/bin:$PATH"
  fi
  if [[ ! -d "$CARGO_HOME" ]] ; then
    export CARGO_HOME="/opt/rust/cargo"
  fi

  cd "${srcdir}/librsvg-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-introspection \
      --disable-tools
    # pass static rust package to linker
    sed -i "s/^deplibs_check_method=.*/deplibs_check_method=\"pass_all\"/g" libtool
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/librsvg-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share/doc"
  done
}
