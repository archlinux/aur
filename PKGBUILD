pkgname=mingw-w64-python312-bin
pkgver=3.12.2
_pybasever=312
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
sha256sums=('281fbf681dd44400c2c44ee01377738556bc64d1e26192840caac817f4177d6e'
            '144ee3fa0c4171f98ec554ac01bb44ee1e895d154609f143b1d20b52c3fe383e'
            'a7c4f6a9dc423d8c328003254ab0c9338b83037bd787d680826a5bf84308116e'
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
    gendef python3.dll
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
    chmod a+r -R "$pkgdir"/usr/${_arch}/include
    chmod a+x "$pkgdir"/usr/${_arch}/include/python${_pybasever}/{cpython,internal}
    install -m644 ../PC/pyconfig.h "$pkgdir"/usr/${_arch}/include/python${_pybasever}
    install -m755 python*.dll "$pkgdir"/usr/${_arch}/bin
    install -d "$pkgdir"/usr/${_arch}/lib/python${_pybasever}
    install -m644 *.pyd "$pkgdir"/usr/${_arch}/lib/python${_pybasever}
    install -m755 python.exe "$pkgdir"/usr/${_arch}/bin/python${_pybasever}.exe
    install -m644 python${_pybasever}.zip "$pkgdir"/usr/${_arch}/bin/
    install -d "$pkgdir"/usr/bin
    install -m755 ${_arch}-python${_pybasever}-bin "$pkgdir"/usr/bin
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
