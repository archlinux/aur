# Maintainer: Raketenjoint <rak.joint@mailbox.org>
pkgname=espressomd-git
pkgver=3.4.dev.r13633.ff32b09e5
pkgrel=1
pkgdesc="ESPResSo is a software package for performing and analyzing Molecular Dynamics simulations."
arch=('x86_64')
url="http://espressomd.org/wordpress/"
license=('GPL')
groups=()
depends=('python>=3'
         'python-numpy'
         'python-opengl'
         'python-sphinx>=1.6.6'
         'python-sphinx<2.1.0'
         'python-sphinxcontrib-bibtex>=0.3.5'
         'python-mdanalysis>=0.16')
optdepends=('cuda: Build with NVIDIA GPU support'
            'hdf5: File format to store scientific data'
            'hdf5-openmpi: File format to store scientific data (openmpi version)')
makedepends=('git'
             'gcc>=5'
             'boost>=1.67'
             'cmake>=3.4'
             'fftw>=3'
             'openmpi>=1.2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/espressomd/espresso.git")
noextract=()
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    # Use gcc8 to allow the installation to cuda users
    make CXX=g++-8 CC=gcc-8 CPP=g++-8
}

check() {
    cd "$srcdir/${pkgname%-git}"
    make -k check
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}
