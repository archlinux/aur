# Maintainer: jonleithe
pkgname=unitfy
pkgver=1.0.2
pkgrel=5
pkgdesc="Command-line unit conversion utility (temperature, length, volume, pressure)"
arch=('x86_64')
url="https://github.com/jonleithe/unitfy"
license=('MIT')
depends=('readline' 'gcc-libs')
makedepends=('cmake' 'ninja' 'gcc')
_commit='e7f2478211428085b10acc5c0f1f50a0209c2784'
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('f5db57849915cb7c21addcc04c47d8d9797ccca5dc80cecb8f2bbd661f68d651')

build() {
    cmake \
        -S "$pkgname-$_commit" \
        -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUNITFY_PKGREL="$pkgrel" \
        -DBUILD_TESTING=OFF
    cmake --build build
}

check() {
    cmake \
        -S "$pkgname-$_commit" \
        -B build-test \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUNITFY_PKGREL="$pkgrel" \
        -DBUILD_TESTING=ON
    cmake --build build-test
    ctest --test-dir build-test --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$pkgname-$_commit/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    ln -sf unitfy "$pkgdir/usr/bin/uc"
}
