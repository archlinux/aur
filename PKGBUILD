basename=libsurvive
pkgname=$basename-git
pkgver=1396.0d06d9a
pkgrel=1
pkgdesc="Open-Source tool for working with lighthouse-based tracking data, including support for the HTC Vive, Vive Pro and Valve Index."
arch=(x86_64 i686)
url="https://github.com/cntools/libsurvive"
license=(MIT)
depends=("hidapi" "xr-hardware")
conflicts=($basename)
provides=($basename)
makedepends=("cmake" "ninja")
source=($basename::"git+https://github.com/cntools/libsurvive.git"
        "0001-add-pkg-config-file.patch"
        "0002-install-redist-headers.patch")
sha256sums=('SKIP'
            '607becf44993ea872e4777e8127cd8c5ded706f43b6e2f4db77b02cccf463909'
            'fa18552e1ffa684c51a0cd057070888094d7c38b0841dbb59067a52f06ec6fe3')

pkgver() {
  cd $basename
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $revision.$hash
}

prepare() {
  cd $basename
  git apply "$srcdir"/0001-add-pkg-config-file.patch
  git apply "$srcdir"/0002-install-redist-headers.patch
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
