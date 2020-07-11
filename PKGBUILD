# Maintainer: Viktor Schneider <aur@vjs.io>
# Contributor: Никола "hauzer" Вукосављевић <hauzer@gmx.com>
# Contributor: Daniel Kirchner <daniel@ekpyron.org>
# Based on mingw-w64-boost

pkgname=mingw-w64-boost-python
pkgver=1.73.0
_boostver=${pkgver//./_}
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries (mingw-w64, python)"
arch=('i686' 'x86_64')
url="http://www.boost.org/"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-bzip2' 'mingw-w64-boost' 'mingw-w64-python')
# Depends on native Boost so we can use its bjam instead of building it ourself first
makedepends=('mingw-w64-gcc' 'boost' 'bzip2' 'wine')
options=(!strip !buildflags staticlibs)
source=("https://dl.bintray.com/boostorg/release/${pkgver}/source/boost_${_boostver}.tar.bz2"
        "python_jam.patch")
sha256sums=('4eb3b8d442b426dc35346235c8733b5ae35ba431690e38c6a8263dce9fcbb402'
            '6437811e541e1230576c6d60e73420bba1a644f5692a6973eb6bb6aea7e88056')
            
_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

_bjam() {
    _arch=$1
    _address_model=""
    if [[ ${_arch} = i686-w64-mingw32 ]] ; then
        _address_model=32
    else
        _address_model=64
    fi

    echo /usr/bin/bjam \
            toolset=gcc-mingw64 \
	        target-os=windows \
	        debug-symbols=off \
	        variant=release \
	        threading=multi \
	        threadapi=win32 \
	        link=static,shared \
	        runtime-link=shared \
	        --prefix="${pkgdir}/usr/${_arch}" \
	        --user-config=user-config.jam \
	        --with-python \
	        cxxflags=\"-std=c++14 -DUSE_DL_EXPORT=1 -D_FORTIFY_SOURCE=2 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4\" \
		linkflags=\"-Wl,-O1,--sort-common,--as-needed -fstack-protector -lpython3.8\" \
	        address-model=${_address_model} \
	        architecture=x86 \
	        binary-format=pe \
	        ${MAKEFLAGS} \
	        --layout=system -d+2
}

build() {
    cd "${srcdir}"
    for _arch in "${_architectures[@]}" ; do
        cp -rT "boost_${_boostver}" "build-${_arch}"
        pushd "build-${_arch}"

        _pyver=$(wine /usr/${_arch}/bin/python --version | sed -nr 's/Python ([0-9]\.[0-9])\.[0-9]/\1/p')
  
	patch -Np0 -i "${srcdir}/python_jam.patch"

	cat > user-config.jam << EOF
using gcc : mingw64 :
    /usr/bin/${_arch}-g++ :
	<rc>/usr/bin/${_arch}-windres
	<archiver>/usr/bin/${_arch}-ar
	<root>/usr/${_arch}
;

using python : ${_pyver} : "wine /usr/${_arch}/bin/python" :
    /usr/${_arch}/include/python${_pyver} :
    /usr/${_arch}/lib
;

EOF

        unset LDFLAGS CPPFLAGS
        eval $(_bjam ${_arch})

        popd
    done
}

package() {
    cd "${srcdir}"
    for _arch in "${_architectures[@]}" ; do
        pushd "build-${_arch}"
	
	install -d ${pkgdir}/usr/${_arch}/lib/cmake
	install -d ${pkgdir}/usr/${_arch}/bin
        cp -rv ./stage/lib/cmake/boost_python-${pkgver} "${pkgdir}/usr/${_arch}/lib/cmake/"
        cp -rv ./stage/lib/cmake/boost_numpy-${pkgver} "${pkgdir}/usr/${_arch}/lib/cmake/"
        cp -v ./stage/lib/*.a "${pkgdir}/usr/${_arch}/lib/"
        cp -v ./stage/lib/*.dll "${pkgdir}/usr/${_arch}/bin/"
	
	
        ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
        ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll

        popd
    done
}

