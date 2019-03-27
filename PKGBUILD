# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=arrayfire
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
url='https://arrayfire.com'
pkgver=3.6.2
arch=('x86_64')
pkgrel=2
license=('BSD')
depends=('cblas' 'fftw' 'boost-libs' 'lapacke' 'forge' 'freeimage' 'glfw' 'glew' 'glbinding')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'boost' 'python' 'ocl-icd' 'cuda' 'git')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'libclc: Required for using OpenCL backend')
options=('!buildflags')
source=("http://arrayfire.com/arrayfire_source/arrayfire-full-${pkgver}.tar.bz2"
        "2365.patch"
        'doc_warn_not_error.patch')
sha512sums=('02fef093eb819b503449812d033695995502f513973f25fa2fee5a904a7198e6191470ccbb7ac1c8281e3b89f61da89e1df7958215b261fc3017f6ab4643ff07'
            'b0bb4b9e5a69c960dbed51838be4855b1eed030a9e68072807685029f0673bcfad8253614d19b2d1ec70a9082a4cf09f84601ebdedf275223cebfac5bd41f9d1'
            '63c745da51347fc94e02b031cb0606216f523acc350866658ebed7ac09115217a934285ecb731391f11c2934984f106564153eaca1b9c6d578db2b0904c0741d')

prepare() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  patch -Np1 -i "${srcdir}"/2365.patch
  patch -Np1 -i "${srcdir}/doc_warn_not_error.patch"

  mkdir -p build
}

build() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  cd build
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib \
      -DAF_USE_SYSTEM_FORGE=ON \
      -DAF_WITH_IMAGEIO=ON \
      -DAF_WITH_GRAPHICS=ON \
      -DAF_BUILD_CPU=ON \
      -DAF_BUILD_OPENCL=ON \
      -DAF_BUILD_NONFREE=ON \
      -DAF_BUILD_EXAMPLES=ON \
      -DAF_BUILD_DOCS=ON \
      -DCUDA_architecture_build_targets="3.0;3.2;3.5;3.7;5.0;5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCUDA_HOST_COMPILER=/usr/bin/gcc

  make
}

check() {
  cd "${srcdir}/arrayfire-full-${pkgver}/build"

  make test
}

package() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  cd build

  make DESTDIR="${pkgdir}/" install
}
