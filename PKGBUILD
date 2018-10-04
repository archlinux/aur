# Maintainer: Marc Tiehuis <marctiehuis at gmail.com>

pkgname=zig-git
pkgver=0.3.0r3806.3f13a59c
pkgrel=1
pkgdesc="a programming language prioritizing robustness, optimality, and clarity"
arch=('i686' 'x86_64')
url='http://ziglang.org'
license=('MIT')
depends=('clang' 'llvm')
makedepends=('cmake' 'git')
provides=(zig)
conflicts=(zig)
source=("git://github.com/zig-lang/zig.git" 'force_dynamic_llvm.patch' 'no_stage2_artifacts.patch')
md5sums=('SKIP' '9a935ede50ab8f1a789349fc3b760c1c' 'cb0bbf9c19971a48eff41e8c764ac990')

prepare() {
    cd "$srcdir/$provides"
    patch -Np1 -i "$srcdir/force_dynamic_llvm.patch"
    patch -Np1 -i "$srcdir/no_stage2_artifacts.patch"
}

pkgver() {
    cd "$srcdir/$provides"
    printf "0.3.0r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$provides"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

check() {
    cd "$srcdir/$provides/build"

    # omit full compiler test since it takes ages
    ./zig version
}

package() {
    cd "$srcdir/$provides/build"
    install -Dm644 "$srcdir/$provides/LICENSE" "$pkgdir/usr/share/licenses/$provides/LICENSE"
    make DESTDIR="$pkgdir" install
}
