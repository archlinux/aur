basename=libsurvive
pkgname=$basename-usehidapi-git
pkgver=2386.2f4303c
pkgrel=1
pkgdesc="Open-Source tool for working with lighthouse-based tracking data, including support for the HTC Vive, Vive Pro and Valve Index. Built with USE_HIDAPI=1."
arch=(x86_64 i686)
url="https://github.com/cntools/libsurvive"
license=(MIT)
depends=("hidapi" "xr-hardware" "libpcap" "zlib" "libusb" "eigen") # "lapacke" "cblas" "blas"
conflicts=($basename $basename-git)
provides=($basename)
makedepends=("git" "cmake" "ninja")
source=($basename::"git+https://github.com/collabora/libsurvive.git")
sha256sums=('SKIP')

pkgver() {
  cd $basename
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $revision.$hash
}

prepare() {
  cd "$srcdir"/$basename

  sed "s!cnmatrix/matrix.h!cnmatrix/cn_matrix.h!g" -i tools/vive_mouse/vive_mouse.c
  git revert --no-commit 84423daf44b430f8ec12e7650f46027070d7df73
}

build() {
  cd $basename
  rm -rf build

  # there is an openblas issue that causes high cpu usage unless OPENBLAS_NUM_THREADS=0 is set.
  # works with lapack reference blas but its use is discouraged as it's not tuned.
  # -DUSE_EIGEN=ON disables the use of blas in favor of libsurvive's own single threaded matrix math using eigen.
  # This will probably require slightly more cpu power than a tuned blas implementation.
  # If running on a weak CPU, consider installing a blas implementation and using -DUSE_EIGEN=OFF.

  cmake -B build -G Ninja -DUSE_HIDAPI=1 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DUSE_EIGEN=ON -DCMAKE_BUILD_TYPE=Release
  ninja -C build
}

package() {
  cd $basename
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -f "${pkgdir}/usr/lib/pkgconfig/cnkalman.pc" "${pkgdir}/usr/lib/pkgconfig/cnmatrix.pc" "${pkgdir}/usr/lib/libcnkalman.a" "${pkgdir}/usr/lib/libcnmatrix.a" "${pkgdir}/usr/lib/libmpfit.a"
  mv "${pkgdir}/usr/include/cnmatrix" "${pkgdir}/usr/include/libsurvive/redist"
  mv "${pkgdir}/usr/include/cnkalman" "${pkgdir}/usr/include/libsurvive/redist"
}
