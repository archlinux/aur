# Maintainer: Marc Tiehuis <marctiehuis@gmail.com>

pkgname=zig
pkgver=0.4.0
pkgrel=1
pkgdesc='a programming language prioritizing robustness, optimality, and maintainability'
arch=('x86_64')
url='https://ziglang.org/'
license=('MIT')
depends=('clang' 'llvm')
makedepends=('cmake' 'git')
source=("https://ziglang.org/download/$pkgver/zig-$pkgver.tar.xz" 'force_dynamic_llvm.patch' 'no_stage2_artifacts.patch')
sha256sums=('fec1f3f6b359a3d942e0a7f9157b3b30cde83927627a0e1ea95c54de3c526cfc' 'SKIP' 'SKIP')
md5sums=('SKIP' 'f65ba29d9ffe19ff7e3d0f8cf64b0eab' 'cb0bbf9c19971a48eff41e8c764ac990')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/force_dynamic_llvm.patch"
    patch -Np1 -i "$srcdir/no_stage2_artifacts.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver/build"

    # omit full compiler test since it takes ages
    ./zig version
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    make DESTDIR="$pkgdir" install
}
