# Maintainer: Arsoniv <arsonivalt@gmail.com>
pkgname=axenc-git
pkgver=0.1.0.r31.g4f09033
pkgrel=1
pkgdesc="Axen language compiler (git development branch)"
arch=('x86_64')
url="https://github.com/arsoniv/axenc"
license=('GPL3')
depends=('llvm')
makedepends=('base-devel' 'cmake' 'git')
provides=('axenc')
conflicts=('axenc')

source=("git+https://github.com/arsoniv/axenc.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/axenc"
    local commits=$(git rev-list --count HEAD)
    local hash=$(git rev-parse --short HEAD)
    echo "0.1.0.r${commits}.g${hash}"
}

build() {
    cd "$srcdir/axenc"
    mkdir -p build
    cd build

    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$srcdir/axenc/build"

    # Install main executable
    install -Dm755 axenc "$pkgdir/usr/bin/axenc"

    # Install LSP executable
    if [ -f axenlsp ]; then
        install -Dm755 axenlsp "$pkgdir/usr/bin/axenlsp"
    fi

    # Install runtime object into /usr/lib/axen/
    mkdir -p "$pkgdir/usr/lib/axen"
    if [ -f axenruntime.o ]; then
        install -Dm644 axenruntime.o "$pkgdir/usr/lib/axen/axenruntime.o"
    fi

    # License
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

