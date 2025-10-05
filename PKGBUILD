# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-libbluray
pkgver=1.4.0
pkgrel=1
pkgdesc='Library to access Blu-Ray disks for video playback (mingw-w64)'
arch=('any')
url='http://www.videolan.org/developers/libbluray.html'
license=('LGPL-2.1-only')
depends=('mingw-w64-crt' 'mingw-w64-fontconfig' 'mingw-w64-freetype2' 'mingw-w64-libxml2')
options=(!strip !buildflags !libtool staticlibs !debug)
makedepends=(
  mingw-w64-gcc
  mingw-w64-meson
  mingw-w64-pkg-config
  git
  ninja
)
#makedepends=('apache-ant' 'java-environment=17' 'git' 'mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
#optdepends=('java-runtime: BD-J library')
_tag=9f07fbb2077be7a40b062bcf2463a9941c2a3b13
source=(
  git+https://code.videolan.org/videolan/libbluray.git#tag=${_tag}
  git+https://code.videolan.org/videolan/libudfread.git
)
b2sums=('12f30033f1d4efc24acd1886de75347de3301e708b2fdae48cdce1d29064af6235302dd33f5bc0ee8d0fa4adf61c05590818b26a15c7dfb76c188dfb59eed128'
        'SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd libbluray

  for submodule in contrib/libudfread; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../${submodule#*/}
    git -c protocol.file.allow=always submodule update ${submodule}
  done
}

build() {
  for _arch in ${_architectures}; do
    ${_arch}-meson libbluray build-${_arch} --force-fallback-for libudfread -Dbdj_jar=disabled
    meson compile -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" meson install -C build-${_arch}
    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et:
