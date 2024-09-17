# Maintainer: Renato Caldas <renato@calgera.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname='dolfinx-git'
pkgdesc='Next generation FEniCS problem solving environment'
pkgver=0.9.0.dev0_r27933.de18733
pkgrel=1
arch=('x86_64')
url='https://fenicsproject.org'
license=('MIT')
depends=('basix-git' 'boost-libs' 'petsc' 'pugixml' 'hdf5-openmpi' 'adios2' 'scotch' 'parmetis')
makedepends=('git' 'cmake' 'chrpath' 'python-fenics-ffcx-git')
optdepends=()
provides=('dolfinx')
conflicts=('dolfinx')
source=("git+https://github.com/FEniCS/dolfinx")
sha512sums=('SKIP')

pkgver()  {
    cd "$srcdir/dolfinx"
    # The main repo unfortunately has no meaningful tags..
    printf "%s_r%s.%s" "$(sed -n -e 's/^version *= \"*\(.*\)\"/\1/p' python/pyproject.toml)" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    git -C "${srcdir}/dolfinx" clean -dfx
}

build() {
    cd "$srcdir/dolfinx"
    source /etc/profile.d/petsc.sh

    # Build c++ library
    cmake -DCMAKE_BUILD_TYPE="Release" \
        -S cpp \
        -B build \
        -DBUILD_SHARED_LIBS=TRUE \
        -DCMAKE_CXX_STANDARD=20 \
        -DCMAKE_C_COMPILER=gcc \
        -DCMAKE_CXX_COMPILER=g++ \
        -DDOLFINX_ENABLE_ADIOS2=ON \
        -DDOLFINX_ENABLE_PARMETIS=ON \
        -DDOLFINX_ENABLE_SCOTCH=ON \
        -DDOLFINX_ENABLE_SLEPC=OFF \
        -DDOLFINX_ENABLE_KAHIP=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    cd "$srcdir/dolfinx"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/dolfinx-git/LICENSE"

    # Remove insecure runpath
    chrpath --delete "$pkgdir/usr/lib/libdolfinx.so"
}
