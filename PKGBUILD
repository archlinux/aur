# Contributor: nikita <krikita77@gamil.com>

pkgname=mingw-w64-irrlicht
pkgver=1.8.4
pkgrel=1
pkgdesc="An open source high performance realtime 3D graphics engine. (mingw-w64)"
arch=('any')
url="http://irrlicht.sourceforge.net/"
license=('ZLIB')
depends=('mingw-w64-libjpeg' 'mingw-w64-bzip2' 'mingw-w64-libpng')
makedepends=('mingw-w64-libzip' 'mingw-w64-cmake')
optdepends=('libxcursor: run examples')
source=("http://downloads.sourceforge.net/irrlicht/irrlicht-$pkgver.zip"
        "git+git://github.com/ZahlGraf/IrrlichtCMake.git")
md5sums=('9401cfff801395010b0912211f3cbb4f'
		 'SKIP')
options=('!strip' '!buildflags' 'staticlibs')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cp -r ${srcdir}/IrrlichtCMake/* ${srcdir}/irrlicht-${pkgver}/
}

build() {
  cd ${srcdir}/irrlicht-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DIRRLICHT_BUILD_EXAMPLES=OFF \
      -DIRRLICHT_INSTALL_EXAMPLE_SOURCE=OFF \
      -DIRRLICHT_INSTALL_MEDIA_FILES=OFF  \
      -DIRRLICHT_STATIC_LIBRARY=ON \
      -DBUILD_SHARED_LIBS=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DIRRLICHT_ENABLE_DIRECTX9=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/irrlicht-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    for n in "$pkgdir"/usr/${_arch}/tools/*; do
      mv $n/*.exe "$pkgdir"/usr/${_arch}/bin
      rm -r $n
    done
    rm -r "$pkgdir"/usr/${_arch}/tools
  done

  install -Dm644 "${srcdir}"/irrlicht-${pkgver}/readme.txt $pkgdir/usr/share/licenses/$pkgbase/LICENSE
}
