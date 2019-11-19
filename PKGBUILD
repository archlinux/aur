# Maintainer: Morris Hafner <hafnermorris at gmail dot com>

pkgname=('sycl-info-git' 'target-selector-git')
pkgbase=sycl-info-git
pkgver=r3.416b7db
pkgrel=1
epoch=0
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/codeplaysoftware/sycl-info"
license=('Apache-2.0')
groups=('sycl')
makedepends=('ocl-icd' 'opencl-headers' 'nlohmann-json' 'ruby-ronn' 'cmake' 'ninja')
checkdepends=('doctest')
source=(
  'sycl-info::git+https://github.com/codeplaysoftware/sycl-info.git#branch=master'
  'https://github.com/bfgroup/Lyra/archive/1.1.tar.gz'
)
sha256sums=(
  'SKIP'
  'c2d70a926f698fb7decb99c7215bb55ab770100f9574c290998bf91416bd8217'
)

pkgver() {
  cd "sycl-info/sycl-info"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build

    mkdir -p build/lyra/include
    cp -r $srcdir/Lyra-1.1/include/lyra build/lyra/include
}

build() {
    cd build
    cmake -DBUILD_DOCS=ON \
          -DBUILD_SHARED_LIBS=ON \
          -DBUILD_TESTING=OFF \
          -DLyra_ROOT=lyra \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -GNinja \
          ../sycl-info
    cmake --build .
}

check() {
    cd build
    ctest .
}

package_sycl-info-git() {
    pkgdesc="Prints metadata about available SYCL implementations"
    depends=('target-selector')
    optdepends=('computecpp' 'trisycl-git' 'hipsycl-git')

    install -Dm 0644 "$srcdir/sycl-info/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
    DESTDIR="$pkgdir/" cmake --install build --component sycl-info-base
    DESTDIR="$pkgdir/" cmake --install build --component sycl-info-devel
}

package_target-selector-git() {
    pkgdesc="SYCL target selector"
    depends=('ocl-icd')

    install -Dm 0644 "$srcdir/sycl-info/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
    DESTDIR="$pkgdir/" cmake --install build --component target-selector-base
    DESTDIR="$pkgdir/" cmake --install build --component target-selector-devel
}

