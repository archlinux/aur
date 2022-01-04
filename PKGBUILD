basename=libsurvive
pkgname=$basename-git
pkgver=2023.feca145
pkgrel=1
pkgdesc="Open-Source tool for working with lighthouse-based tracking data, including support for the HTC Vive, Vive Pro and Valve Index."
arch=(x86_64 i686)
url="https://github.com/cntools/libsurvive"
license=(MIT)
depends=("hidapi" "xr-hardware" "libpcap" "zlib" "libusb" "eigen") # "lapacke" "cblas" "blas"
conflicts=($basename)
provides=($basename)
makedepends=("git" "cmake" "ninja")
source=($basename::"git+https://github.com/cntools/libsurvive.git"
        cnkalman.git::"git+https://github.com/cntools/cnkalman.git"
	cnmatrix.git::"git+https://github.com/cntools/cnmatrix.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $basename
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $revision.$hash
}

prepare() {
  cd $basename
  git submodule update --init --recursive
  sed "s!cnmatrix/matrix.h!cnmatrix/cn_matrix.h!g" -i tools/vive_mouse/vive_mouse.c
}

build() {
  # HACK: possible issue with -O flags and second index controller not being detected, seems to be better with only survive's own cflags
  unset CFLAGS CXXFLAG

  cd $basename
  rm -rf build

  # there is an openblas issue that causes high cpu usage unless OPENBLAS_NUM_THREADS=0 is set.
  # works with lapack reference blas but its use is discouraged as it's not tuned.
  # -DUSE_EIGEN=ON disables the use of blas in favor of libsurvive's own single threaded matrix math using eigen.
  # This will probably require slightly more cpu power than a tuned blas implementation.
  # If running on a weak CPU, consider installing a blas implementation and using -DUSE_EIGEN=OFF.

  cmake -B build -G Ninja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DUSE_EIGEN=ON
  ninja -C build
}

package() {
  cd $basename
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
