# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_commit=312c4b8c28c99b9051ee6de6fa966cf977b0f7b4  # tags/2.56.3
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-librsvg
pkgver=2.56.3
pkgrel=1
pkgdesc="SVG rendering library (mingw-w64)"
arch=('any')
url="https://wiki.gnome.org/action/show/Projects/LibRsvg"
license=('LGPL')
depends=('mingw-w64-gdk-pixbuf2'
         'mingw-w64-pango'
         'mingw-w64-cairo'
         'mingw-w64-libxml2'
         'mingw-w64-freetype2')
makedepends=('mingw-w64-configure'
             'mingw-w64-rust>=1.58'
             'mingw-w64-wine'
             'gdk-pixbuf2'
             'gobject-introspection'
             'git')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://gitlab.gnome.org/GNOME/librsvg.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/librsvg"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}/librsvg"
  # disable DOC
  sed -i "s/^RSVG_DOC = .*/RSVG_DOC = /g" Makefile.am
  NOCONFIGURE=1 ./autogen.sh
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

  cd "${srcdir}/librsvg"
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
    # add missing crt libs (bcrypt, ws2_32, userenv and ntdll) to LIBRSVG_LIBS
    sed -i "s/^LIBRSVG_LIBS = .*/& -lbcrypt -lws2_32 -luserenv  -lntdll/g" Makefile

    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/librsvg/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -exec ${_arch}-strip --strip-debug {} \;
    rm -rf "${pkgdir}/usr/${_arch}/share/"{doc,man}
  done
}

# vim:set ts=2 sw=2 et:
