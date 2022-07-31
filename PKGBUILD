# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgbase=ctranslate2-git
pkgname=(ctranslate2-git
         python-ctranslate2-git)
pkgver=1703.77a48d43
pkgrel=1
pkgdesc='Fast inference engine for OpenNMT models'
arch=('x86_64' 'i686')
url='https://github.com/OpenNMT/ctranslate2'
license=('GPL3')
makedepends=('git' 'cmake' 'pybind11')
conflicts=(ctranslate2)
provides=(ctranslate2)
source=('git+https://github.com/OpenNMT/ctranslate2.git'

        'git+https://github.com/jarro2783/cxxopts.git'
        'git+https://github.com/NVlabs/cub.git'
        'git+https://github.com/thrust/thrust.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/google/cpu_features.git'
)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         )

pkgver() {
    cd ctranslate2
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p ${srcdir}/ctranslate2/build
    cd ctranslate2
#    git checkout master
#    git pull origin
#    git submodule update --init --recursive
    git submodule init
    git config submodule.third_party/cxxopts.url "$srcdir/cxxopts"
    git config submodule.third_party/cub.url "$srcdir/cub"
    git config submodule.third_party/thrust.url "$srcdir/thrust"
    git config submodule.third_party/googletest.url "$srcdir/googletest"
    git config submodule.third_party/cpu_features.url "$srcdir/cpu_features"
    git submodule update
   }

build() {
    cd ${srcdir}/ctranslate2/build
    # CPU dispatch breaks with multiple definitions blah blah
    cmake ../ \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_MKL=False \
        -DENABLE_CPU_DISPATCH=False \
        -DOPENMP_RUNTIME=COMP \
        -DCMAKE_CXX_FLAGS="-L../build ${CXXFLAGS}"

    # Not enabled/added as deps:
    #   WITH_MKL (seems to be incompatible with my version, at least)
    #   WITH_DNNL
    #   WITH_OPENBLAS
    #   WITH_CUDA

    make
    cd ../python
    CTRANSLATE2_ROOT=.. LIBRARY_PATH=../build/ python ../python/setup.py build
}


package_ctranslate2-git() {
    cd ${srcdir}/build
    make DESTDIR="$pkgdir" install
}

package_python-ctranslate2-git() {
  depends=(ctranslate2-git)
  conflicts=()
  provides=()
  cd ${srcdir}/ctranslate2/python
  python setup.py install --root="$pkgdir" --optimize=1
}
