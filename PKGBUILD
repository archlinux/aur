# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-librsvg
pkgver=2.62.3
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
source=("git+https://gitlab.gnome.org/GNOME/librsvg.git#tag=$pkgver"
  "0002-avoid-link-whole.patch")
b2sums=('63d921e517bb95362259f477cacfbafcf788ed9f40fe15697f10b0dfdff32831c7963eb4fce65ab03ad94790555741f6450f275713a9ae9aca7ceb27af653e85'
        'b9219e64e605b7d92bee720882496c5c03872a61c1f1bce6ff4673df75b282aec920c2befcd3a81a1bd401a7c33f8f29f8846a91e30ae2886d29c9b74b71650c')

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

  # https://gitlab.gnome.org/GNOME/librsvg/-/issues/1210
  patch -Np1 -i ../0002-avoid-link-whole.patch
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

  for _arch in ${_architectures}; do
    # configure can read RUST_TARGET now
    if [[ ${_arch} = i686-w64-mingw32 ]] ; then
      export RUST_TARGET=i686-pc-windows-gnu
    fi
    if [[ ${_arch} = x86_64-w64-mingw32 ]] ; then
      export RUST_TARGET=x86_64-pc-windows-gnu
    fi

    ${_arch}-meson librsvg build-${_arch} \
      --default-library=both \
      -D docs=disabled \
      -D tests=false \
      -D introspection=disabled \
      -D pixbuf-loader=disabled \
      -D rsvg-convert=disabled
    meson compile -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    meson install -C build-${_arch} --destdir "$pkgdir"
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -exec ${_arch}-strip --strip-debug {} \;
    rm -rf "${pkgdir}/usr/${_arch}/share/"{doc,man}
  done
}

# vim:set ts=2 sw=2 et:
