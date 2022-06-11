pkgname=mingw-w64-python34-bin
pkgver=3.4.4
_pybasever=34
pkgrel=1
pkgdesc="Next generation of the python high-level scripting language (native MSVC version) (mingw-w64)"
arch=('any')
license=('PSF')
url="http://www.python.org/"
depends=('mingw-w64-crt')
makedepends=('wine' 'mingw-w64-tools' 'mingw-w64-binutils')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.python.org/ftp/python/${pkgver}/python-${pkgver}.msi"
        "http://www.python.org/ftp/python/${pkgver}/python-${pkgver}.amd64.msi")
sha256sums=('46c8f9f63cf02987e8bf23934b2f471e1868b24748c5bb551efcf4863b43ca6c'
            'ace645d104bddd4f4ffbf453bedddaf2496e3609af3fa47173680d2f321d3709')

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
    ${_arch}-msiexec /i "${srcdir}"/python-${pkgver}${target}.msi /qb TARGETDIR=$PWD
    gendef python${_pybasever}.dll
    ${_arch}-dlltool --dllname python${_pybasever}.dll --def python${_pybasever}.def --output-lib libs/libpython${_pybasever}.dll.a
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    # these have spaces in their names
    rm -f Lib/site-packages/setuptools/command/launcher\ manifest.xml
    rm -f Lib/site-packages/setuptools/script\ \(dev\).tmpl

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
