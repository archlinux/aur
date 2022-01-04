basename=libsurvive
pkgname=$basename-git
pkgver=2021.35f40ce
pkgrel=1
pkgdesc="Open-Source tool for working with lighthouse-based tracking data, including support for the HTC Vive, Vive Pro and Valve Index."
arch=(x86_64 i686)
url="https://github.com/cntools/libsurvive"
license=(MIT)
depends=("hidapi" "xr-hardware" "libpcap" "lapacke" "cblas" "zlib" "libusb")
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
  cd $basename
  rm -rf build
  cmake -B build -G Ninja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  ninja -C build
}

package() {
  cd $basename
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
