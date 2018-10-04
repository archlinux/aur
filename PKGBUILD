# Maintainer: Marc Tiehuis <marctiehuis@gmail.com>

pkgname=zig
pkgver=0.3.0
pkgrel=1
pkgdesc='a programming language prioritizing robustness, optimality, and clarity'
arch=('x86_64')
url='https://ziglang.org/'
license=('MIT')
depends=('clang' 'llvm')
makedepends=('cmake' 'git')
source=("https://ziglang.org/download/$pkgver/zig-$pkgver.tar.xz" 'force_dynamic_llvm.patch' 'no_stage2_artifacts.patch')
sha256sums=('d70af604f3a8622f3393d93abb3e056bf60351e32d121e6fa4fe03d8d41e1f5a' 'SKIP' 'SKIP')
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
