# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='humanoid-path-planner'
_pkgname='hpp-fcl'
_pkgver=2.4.0
pkgname=("${_pkgname}-git" "${_pkgname}-git-docs")
pkgver=2.4.0.r2280.6981036f
pkgrel=1
pkgdesc="An extension of the Flexible Collision Library"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD')
depends=('assimp' 'eigenpy' 'octomap' 'qhull' 'python-numpy' 'boost-libs')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'boost' 'git')
conflicts=($_pkgname)
provides=($_pkgname)
source=("git+${url}#branch=fetch-submodule")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo "$_pkgver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cmake -B "build-git" -S "$_pkgname" \
        -DHPP_FCL_HAS_QHULL=ON \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGENERATE_PYTHON_STUBS=ON \
        -DINSTALL_DOCUMENTATION=ON \
        -DBUILD_DOCUMENTATION=ON \
        -Wno-dev
    cmake --build "build-git"
}

check() {
    cmake --build "build-git" -t test
}

package_hpp-fcl-git() {
    DESTDIR="$pkgdir/" cmake --build "build-git" -t install
    rm -rf "$pkgdir/usr/share/doc"
    sed -i 's=;/usr/\.\./include/include==' "$pkgdir/usr/lib/cmake/hpp-fcl/hpp-fclTargets.cmake"
    sed -i '/Boost COMPONENTS/s/python3//' "$pkgdir/usr/lib/cmake/hpp-fcl/hpp-fclConfig.cmake"
    install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_hpp-fcl-git-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-git" -t install
    rm -rf "$pkgdir"/usr/{lib,include,share/{"$_pkgname",ament_index}}
    install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
