pkgname=mingw-w64-python314-bin
pkgver=3.14.9
_pybasever=314
pkgrel=1
pkgdesc="The Python programming language (native MSVC version) (mingw-w64)"
arch=('any')
license=('PSF')
url="http://www.python.org/"
depends=('mingw-w64-openssl')
optdepends=('mingw-w64-wine: runtime support')
makedepends=('mingw-w64-tools' 'mingw-w64-binutils')
options=('staticlibs' '!buildflags' '!strip')
source=("https://www.python.org/ftp/python/${pkgver}/python-${pkgver}-embed-win32.zip"
        "https://www.python.org/ftp/python/${pkgver}/python-${pkgver}-embed-amd64.zip"
        "https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tgz"
        wine-python.sh)
noextract=("python-${pkgver}-embed-win32.zip"
           "python-${pkgver}-embed-amd64.zip")
sha256sums=('812d1d1f23016ac72752f5c5ee67ffc86252507ff21405554f21e03cbe2ee6ee'
            '3c01d7cfc666f746a6f064f60fb2156ab0ec464d3d738ab796371a46a9bb24a2'
            '8b47e85ee67e93945e93620a051a8f44bfc1e9735ed67075d166f4a74b7a060b'
            '46cf6f2ed602e0779c10715e1c7776c399aaa06cfce7758ae88420b56b1616fe')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/Python-${pkgver}"
  for _arch in ${_architectures}; do
    target="win32"
    if test "${_arch}" = x86_64-w64-mingw32
    then
      target="amd64"
    fi
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    bsdtar -xf "${srcdir}"/python-${pkgver}-embed-${target}.zip
    gendef python${_pybasever}.dll
    ${_arch}-dlltool --dllname python${_pybasever}.dll --def python${_pybasever}.def --output-lib libpython${_pybasever}.dll.a
    sed "s|@TRIPLE@|${_arch}|g;s|@PYVER@|${_pybasever}|g" "${srcdir}"/wine-python.sh > ${_arch}-python${_pybasever}-bin
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/Python-${pkgver}/build-${_arch}"
    install -d "$pkgdir"/usr/${_arch}/lib
    install -m644 libpython*.a "$pkgdir"/usr/${_arch}/lib
    install -d "$pkgdir"/usr/${_arch}/bin
    install -d "$pkgdir"/usr/${_arch}/include/python${_pybasever}
    cp -r ../Include/* "$pkgdir"/usr/${_arch}/include/python${_pybasever}
    chmod a+r -R "$pkgdir"/usr/${_arch}/include
    chmod a+x "$pkgdir"/usr/${_arch}/include/python${_pybasever}/{cpython,internal}
    install -m644 ../PC/pyconfig.h "$pkgdir"/usr/${_arch}/include/python${_pybasever}/pyconfig.h
    install -m755 python${_pybasever}.dll "$pkgdir"/usr/${_arch}/bin
    install -d "$pkgdir"/usr/${_arch}/lib/python${_pybasever}
    install -m644 *.pyd "$pkgdir"/usr/${_arch}/lib/python${_pybasever}
    install -m755 python.exe "$pkgdir"/usr/${_arch}/bin/python${_pybasever}.exe
    install -m644 python${_pybasever}.zip "$pkgdir"/usr/${_arch}/bin/
    install -d "$pkgdir"/usr/bin
    install -m755 ${_arch}-python${_pybasever}-bin "$pkgdir"/usr/bin
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
