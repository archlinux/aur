pkgname=mingw-w64-python-bin
pkgver=3.5.1
_pybasever=35
pkgrel=1
pkgdesc="Next generation of the python high-level scripting language (native MSVC version) (mingw-w64)"
arch=('any')
license=('PSF')
url="http://www.python.org/"
provides=('mingw-w64-python')
conflicts=('mingw-w64-python')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-tools' 'mingw-w64-binutils')
options=('staticlibs' '!buildflags' '!strip')
source=("https://www.python.org/ftp/python/${pkgver}/python-${pkgver}-embed-win32.zip"
        "https://www.python.org/ftp/python/${pkgver}/python-${pkgver}-embed-amd64.zip"
        "https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tgz")
noextract=("python-${pkgver}-embed-win32.zip"
           "python-${pkgver}-embed-amd64.zip")
md5sums=('6e783d8fd44570315d488b9a9881ff10'
         'b07d15f515882452684e0551decad242'
         'be78e48cdfc1a7ad90efff146dce6cfe')

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
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/Python-${pkgver}/build-${_arch}"
    install -d "$pkgdir"/usr/${_arch}/lib
    install -m644 libpython${_pybasever}*.a "$pkgdir"/usr/${_arch}/lib
    install -d "$pkgdir"/usr/${_arch}/bin
    install -d "$pkgdir"/usr/${_arch}/include
    cp -r ../Include "$pkgdir"/usr/${_arch}/include/python${_pybasever}
    install -m644 ../PC/pyconfig.h "$pkgdir"/usr/${_arch}/include/python${_pybasever}
    install -m755 python${_pybasever}.dll "$pkgdir"/usr/${_arch}/bin
    install -d "$pkgdir"/usr/${_arch}/lib/python${_pybasever}
    install -m644 *.pyd "$pkgdir"/usr/${_arch}/lib/python${_pybasever}
    install -m755 python.exe "$pkgdir"/usr/${_arch}/bin/python${_pybasever}.exe
    install -m644 python${_pybasever}.zip "$pkgdir"/usr/${_arch}/bin/
    pushd "$pkgdir"/usr/${_arch}/bin/
    ln -s python${_pybasever}.exe python3.exe
    ln -s python3.exe python.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
