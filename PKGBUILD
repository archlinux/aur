# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-librsvg
pkgver=2.61.1
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
b2sums=('279bf73beaaa8ace21631db1d1df303527c5f9cdc5c4e5811ffd15602e513c7e37164e444390653af96ba7257ba30904081261f9f90b983292c8b0b1cdfd509b')

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
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # do not add host bindir to PATH
  # https://gitlab.gnome.org/GNOME/librsvg/-/issues/1141
  sed -i "s|extra_env.prepend('PATH', x)|# skip|g" meson.build

  # use RSVG_STATIC when build static libs
  # https://gitlab.gnome.org/GNOME/librsvg/-/issues/1143
  sed -i "s|^api_test = |if get_option('default_library') == 'static' or get_option('default_library') == 'both'\n  test_c_args += ['-DRSVG_STATIC']\nendif\n\napi_test = |" librsvg-c/tests-c/meson.build
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
