basename=libsurvive
pkgname=$basename-git
pkgver=1400.e2a2e50
pkgrel=1
pkgdesc="Open-Source tool for working with lighthouse-based tracking data, including support for the HTC Vive, Vive Pro and Valve Index."
arch=(x86_64 i686)
url="https://github.com/cntools/libsurvive"
license=(MIT)
depends=("hidapi" "xr-hardware" "libpcap" "lapacke" "cblas" "zlib")
conflicts=($basename)
provides=($basename)
makedepends=("git" "cmake" "ninja")
source=($basename::"git+https://github.com/cntools/libsurvive.git")
sha256sums=('SKIP')

pkgver() {
  cd $basename
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $revision.$hash
}

prepare() {
  cd $basename
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
