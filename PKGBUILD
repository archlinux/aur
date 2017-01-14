# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-libbluray
pkgver=0.9.3.r84.05c9fdec
pkgrel=1
pkgdesc='Library to access Blu-Ray disks for video playback (mingw-w64)'
arch=('any')
url='http://www.videolan.org/developers/libbluray.html'
license=('LGPL2.1')
depends=('mingw-w64-crt' 'mingw-w64-fontconfig' 'mingw-w64-freetype2' 'mingw-w64-libxml2')
options=(!strip !buildflags !libtool staticlibs)
makedepends=('git' 'mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
#makedepends=('apache-ant' 'git' 'mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
#optdepends=('java-environment: BD-J library')
_commit_libbluray='05c9fdececbff43561f8d8ca704e7e2203bdd5a8'
_commit_libudfread='64ac239e7aa741ad3e2e2d48eafd6e26fb202ee7'
source=("git+https://git.videolan.org/git/libbluray.git#commit=${_commit_libbluray}"
        "git+https://git.videolan.org/git/libudfread.git#commit=${_commit_libudfread}"
        "configure.patch")
sha256sums=('SKIP'
            'SKIP'
            '04d9cbf34886cb26f94927e9aa8e5a4f6bf19fc83c7aabdb8358171a777e9da8')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd libbluray

  git describe | sed 's/-/.r/; s/-g/./'
}

prepare() {
  cd ${srcdir}/libbluray

  git submodule init contrib/libudfread
  git config submodule.contrib/udfread.url ../libudfread
  git submodule update contrib/libudfread

  patch -Np1 < ../configure.patch
  ./bootstrap
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/libbluray/build-${_arch} && cd ${srcdir}/libbluray/build-${_arch}

    ${_arch}-configure \
      --disable-examples \
      --disable-bdjava
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/libbluray/build-${_arch}

    make DESTDIR="$pkgdir" install
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et:
