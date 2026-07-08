# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-fontconfig
pkgver=2.18.1
pkgrel=1
pkgdesc="A library for configuring and customizing font access (mingw-w64)"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/fontconfig/"
license=('custom')
depends=('mingw-w64-expat'
         'mingw-w64-freetype2')
makedepends=('mingw-w64-meson'
             'git'
             'autoconf-archive'
             'gperf'
             'python-lxml'
             'json-c'
             'python-six')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://gitlab.freedesktop.org/fontconfig/fontconfig.git#tag=${pkgver}"
        "0007-pkgconfig.mingw.patch")
b2sums=('e9c71a0340c0a6323b1457e981fe321a39c939024c930ff73ce2f0c0b0aa3f8f3488f63bf65c3eb14bf1dcbcd7bff4e0417dc81ef7a309902ee679912b4918a2'
        '2e63a8467b940cd56af9e9b13c04848d07466f3b0b778b74405bbea47f8db87625cd65e6d42e446169c930374544cca9a01ac77df6bffc8790cc455f72b5a56b')

prepare() {
  cd fontconfig
  patch -p1 -i ${srcdir}/0007-pkgconfig.mingw.patch
}

build() {
  for _arch in ${_architectures}; do
    ${_arch}-meson fontconfig build-${_arch} \
      --default-library=both \
      -D doc=disabled \
      -D tests=disabled \
      -D tools=disabled
    meson compile -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    meson install -C build-${_arch} --destdir "$pkgdir"
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
