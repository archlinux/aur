pkgname=mingw-w64-python27-bin
pkgver=2.7.16
_pybasever=27
pkgrel=2
pkgdesc="A high-level scripting language (native MSVC version) (mingw-w64)"
arch=('any')
license=('PSF')
url="http://www.python.org/"
depends=('mingw-w64-crt')
optdepends=('mingw-w64-wine: runtime support')
makedepends=('wine' 'mingw-w64-tools' 'mingw-w64-binutils')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.python.org/ftp/python/${pkgver}/python-${pkgver}.msi"
        "http://www.python.org/ftp/python/${pkgver}/python-${pkgver}.amd64.msi"
        wine-python.sh)
sha256sums=('d57dc3e1ba490aee856c28b4915d09e3f49442461e46e481bc6b2d18207831d7'
            '7c0f45993019152d46041a7db4b947b919558fdb7a8f67bcd0535bc98d42b603'
            SKIP)

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

    # https://bugs.python.org/issue11722
    sed -i "s|#if defined(MS_WIN64)|#if defined(MS_WIN64) \|\| defined(__MINGW64__)|g" include/pyconfig.h
    # https://bugs.python.org/issue36020
    sed -i 's|#if defined(MS_WIN32) \&\& !defined(HAVE_SNPRINTF)|#if defined(_MSC_VER) \&\& !defined(HAVE_SNPRINTF)|g' include/pyerrors.h

    gendef python${_pybasever}.dll
    ${_arch}-dlltool --dllname python${_pybasever}.dll --def python${_pybasever}.def --output-lib libs/libpython${_pybasever}.dll.a
    sed "s|@TRIPLE@|${_arch}|g;s|@PYVER@|${_pybasever}|g" "${srcdir}"/wine-python.sh > ${_arch}-python${_pybasever}-bin
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
    install -d "$pkgdir"/usr/bin
    install -m755 ${_arch}-python${_pybasever}-bin "$pkgdir"/usr/bin
    pushd "$pkgdir"/usr/${_arch}/bin/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
