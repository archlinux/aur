# Maintainer: Никола "hauzer" Вукосављевић <hauzer@gmx.com>
# Contributor: Daniel Kirchner <daniel@ekpyron.org>
# Based on mingw-w64-boost

pkgname=mingw-w64-boost-python
pkgver=1.62.0
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
source=(http://downloads.sourceforge.net/sourceforge/boost/boost_${_boostver}.tar.bz2
        boost-mingw.patch
        python_jam.patch)
md5sums=('5fb94629535c19e48703bdb2b2e9490f'
         '01f5f0d6b915d3b04dbabfd6db40f1e9'
         '086cece11abae7e60a8f3d41f7833f3d')

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
	        variant=release \
	        threading=multi \
	        threadapi=win32 \
	        link=static,shared \
	        runtime-link=shared \
	        --prefix="${pkgdir}/usr/${_arch}" \
	        --user-config=user-config.jam \
	        --with-python \
	        cxxflags=\'-std=c++11 -include cmath -I/usr/x86_64-w64-mingw32/include/python27/\' \
	        address-model=${_address_model} \
	        architecture=x86 \
	        binary-format=pe \
	        ${MAKEFLAGS} \
	        --layout=tagged -d+2
}

build() {
    cd "${srcdir}"
    for _arch in "${_architectures[@]}" ; do
        cp -rT "boost_${_boostver}" "build-${_arch}"
        pushd "build-${_arch}"

        _pyver=$(wine /usr/${_arch}/bin/python --version | sed -nr 's/Python ([0-9]\.[0-9])\.[0-9]/\1/p')
        _pyver_nodot=$(echo ${_pyver} | sed -nr 's/([0-9])\.([0-9])/\1\2/p')

	    patch -Np0 -i "${srcdir}/boost-mingw.patch"
	    patch -Np0 -i "${srcdir}/python_jam.patch"

	    cat > user-config.jam << EOF
using gcc : mingw64 :
    /usr/bin/${_arch}-g++ :
	<rc>/usr/bin/${_arch}-windres
	<archiver>/usr/bin/${_arch}-ar
	<root>/usr/${_arch}
;

using python : ${_pyver} : :
    /usr/${_arch}/include/python${_pyver_nodot} :
    /usr/${_arch}/lib
;

EOF

        unset LDFLAGS CPPFLAGS
        eval $(_bjam ${_arch}) linkflags="-L/usr/${_arch}/lib"

        popd
    done
}

package() {
    cd "${srcdir}"
    for _arch in "${_architectures[@]}" ; do
        pushd "build-${_arch}"

        mkdir -p "${pkgdir}/usr/${_arch}/lib"
        cp ./stage/lib/*.a "${pkgdir}/usr/${_arch}/lib/"
        ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
        #${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.dll

        popd
    done
}

