# -*- mode: Shell-script; eval: (setq indent-tabs-mode nil); eval: (setq tab-width 2) -*-
# Maintainer: Dominic Meiser < git at msrd0 dot de >
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_commit=911b19f19f1334d51c452756f9ce222c1101097b  # tags/2.14.0^0
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-fontconfig-static
pkgver=2.14.0
pkgrel=1
pkgdesc="A library for configuring and customizing font access (mingw-w64)"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/fontconfig/"
license=('custom')
depends=('mingw-w64-expat'
         'mingw-w64-freetype2')
makedepends=('mingw-w64-meson'
             'ninja'
             'git'
             'gperf'
             'python-lxml'
             'json-c'
             'python-six')
provides=("mingw-w64-fontconfig=$pkgver")
conflicts=('mingw-w64-fontconfig')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://gitlab.freedesktop.org/fontconfig/fontconfig.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/fontconfig"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "$srcdir/fontconfig"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}
    pushd build-${_arch}
    ${_arch}-meson \
      --default-library static \
      -D doc=disabled \
      -D tools=disabled \
      -D tests=disabled
    ninja
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/fontconfig/build-${_arch}"
    DESTDIR="${pkgdir}" ninja install
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
