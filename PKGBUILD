# Maintainer: Hairy <renhongxu0820@hotmail.com>
pkgname=abacus-lts
pkgver=3.10.1
pkgrel=1
pkgdesc="Atomic-orbital Based Ab-initio Computation at UStc"
arch=('x86_64')
url="https://github.com/deepmodeling/abacus-develop"
license=('LGPL-3.0')
depends=(
    'blas'          
    'lapack'      
    'fftw'              
    'openmpi'       
    'cereal' 
    'scalapack' 
)
makedepends=(
    'cmake'
    'make'
    'gcc'
    'git'
)
optdepends=(
    'elpa' 
    'libxc' 
)
source=(
    "git+https://github.com/deepmodeling/abacus-develop.git"
)
sha256sums=('SKIP')
_gitdir=("abacus-develop")

build() {
    cd "$srcdir/$_gitdir"
    git checkout LTS
    
    mkdir -p build && cd build

    if pacman -Qs '^elpa$' > /dev/null; then
        echo "ELPA found, enabling ELPA support"
        use_elpa=ON
    else
        use_elpa=OFF
    fi

    if pkg-config --exists libxc; then
        echo "libxc found, enabling libxc support"
        use_libxc=ON
    elif pacman -Qs '^libxc$' > /dev/null; then
        echo "libxc found, enabling libxc support"
        use_libxc=ON
    else
        use_libxc=OFF
    fi
    
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_LIBRI=ON \
        -DENABLE_LIBXC=$use_libxc \
        -DUSE_ELPA=$use_elpa \
    
    make -j$(nproc) 
}

package() {
    cd "$srcdir/abacus-develop/build"
    make DESTDIR="$pkgdir/" install
}
