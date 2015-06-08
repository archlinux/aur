pkgname=mingw-w64-python2-bin
pkgver=2.7.10
_pybasever=27
pkgrel=1
pkgdesc="A high-level scripting language (native MSVC version) (mingw-w64)"
arch=('any')
license=('PSF')
url="http://www.python.org/"
provides=('mingw-w64-python2')
conflicts=('mingw-w64-python2')
depends=('mingw-w64-crt')
makedepends=('wine' 'mingw-w64-tools' 'mingw-w64-binutils')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.python.org/ftp/python/${pkgver}/python-${pkgver}.msi"
        "http://www.python.org/ftp/python/${pkgver}/python-${pkgver}.amd64.msi")
md5sums=('4ba2c79b103f6003bc4611c837a08208'
         '35f5c301beab341f6f6c9785939882ee')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    target=""
    if test "${_arch}" = x86_64-w64-mingw32
    then
      target=".amd64"
    fi
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    msiexec /i "${srcdir}"/python-${pkgver}${target}.msi /qb TARGETDIR=$PWD
    gendef python${_pybasever}.dll
    ${_arch}-dlltool --dllname python${_pybasever}.dll --def python${_pybasever}.def --output-lib libs/libpython${_pybasever}.dll.a
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    install -d "$pkgdir"/usr/${_arch}/lib
    install -m644 libs/libpython${_pybasever}*.a "$pkgdir"/usr/${_arch}/lib
    install -d "$pkgdir"/usr/${_arch}/bin
    install -d "$pkgdir"/usr/${_arch}/include
    cp -r include "$pkgdir"/usr/${_arch}/include/python${_pybasever}
    install -m755 python${_pybasever}.dll "$pkgdir"/usr/${_arch}/bin
    cp -r Lib "$pkgdir"/usr/${_arch}/lib/python${_pybasever}
    install -m644 DLLs/*.pyd "$pkgdir"/usr/${_arch}/lib/python${_pybasever}
    install -m755 python.exe "$pkgdir"/usr/${_arch}/bin/python${_pybasever}.exe
    pushd "$pkgdir"/usr/${_arch}/bin/
    ln -s python${_pybasever}.exe python2.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
