# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Schala Zeal <schalaalexiazeal@gmail.com>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-librsvg
pkgver=2.45.1
pkgrel=1
pkgdesc="A SVG viewing library (mingw-w64)"
arch=('any')
url="https://wiki.gnome.org/action/show/Projects/LibRsvg"
license=('LGPL')
depends=('mingw-w64-gdk-pixbuf2'
         'mingw-w64-pango'
         'mingw-w64-cairo'
         'mingw-w64-libcroco'
         'mingw-w64-freetype2')
makedepends=('mingw-w64-configure'
             'mingw-w64-rust'
             'mingw-w64-wine'
             'gdk-pixbuf2'
             'intltool'
             'setconf')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://download.gnome.org/sources/librsvg/${pkgver%.*}/librsvg-${pkgver}.tar.xz"
        "makefile-fix.patch")
sha256sums=('1323c90cd31bbaf0ff11e8c3ecd3896a63017144c4e45e20af096b27dfc353e8'
            'bec98d5cb0a74e22c2351915e6be101361a4af7d8fcac674d07d1f0c7de9b1f7')

prepare() {
  cd "${srcdir}/librsvg-${pkgver}"
  # fix the name of rust static libaray
  # fix the way to link rust static libaray
  patch -Np1 -i ../makefile-fix.patch
}

build() {
  if [[ -d "${RUST_PATH}" ]] ; then
    export PATH="${RUST_PATH}:${PATH}"
  else
    export PATH="/opt/rust/bin:${PATH}"
  fi
  if [[ ! -d "${CARGO_HOME}" ]] ; then
    export CARGO_HOME="/opt/rust/cargo"
  fi

  cd "${srcdir}/librsvg-${pkgver}"
  for _arch in ${_architectures}; do
    # configure can read RUST_TARGET now
    if [[ ${_arch} = i686-w64-mingw32 ]] ; then
      export RUST_TARGET=i686-pc-windows-gnu
    fi
    if [[ ${_arch} = x86_64-w64-mingw32 ]] ; then
      export RUST_TARGET=x86_64-pc-windows-gnu
    fi
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-introspection \
      --disable-tools
    # pass static rust package to linker
    sed -i "s/^deplibs_check_method=.*/deplibs_check_method=\"pass_all\"/g" libtool
    # add missing crt libs (ws2_32 and userenv) to LIBRSVG_LIBS
    sed -i "s/^LIBRSVG_LIBS = .*/& -lws2_32 -luserenv/g" Makefile
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/librsvg-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -exec ${_arch}-strip --strip-debug {} \;
    rm -r "${pkgdir}/usr/${_arch}/share/"{doc,man}
  done
}

# vim:set ts=2 sw=2 et:
