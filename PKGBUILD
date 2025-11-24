# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-librsvg
pkgver=2.61.2
pkgrel=1
pkgdesc="SVG rendering library (mingw-w64)"
arch=('any')
url="https://wiki.gnome.org/action/show/Projects/LibRsvg"
license=(LGPL-2.1-or-later)
depends=('mingw-w64-gdk-pixbuf2'
         'mingw-w64-pango'
         'mingw-w64-cairo'
         'mingw-w64-libxml2'
         'mingw-w64-freetype2')
makedepends=('cargo-c'
             'mingw-w64-meson'
             'mingw-w64-rust>=1.58'
             'mingw-w64-wine'
             'gdk-pixbuf2'
             'gobject-introspection'
             'git')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://gitlab.gnome.org/GNOME/librsvg.git#tag=$pkgver")
b2sums=('bb7f38bb6518d193dfabab07759ca2d6f56edd6cc49b68329e401ce907d64ae49bfc9a46c8927686e315c7ae1ef4c5babec0d1bfef59b172c3f5ce8f7c8b7f12')

pkgver() {
  cd "${srcdir}/librsvg"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  if [[ -d "${RUST_PATH}" ]] ; then
    export PATH="${RUST_PATH}:${PATH}"
  else
    export PATH="/opt/rust/bin:${PATH}"
  fi
  if [[ ! -d "${CARGO_HOME}" ]] ; then
    export CARGO_HOME="/opt/rust/cargo"
  fi

  cd "${srcdir}/librsvg"
  cargo fetch --locked --target "i686-pc-windows-gnu"
  cargo fetch --locked --target "x86_64-pc-windows-gnu"
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

  # get CHOST from gcc
  export CHOST=$(LANG=C gcc -v 2>&1 | grep "^Target" | grep -o '[^ ]*$')

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
    ${_arch}-meson \
      --default-library both \
      -Dintrospection=disabled \
      -Dpixbuf-loader=disabled \
      ..

    mkdir inst
    DESTDIR=inst ninja install
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/librsvg/build-${_arch}"
    cp -r inst/* ${pkgdir}
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -exec ${_arch}-strip --strip-debug {} \;
    rm -rf "${pkgdir}/usr/${_arch}/share/"{doc,man}
  done
}

# vim:set ts=2 sw=2 et:
