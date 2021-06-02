# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

pkgname=pezor
pkgver=2.1.0
pkgrel=1
pkgdesc='Open-Source PE Packer'
arch=(x86_64)
url='https://github.com/phra/PEzor'
license=(GPL3 Apache)
makedepends=(git)
depends=(capstone clang cowsay donut keystone mingw-w64-clang-git mingw-w64-gcc mono sgn)
source=('git+https://github.com/phra/PEzor.git#commit=d03563cd0c2994d911f9ffb7edb3987163a721fe'
        'git+https://github.com/JustasMasiulis/inline_syscall.git#commit=24238544b510d8f85ca38de3a43bc41fa8cfe380'
        'install_dir.patch'
        'pthread.patch')
sha512sums=('SKIP'
            'SKIP'
            '30f614b1c17d54ab96509d8f411c836d89d41a56696545c89e56f358c04aee2c8fe97cba5e53cd08abb2b950f9b4fbebd45954045b8d1def1553649d547c33ff'
            'd0a2488cd5f8d700762c897335a0933dfe4a74fab2d62626ee30c1aa8faa766097c0e581b855c8e741f6918d8b51affd28b656ebda01a638cdcaa901e33219bb')

prepare() {
    cd PEzor
    patch -Np1 -i "$srcdir/install_dir.patch"
    patch -Np1 -i "$srcdir/pthread.patch"
    mkdir -p deps
    ln -sTf "$srcdir/inline_syscall" deps/inline_syscall
    sed -i '/#include <intrin\.h>/d' deps/inline_syscall/include/in_memory_init.hpp
}

package() {
    mkdir -p "$pkgdir/opt"
    find -L PEzor \( \
               -path '*/.git*' \
            -o -path '*/.vscode*' \
            -o -path PEzor/install.sh \
            -o -path PEzor/install.test.sh \
            -o -path PEzor/docker.sh \
            -o -name LICENSE \
            -o -name README.md \
        \) -prune -o -type d -o -print0 \
            | xargs -0 cp -r --parents -t "$pkgdir/opt"
    chmod +x "$pkgdir/opt/PEzor/PEzor.sh"
    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/PEzor/PEzor.sh "$pkgdir/usr/bin/pezor"
}
