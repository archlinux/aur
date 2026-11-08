# Maintainer: faywong
pkgname=kenlm-shared
pkgver=0.3.0.r20261108
pkgrel=1
pkgdesc='KenLM language model runtime with shared libraries'
arch=('x86_64')
url='https://kheafield.com/code/kenlm/'
license=('LGPL-2.1-or-later')
depends=('gcc-libs' 'glibc' 'boost-libs' 'zlib' 'bzip2' 'xz')
makedepends=('cmake' 'ninja' 'boost')
provides=('kenlm')
conflicts=('kenlm')
_commit=4cb443e60b7bf2c0ddf3c745378f76cb59e254e5
source=("kenlm-${_commit}.tar.gz::https://github.com/kpu/kenlm/archive/${_commit}.tar.gz")
sha256sums=('11df4f929b175f0b3bd26be7a5a83b3c17cdefa83baecab0b6e69f77430184ea')

prepare() {
    # Boost.System has been header-only since Boost 1.69; current Arch Boost
    # does not ship a separate boost_system CMake component anymore.
    sed -i '/^[[:space:]]*system[[:space:]]*$/d' "kenlm-${_commit}/CMakeLists.txt"
}
build() {
    cmake -S "kenlm-${_commit}" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_SHARED_LIBS=ON \
        -DENABLE_PYTHON=OFF -DENABLE_INTERPOLATE=OFF -DCOMPILE_TESTS=OFF
    cmake --build build -j4
}
package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "kenlm-${_commit}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m644 "kenlm-${_commit}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -m644 "kenlm-${_commit}/COPYING.3" "$pkgdir/usr/share/licenses/$pkgname/COPYING.3"
    install -m644 "kenlm-${_commit}/COPYING.LESSER.3" "$pkgdir/usr/share/licenses/$pkgname/COPYING.LESSER.3"
}
