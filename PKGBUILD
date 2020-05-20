# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_commit=b1df1101a643ae16cdfa1d83b939de2497b1bf27  # tags/2.13.92^0
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-fontconfig
pkgver=2.13.92
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
source=("git+https://gitlab.freedesktop.org/fontconfig/fontconfig.git#commit=${_commit}"
        "0007-pkgconfig.mingw.patch")
sha256sums=('SKIP'
            'af373531873da46d0356305da5444c1ec74f443cd2635ea2db6b7dadd1561f5b')

pkgver() {
  cd fontconfig
  git describe --tags | sed 's/-/+/g'
}

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
