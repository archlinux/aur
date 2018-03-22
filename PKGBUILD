# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=pyca
pkgname=python2-pyca-git
pkgver=0.01.r434.gf31ab43
pkgrel=1
pkgdesc="Python for Computational Anatomy"
arch=('x86_64')
url="http://bitbucket.org/scicompanat/pyca"
license=('BSD')
depends=('python2-numpy')
makedepends=('cmake' 'git' 'python2' 'swig>=3.0.10' 'fftw' 'boost')
optdepends=('insight-toolkit: ITK file support'
            'cuda: for GPU computing'
            'python2-matplotlib: for full functionality in PyCA.Display and reading/writing png images'
            'python2-scipy: some additional image/linear algebra functionality')
source=('git+https://bitbucket.org/scicompanat/pyca.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_name"
    git describe --long --tags | \
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_name"

    mkdir build || :
    cd build

	# temporary bugfix, a PR has already been submitted upstream
	sed -i 's/<< std::cout <</<</g' "$srcdir/$_name/Code/Cxx/src/alg/MultiscaleManager.cxx"

    cmake -D CMAKE_BUILD_TYPE=Release \
        -D PYTHON_EXECUTABLE=/usr/bin/python2 \
        -D PYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -D BUILD_SHARED_LIBS=ON \
        -D USE_ITK=OFF \
        -D CUDA_ENABLED=OFF \
        -D PYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -D PYTHON_INSTALL_DIR=/usr/lib/python2.7/site-packages \
        -D CUDA_NVCC_FLAGS_RELEASE=--pre-include\ $srcdir/$_gitname/preinc.h \
		..
}

build() {
    cd "$srcdir/$_name/build"
    make
}

package() {
    cd "$srcdir/$_name/build"
    make install DESTDIR="$pkgdir"

	install -D -m644 $srcdir/$_name/Copyright.txt \
                     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

