pkgname=husky-msged-git
_realpkg=husky
pkgver=r626.22c4c21
pkgrel=1
arch=('x86_64')
license=('GPL')
makedepends=('git')
url="http://husky${_bld_lib}urceforge.net/hpt.html"
pkgdesc="Husky Fido message editor"
conflicts=("husky-git")

source=(
  'hpt::git+https://github.com/huskyproject/hpt.git'
  'huskylib::git+https://github.com/huskyproject/huskylib.git'
  'fidoconf::git+https://github.com/huskyproject/fidoconf.git'
  'smapi::git+https://github.com/huskyproject/smapi.git'
  'hptzip::git+https://github.com/huskyproject/hptzip.git'
  'msged::git+https://github.com/huskyproject/msged.git'
)

_tosserModules="huskylib fidoconf smapi areafix hpt areastat bsopack sqpack nltools hptkill hptsqfix htick"
_prefix=/usr
_wanna_shared=0

pkgver() {
    cd ${srcdir}/msged/
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
    cd "${srcdir}/msged/build-archlinux"
    rm -rf "${pkgdir}/usr/lib/*.a"
    make DESTDIR="$pkgdir" install
}

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
