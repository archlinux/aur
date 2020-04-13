# Maintainer: Martin Drawitsch <martin dot drawitsch at gmail dot com>

pkgname=rbdl-git
_name=rbdl-orb
pkgrel=1
pkgver=3.0.0+5.g4e36ba8
pkgdesc="RBDL - Rigid Body Dynamics Library. Git version."
url="https://github.com/ORB-HD/rbdl-orb"
arch=('x86_64')
license=('zlib')
makedepends=('cmake' 'eigen3' 'git'
             'lua51'
             'python' 'cython' 'python-numpy')
optdepends=('lua51: Lua model add-on'
            'python: Python wrapper'
            'cython: Python wrapper'
            'python-numpy: Python wrapper'
            'python-scipy: Python wrapper')
provides=('rbdl')
conflicts=('rbdl' 'rbdl-hg')
source=("git+https://github.com/ORB-HD/rbdl-orb.git")
sha1sums=('SKIP')

pkgver() {
    cd ${_name}
    git describe --always --dirty --tags | sed "s/^v//;s/-/+/;s/-/./g"
}

build() {
    mkdir -p build
    cd build
    cmake ../${_name} -DCMAKE_INSTALL_PREFIX=/usr \
                      -DRBDL_BUILD_ADDON_LUAMODEL=ON \
                      -DLUA_LIBRARIES=lua5.1 \
                      -DLUA_INCLUDE_DIR=/usr/include/lua5.1 \
                      -DRBDL_BUILD_PYTHON_WRAPPER=ON
    make
}

package() {
    cd build
    make DESTDIR=${pkgdir} install
    cd python
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
