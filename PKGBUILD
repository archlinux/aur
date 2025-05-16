# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-fontconfig
pkgver=2.16.2
pkgrel=1
pkgdesc="A library for configuring and customizing font access (mingw-w64)"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/fontconfig/"
license=('custom')
depends=('mingw-w64-expat'
         'mingw-w64-freetype2')
makedepends=('mingw-w64-configure'
             'git'
             'autoconf-archive'
             'gperf'
             'python-lxml'
             'json-c'
             'python-six')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://gitlab.freedesktop.org/fontconfig/fontconfig.git#tag=${pkgver}"
        "0007-pkgconfig.mingw.patch")
b2sums=('fb48c39cf69ee0e156ee4872b69d28fb0c074afac47b97cf31829d56e6c88aa48a26d97c8348d2ee79e338c4400c098d79458bdc65eeffbd0f7a4464d6620aad'
        '2e63a8467b940cd56af9e9b13c04848d07466f3b0b778b74405bbea47f8db87625cd65e6d42e446169c930374544cca9a01ac77df6bffc8790cc455f72b5a56b')

prepare() {
  cd fontconfig
  patch -p1 -i ${srcdir}/0007-pkgconfig.mingw.patch
  # do not build buggy test code
  sed -i /test\\/Makefile/d configure.ac
  sed -i "s/po-conf test/po-conf/g" Makefile.am
  rm -r test
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd fontconfig
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-arch=${_arch%-w64-mingw32} \
      --disable-docs
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/fontconfig/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
