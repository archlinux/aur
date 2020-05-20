_pkgname=mpv
pkgname="mingw-w64-${_pkgname}"
pkgver=0.32.0
pkgrel=1
pkgdesc="Video player based on MPlayer/mplayer2 (mingw-w64)"
url="https://mpv.io/"
arch=('any')
license=('GPL')
depends=("mingw-w64-ffmpeg"
         "mingw-w64-lcms2"
         "mingw-w64-libass"
         "mingw-w64-libbluray"
         "mingw-w64-libjpeg-turbo"
         "mingw-w64-shaderc"
         "mingw-w64-spirv-cross")
makedepends=("mingw-w64-gcc"
             "perl"
             "mingw-w64-pkg-config"
             "python")
options=(staticlibs !strip !buildflags)
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/mpv-player/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('9163f64832226d22e24bbc4874ebd6ac02372cd717bef15c28a0aa858c5fe592')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  pushd ${_pkgname}-${pkgver}
  [[ -x ./waf ]] || /usr/bin/python3 ./bootstrap.py
  popd

  for _arch in ${_architectures}; do
    cp -rf "${_pkgname}-${pkgver}" "build-${_arch}"
  done
  rm -rf "${_pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/"
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    DEST_OS=win32 \
    TARGET=${_arch} \
    PKG_CONFIG=/usr/bin/${_arch}-pkg-config \
    CC=/usr/bin/${_arch}-gcc \
    PERL=/usr/bin/perl \
    AR=/usr/bin/${_arch}-ar \
    WINDRES=/usr/bin/${_arch}-windres \
    ./waf configure \
      --prefix=/usr/$_arch \
      --check-c-compiler=gcc \
      --enable-libmpv-shared \
      --disable-egl-angle \
      --disable-egl-angle-lib
    ./waf build
    popd
  done
}

package() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    pushd build-${_arch}

    export PYTHON=/usr/$_arch/bin/python
    ./waf install --destdir="${pkgdir}"

    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g

    # Move encoding-profiles.conf to share/doc alongside the example .conf files.
    # mpv doesn't search /etc for configuration on MinGW.
    mv "${pkgdir}/usr/$_arch/etc/mpv/"*.conf "${pkgdir}/usr/$_arch/share/doc/mpv/"

    popd
  done
}
