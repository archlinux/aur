pkgname=mingw-w64-python26-bin
pkgver=2.6.6
_pybasever=26
pkgrel=1
pkgdesc="A high-level scripting language (native MSVC version) (mingw-w64)"
arch=('any')
license=('PSF')
url="http://www.python.org/"
depends=('mingw-w64-crt')
makedepends=('wine' 'mingw-w64-tools' 'mingw-w64-binutils')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.python.org/ftp/python/${pkgver}/python-${pkgver}.msi"
        "http://www.python.org/ftp/python/${pkgver}/python-${pkgver}.amd64.msi")
md5sums=('80b1ef074a3b86f34a2e6b454a05c8eb'
         '6f91625fe7744771da04dd1cabef0adc' )

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
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
