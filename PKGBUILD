pkgname=mingw-w64-python311-bin
pkgver=3.11.5
_pybasever=311
pkgrel=1
pkgdesc="Next generation of the python high-level scripting language (native MSVC version) (mingw-w64)"
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
sha256sums=('19705f2e0bc2306f9dc9ca0a9d4c97e16e2c4d3994970a6ed09fe8e7d8ea042d'
            'd82391a2e51c3684987c61f6b7cedbff3ce9fbe2e39cd948d32b0da866544b17'
            'a12a0a013a30b846c786c010f2c19dd36b7298d888f7c4bd1581d90ce18b5e58'
            'a76a4715e87d3ed4aca6babc8715de8de94513dae4c683c1681551c43698b5ae')

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
    sed -i "s|PyEval_InitThreads@0|PyEval_InitThreads|g" python${_pybasever}.def
    ${_arch}-dlltool --dllname python${_pybasever}.dll --def python${_pybasever}.def --output-lib libpython${_pybasever}.dll.a
    ${_arch}-dlltool --dllname python3.dll --def python3.def --output-lib libpython3.dll.a
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
    install -m644 ../PC/pyconfig.h "$pkgdir"/usr/${_arch}/include/python${_pybasever}
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
