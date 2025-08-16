# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=openfhe-development-git
pkgver=1.3.1.r0.g3236208
pkgrel=1
pkgdesc='Open-Source Fully Homomorphic Encryption Library'
arch=('i686' 'x86_64')
url='https://www.openfhe.org/'
license=('BSD')
depends=('gperftools' 'ntl' 'openmp')
makedepends=('cmake' 'git')
provides=("openfhe=${pkgver%.r*}" "openfhe-development=${pkgver%.r*}")
conflicts=('openfhe' 'openfhe-development')
source=("git+https://github.com/openfheorg/openfhe-development.git"
        'cereal::git+https://github.com/openfheorg/cereal.git'
        'google-test::git+https://github.com/google/googletest.git'
        'system-tcmalloc.patch')
sha256sums=('SKIP' 'SKIP' 'SKIP'
            'b84f38e384c8af43d005696aecbc7911314ba9be20a77ecc8cb6bf258a240390')

pkgver() {
    cd ${pkgname%-git}
    git describe --long --tags --abbrev=7 | \
      sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Setting up submodules...'
  git submodule init
  git config submodule.third-party/cereal.url "${srcdir}/cereal"
  git config submodule.third-party/google-test.url "${srcdir}/google-test"
  git -c protocol.file.allow=always submodule update third-party/{cereal,google-test}

  msg2 'Using system tcmalloc...'
  git apply ../system-tcmalloc.patch
}

build() {
  export CXXFLAGS="${CXXFLAGS} -Wno-error=odr"
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_BENCHMARKS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DGIT_SUBMOD_AUTO=OFF \
    -DWITH_COVTEST=OFF \
    -DWITH_NTL=ON \
    -DWITH_TCM=ON \
    -DMATHBACKEND=6

  cmake --build build -t allmodules -j$(nproc)
}

check() {
  # avoid false positive reports from the OpenMP runtime
  export TSAN_OPTIONS='ignore_noninstrumented_modules=1'
  cmake --build build -t testall -j$(nproc)
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${pkgname%-git}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
