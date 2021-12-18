pkgname=husky-git
_realpkg=husky
pkgver=r3389.852e02a5
pkgrel=1
arch=('x86_64')
license=('GPL')
makedepends=('git')
url="http://husky${_bld_lib}urceforge.net/hpt.html"
pkgdesc="Husky Fido Tosser hpt: Complete bundle"
provides=("husky-tosser-git" "husky-msged-git")
conflicts=("husky-tosser-git" "husky-msged-git")

source=(
  'bsopack.cmake' 'bsopack.patch'
  'hpt::git+https://github.com/huskyproject/hpt.git'
  'huskylib::git+https://github.com/huskyproject/huskylib.git'
  'fidoconf::git+https://github.com/huskyproject/fidoconf.git'
  'smapi::git+https://github.com/huskyproject/smapi.git'
  'areastat::git+https://github.com/huskyproject/areastat.git'
  'areafix::git+https://github.com/huskyproject/areafix.git'
  'bsopack::git+https://github.com/huskyproject/bsopack.git'
  'sqpack::git+https://github.com/huskyproject/sqpack.git'
  'nltools::git+https://github.com/huskyproject/nltools.git'
  'hptkill::git+https://github.com/huskyproject/hptkill.git'
  'hptzip::git+https://github.com/huskyproject/hptzip.git'
  'hpt::git+https://github.com/huskyproject/hpt.git'
  'htick::git+https://github.com/huskyproject/htick.git'
  'hptsqfix::git+https://github.com/huskyproject/hptsqfix.git'
  'msged::git+https://github.com/huskyproject/msged.git'
)

_tosserModules="huskylib fidoconf smapi areafix hpt areastat bsopack sqpack nltools hptkill hptsqfix htick"
_prefix=/usr
# Coz libperl linking fails in dynamic mode :(
_wanna_shared=0

pkgver() {
    cd ${srcdir}/hpt/
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    cd ..
}

build() {
    if [[ _wanna_shared -eq 0 ]]; then
        local _bld_shared=OFF
        local _bld_lib=".a"
    else
        local _bld_shared=ON
        local _bld_lib=".so"
    fi
    echo "char cvs_date[]=\"archlinux-git\";" > "cvsdate.h"


    echo "BUILDING husky"
    pushd huskylib
    cp ../cvsdate.h ./
    rm -rf build-archlinux
    cmake  -Bbuild-archlinux \
        -DBUILD_SHARED_LIBS=${_bld_shared} \
        -DCMAKE_INSTALL_PREFIX:PATH=${_prefix} \
        -DCMAKE_FIND_ROOT_PATH=../
    cmake --build build-archlinux
    popd

    echo "BUILDING smapi"
    pushd "smapi"
    rm -rf huskylib
    ln -s "../huskylib/huskylib" huskylib
    cp ../cvsdate.h ./
    rm -rf build-archlinux
    cmake \
        -Bbuild-archlinux -DBUILD_SHARED_LIBS=${_bld_shared} \
        -Dhusky_LIB="../huskylib/build-archlinux" \
        -DCMAKE_INSTALL_PREFIX:PATH=${_prefix} \
        -DCMAKE_INCLUDE_PATH:PATH=../huskylib
    cmake --build build-archlinux
    popd

    echo "BUILDING fidoconf"
    pushd "fidoconf"
    rm -rf huskylib smapi
    ln -s "../huskylib/huskylib" huskylib
    ln -s "../smapi/smapi" smapi
    cp ../cvsdate.h ./
    rm -rf build-archlinux
    cmake \
        -Bbuild-archlinux \
        -DBUILD_SHARED_LIBS=${_bld_shared} \
        -Dhusky_LIB="../huskylib/build-archlinux/libhusky${_bld_lib}" \
        -Dsmapi_LIB="../smapi/build-archlinux/libsmapi${_bld_lib}" \
        -DCMAKE_INSTALL_PREFIX:PATH=${_prefix}
    cmake --build build-archlinux
    popd

    echo "BUILDING areafix"
    pushd "areafix"
    rm -rf build-archlinux
    rm -rf huskylib smapi fidoconf
    ln -s "../huskylib/huskylib" huskylib
    ln -s "../smapi/smapi" smapi
    ln -s "../fidoconf/fidoconf" fidoconf
    cp ../cvsdate.h ./
    cmake \
        -Bbuild-archlinux \
        -DBUILD_SHARED_LIBS=${_bld_shared} \
        -Dhusky_LIB="../huskylib/huskylib" \
        -Dsmapi_LIB="../smapi/smapi" \
        -Dfidoconfig_LIB="../fidoconf/fidoconf" \
        -DCMAKE_INSTALL_PREFIX:PATH=${_prefix}
    cmake --build build-archlinux
    popd

    echo "BUILDING hptzip"
    pushd "hptzip"
    rm -rf build-archlinux
    rm -rf huskylib smapi fidoconf
    ln -s "../huskylib/huskylib" huskylib
    cp ../cvsdate.h ./
    cmake \
        -Bbuild-archlinux \
        -DBUILD_SHARED_LIBS=${_bld_shared} \
        -Dhusky_LIB="../huskylib/build-archlinux/libhusky${_bld_lib}" \
        -DCMAKE_INSTALL_PREFIX:PATH=${_prefix}
    cd build-archlinux
    make
    cd ..
    popd

    echo "BUILDING hpt"
    pushd "hpt"
    rm -rf build-archlinux
    rm -rf huskylib smapi fidoconf hptzip areafix
    ln -s "../huskylib/huskylib" huskylib
    ln -s "../smapi/smapi" smapi
    ln -s "../fidoconf/fidoconf" fidoconf
    ln -s "../hptzip/hptzip" hptzip
    ln -s "../areafix/areafix" areafix
    cp ../cvsdate.h ./
    cmake \
        -Bbuild-archlinux \
        -DBUILD_SHARED_LIBS=${_bld_shared} \
        -Dhptzip_LIB="../hptzip/build-archlinux/libhptzip${_bld_lib}" \
        -Dhusky_LIB="../huskylib/build-archlinux/libhusky${_bld_lib}" \
        -Dsmapi_LIB="../smapi/build-archlinux/libsmapi${_bld_lib}" \
        -Dfidoconfig_LIB="../fidoconf/build-archlinux/libfidoconfig${_bld_lib}" \
        -Dareafix_LIB="../areafix/build-archlinux/libareafix${_bld_lib}" \
        -DCMAKE_INSTALL_PREFIX:PATH=${_prefix}
    cd build-archlinux
    make
    cd ..
    popd

    echo "BUILDING areastat"
    pushd areastat
    rm -rf build-archlinux
    cp ../cvsdate.h ./
    rm -rf huskylib smapi fidoconf
    ln -s "../huskylib/huskylib" huskylib
    ln -s "../smapi/smapi" smapi
    ln -s "../fidoconf/fidoconf" fidoconf
    cp ../cvsdate.h ./
    cmake \
        -Bbuild-archlinux \
        -DBUILD_SHARED_LIBS=${_bld_shared} \
        -Dhusky_LIB="../huskylib/build-archlinux/libhusky${_bld_lib}" \
        -Dsmapi_LIB="../smapi/build-archlinux/libsmapi${_bld_lib}" \
        -DCMAKE_INSTALL_PREFIX:PATH=${_prefix}
    cmake --build build-archlinux
    popd

    echo "BUILDING hptsqfix"
    pushd hptsqfix
    rm -rf build-archlinux
    cp ../cvsdate.h ./
    cp ../cvsdate.h ./h/
    rm -rf huskylib smapi fidoconf
    ln -s "../huskylib/huskylib" huskylib
    ln -s "../smapi/smapi" smapi
    ln -s "../fidoconf/fidoconf" fidoconf
    cp ../cvsdate.h ./
    cmake \
        -Bbuild-archlinux \
        -DBUILD_SHARED_LIBS=${_bld_shared} \
        -Dhusky_LIB="../huskylib/build-archlinux/libhusky${_bld_lib}" \
        -Dfidoconfig_LIB="../fidoconf/build-archlinux/libfidoconfig${_bld_lib}" \
        -Dsmapi_LIB="../smapi/build-archlinux/libsmapi${_bld_lib}" \
        -DCMAKE_INSTALL_PREFIX:PATH=${_prefix}
    cmake --build build-archlinux
    popd

    echo "BUILDING htick"
    pushd htick
    rm -rf build-archlinux
    cp ../cvsdate.h ./
    rm -rf huskylib smapi fidoconf hptzip areafix
    ln -s "../huskylib/huskylib" huskylib
    ln -s "../smapi/smapi" smapi
    ln -s "../fidoconf/fidoconf" fidoconf
    ln -s "../hptzip/hptzip" hptzip
    ln -s "../areafix/areafix" areafix
    cp ../cvsdate.h ./
    cmake \
        -Bbuild-archlinux \
        -DBUILD_SHARED_LIBS=${_bld_shared} \
        -Dhusky_LIB="../huskylib/build-archlinux/libhusky${_bld_lib}" \
        -Dfidoconfig_LIB="../fidoconf/build-archlinux/libfidoconfig${_bld_lib}" \
        -Dsmapi_LIB="../smapi/build-archlinux/libsmapi${_bld_lib}" \
        -Dareafix_LIB="../areafix/build-archlinux/libareafix${_bld_lib}" \
        -DCMAKE_INSTALL_PREFIX:PATH=${_prefix}
    cmake --build build-archlinux
    popd

    echo "BUILDING hptkill"
    pushd hptkill
    rm -rf build-archlinux
    cp ../cvsdate.h ./
    rm -rf huskylib smapi fidoconf hptzip
    ln -s "../huskylib/huskylib" huskylib
    ln -s "../smapi/smapi" smapi
    ln -s "../fidoconf/fidoconf" fidoconf
    ln -s "../hptzip/hptzip" hptzip
    cp ../cvsdate.h ./
    cmake \
        -Bbuild-archlinux \
        -DBUILD_SHARED_LIBS=${_bld_shared} \
        -Dhusky_LIB="../huskylib/build-archlinux/libhusky${_bld_lib}" \
        -Dfidoconfig_LIB="../fidoconf/build-archlinux/libfidoconfig${_bld_lib}" \
        -Dsmapi_LIB="../smapi/build-archlinux/libsmapi${_bld_lib}" \
        -DCMAKE_INSTALL_PREFIX:PATH=${_prefix}
    cmake --build build-archlinux
    popd

    echo "BUILDING nltools"
    pushd nltools
    rm -rf build-archlinux
    cp ../cvsdate.h ./
    cp ../cvsdate.h ./h
    rm -rf huskylib smapi fidoconf hptzip
    ln -s "../huskylib/huskylib" huskylib
    ln -s "../smapi/smapi" smapi
    ln -s "../fidoconf/fidoconf" fidoconf
    ln -s "../hptzip/hptzip" hptzip
    cp ../cvsdate.h ./
    cmake \
        -Bbuild-archlinux \
        -DBUILD_SHARED_LIBS=${_bld_shared} \
        -Dhptzip_LIB="../hptzip/build-archlinux/libhptzip${_bld_lib}" \
        -Dhusky_LIB="../huskylib/build-archlinux/libhusky${_bld_lib}" \
        -Dfidoconfig_LIB="../fidoconf/build-archlinux/libfidoconfig${_bld_lib}" \
        -Dsmapi_LIB="../smapi/build-archlinux/libsmapi${_bld_lib}" \
        -DCMAKE_INSTALL_PREFIX:PATH=${_prefix}
    cmake --build build-archlinux
    popd

    echo "BUILDING sqpack"
    pushd sqpack
    rm -rf build-archlinux
    rm -rf huskylib smapi fidoconf hptzip
    ln -s "../huskylib/huskylib" huskylib
    ln -s "../smapi/smapi" smapi
    ln -s "../fidoconf/fidoconf" fidoconf
    ln -s "../hptzip/hptzip" hptzip
    cp ../cvsdate.h ./
    cmake \
        -Bbuild-archlinux \
        -DBUILD_SHARED_LIBS=${_bld_shared} \
        -Dhptzip_LIB="../hptzip/build-archlinux/libhptzip${_bld_lib}" \
        -Dhusky_LIB="../huskylib/build-archlinux/libhusky${_bld_lib}" \
        -Dfidoconfig_LIB="../fidoconf/build-archlinux/libfidoconfig${_bld_lib}" \
        -Dsmapi_LIB="../smapi/build-archlinux/libsmapi${_bld_lib}" \
        -DCMAKE_INSTALL_PREFIX:PATH=${_prefix}
    cmake --build build-archlinux
    popd


    echo "BUILDING bsopack"
    cp bsopack.cmake bsopack/CMakeLists.txt
    pushd bsopack
    patch -p1 -i ../bsopack.patch
    cp ../cvsdate.h ./
    rm -rf build-archlinux
    cmake \
        -Bbuild-archlinux \
        -DBUILD_SHARED_LIBS=${_bld_shared} \
        -Dhusky_LIB="../huskylib/build-archlinux/libhusky${_bld_lib}" \
        -Dfidoconfig_LIB="../fidoconf/build-archlinux/libfidoconfig${_bld_lib}" \
        -Dsmapi_LIB="../smapi/build-archlinux/libsmapi${_bld_lib}" \
        -DCMAKE_INSTALL_PREFIX:PATH=${_prefix}
    cmake --build build-archlinux
    popd


    echo "BUILDING msged"
    pushd msged
    rm -rf build-archlinux
    rm -rf huskylib smapi fidoconf hptzip
    ln -s "../huskylib/huskylib" huskylib
    ln -s "../smapi/smapi" smapi
    ln -s "../fidoconf/fidoconf" fidoconf
    ln -s "../hptzip/hptzip" hptzip
    cp ../cvsdate.h ./
    cmake \
        -Bbuild-archlinux \
        -DBUILD_SHARED_LIBS=OFF \
        -Dcurses_LIB="/usr/lib/libcursesw.so" \
        -Dhptzip_LIB="../hptzip/build-archlinux/libhptzip${_bld_lib}" \
        -Dhusky_LIB="../huskylib/build-archlinux/libhusky${_bld_lib}" \
        -Dfidoconfig_LIB="../fidoconf/build-archlinux/libfidoconfig${_bld_lib}" \
        -Dsmapi_LIB="../smapi/build-archlinux/libsmapi${_bld_lib}" \
        -DCMAKE_INSTALL_PREFIX:PATH=${_prefix}
    cmake --build build-archlinux
    popd
}

package() {
    for i in $_tosserModules; do
        cd "${srcdir}/${i}/build-archlinux"
        make DESTDIR="$pkgdir" install
    done
    cd "${srcdir}/msged/build-archlinux"
    make DESTDIR="$pkgdir" install
    rm -rf ${pkgdir}/usr/lib/*.a
}
sha256sums=('73a603d930e184a1d094f53311916b4f8dcd8f7c31ea3373e236e797a3341a15'
            'c5bb6b91f34b23cb1d2f9cff5d8d0956ce372cca3b602ada87ff3b4375498ea7'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
