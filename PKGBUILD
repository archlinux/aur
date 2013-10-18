# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=rbdl-hg
_name=rbdl
pkgrel=1
pkgver=574.10633e9d9e84
pkgver() {
    cd ${_name}
    echo $(hg identify -n).$(hg identify -i)
}
pkgdesc="RBDL - Rigid Body Dynamics Library. Mercurial version."
url="http://rbdl.bitbucket.org"
arch=('x86_64' 'i686')
license=('GPLv3')
makedepends=('cmake' 'eigen3' 'mercurial')
optdepends=('lua51: Lua model add-on'
            'unittestpp: unit tests')
provides=('rbdl')
conflicts=('rbdl')
source=("${_name}::hg+https://bitbucket.org/rbdl/rbdl")
sha1sums=('SKIP')

# TODO:
#  - urdfreader support (depends on ROS)
_has_lua=OFF
_has_unittestpp=OFF
_has_rosurdf=OFF
_lua_param=""
_unittestpp_param=""
_rosurdf_param=""

check_optdepends() {
    # Check if lua is installed
    if (pacman -Q lua51 >/dev/null) ; then
        _has_lua=ON
        _lua_param="-DBUILD_ADDON_LUAMODEL=ON -DLUA_LIBRARIES=lua5.1 -DLUA_INCLUDE_DIR=/usr/include/lua5.1"
    fi

    # Check if UnitTest++ is installed
    if (pacman -Q unittestpp >/dev/null) ; then
        _has_unittestpp=ON
        _unittestcpp_param="-DBUILD_TESTS=ON"
    fi
}


build() {
    # Check optional dependencies
    check_optdepends

    mkdir -p build
    cd build

    cmake ../${_name} -DCMAKE_INSTALL_PREFIX=/usr \
                      -DCMAKE_BUILD_TYPE=Release \
                      -DBUILD_ADDON_BENCHMARK=ON \
                      ${_lua_param} ${_unittestpp_param} ${_rosurdf_param}

    make
}

check() {
    if [ ${_has_unittestpp} = ON ]; then
        cd build
        ./tests/runtests
    fi
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}

