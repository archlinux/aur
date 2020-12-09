pkgname=mingw-w64-python37-bin
pkgver=3.7.9
_pybasever=37
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
sha256sums=('010cef379e1096cebf667e8f2c92a72dc455c927c7f7b8ca8e029975d81946bf'
            '18627a097adf47829a847053febac5532376075243e233bd9ec61d6ea09dee1f'
            '39b018bc7d8a165e59aa827d9ae45c45901739b0bbb13721e4f973f3521c166a'
            '86e768f17994ce586d646b4ace95f819943dfe6a0fb1afa40de4188e975d5db8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/Python-${pkgver}"
  # https://bugs.python.org/issue36020
  sed -i 's|#if defined(MS_WIN32) \&\& !defined(HAVE_SNPRINTF)|#if defined(_MSC_VER) \&\& !defined(HAVE_SNPRINTF)|g' Include/pyerrors.h
}

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
    install -m644 libpython${_pybasever}*.a "$pkgdir"/usr/${_arch}/lib
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
    pushd "$pkgdir"/usr/${_arch}/bin/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
  # hashlib links to libcrypto-1_1.dll on both i686 and x86_64, but mingw-w64-openssl provides libcrypto-1_1-x64.dll on x86_64
  install -m755 "${srcdir}"/Python-${pkgver}/build-x86_64-w64-mingw32/{libssl-1_1.dll,libcrypto-1_1.dll} "$pkgdir"/usr/x86_64-w64-mingw32/bin
}
