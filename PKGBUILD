#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="Flexible Collision Library. Git version."
url='https://github.com/flexible-collision-library'
pkgname=fcl-git
pkgver=r860.3f3d98a3
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake')
depends=('boost' 'libccd-git')
optdepends=('octomap: collision detection with octrees'
            'tinyxml: support for global penetration depth test'
            'flann: support for fast approximate nearest neighbor searches')
_dir=fcl
source=(
    "$_dir"::'git+https://github.com/flexible-collision-library/fcl.git'#branch=master
    cxx_standard.patch
    gnu13.patch
)
sha256sums=('SKIP' 'SKIP' 'SKIP')
provides=('fcl')
conficts=('fcl')

pkgver() {
    cd "${srcdir}/${_dir}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_dir}"
    patch -p1 -i "${srcdir}/cxx_standard.patch"
    patch -p1 -i "${srcdir}/gnu13.patch"
}

build() {
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build
    cmake ${srcdir}/${_dir} -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF
    make -j`nproc`
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
