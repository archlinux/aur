# Maintainer: Daniel McGuire <danielmcguire2023@gmail.com>
pkgname=phasor
PACKAGER="Daniel McGuire <danielmcguire2023@gmail.com>"
pkgver=3.0.0
pkgrel=2
pkgdesc="Phasor Programming Language Toolchain"
arch=('x86_64')
url="https://github.com/DanielLMcGuire/Phasor"
license=('0BSD')
makedepends=('gcc' 'cmake' 'ninja')
optdepends=('gcc: For building Phasor Native wrappers.')
conflicts=('phasor-git' 'phasor-dev')
options=(strip !debug)
install=phasor.install
depends=()
source=("https://github.com/DanielLMcGuire/Phasor/archive/refs/tags/3.0.0.tar.gz")
sha256sums=('342D1C1FC04354A74B52EF3D7AE7BC4A0C5A59342B856EE342416F1E360D959F')

build() {
    cd "$srcdir/Phasor-3.0.0"
    cmake -S . -B build -G Ninja --preset linux-64-rel
    cmake --build build --config Release
}

package() {
    cd "$srcdir/Phasor-3.0.0/build"
    cmake --install . --prefix "$pkgdir"
    for section in 1 3 5 7; do
        src="$srcdir/Phasor-3.0.0/docs/man/man$section"
        dest="$pkgdir/usr/share/man/man$section"
        mkdir -p "$dest"
        for file in "$src"/*."$section"; do
            [ -f "$file" ] && install -Dm644 "$file" "$dest"/
        done
    done
    
    install -Dm644 "$srcdir/Phasor-3.0.0/src/Extensions/unix/phasor.magic" \
        "$pkgdir/usr/share/file/magic/phasor"
}