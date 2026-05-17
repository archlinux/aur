# Maintainer: Truong Vu <wanwan.vxt@gmail.com>

pkgname=biscuit-lang
pkgver=0.13.0
pkgrel=4
pkgdesc='Simple programming language created for fun'
arch=('x86_64')
url='https://biscuitlang.org/'
license=('MIT')

depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'llvm18'
    'binutils'
    'sh'
)
makedepends=(
    'git'
    'chrpath'
)
optdepends=(
    'libpng: for bundled png/freetype extras'
    'zlib-ng-compat: for bundled png/freetype extras'
    'bzip2: for bundled freetype extra'
    'libxcb: for bundled clipboard extra'
    'libx11: for bundled glfw extra'
    'wayland: for bundled glfw extra'
)

provides=('biscuit-lang')
conflicts=('biscuit-lang-bin')
backup=("etc/$pkgname/config.yaml")

source=(
    "git+https://github.com/biscuitlang/bl.git#tag=$pkgver"
    'arch-linux.patch'
)
sha256sums=(
    'b4e133f6680d9035d7532ed6c4e6ccc9651800b61c97e89be7ed7dc9a3a7efb8'
    '12ad10828dde6af9e0b0b1738d00c3c705302721aeff1aee9bd0595073424ebc'
)

prepare() {
    cd "$srcdir"
    patch -p1 -d bl < arch-linux.patch
}

build() {
    cd "$srcdir/bl"
    ./build.sh release docs
}

package() {
    cd "$srcdir/bl"

    # lib
    install -d "$pkgdir/usr/lib/$pkgname"
    cp -dr --no-preserve=ownership bin lib -t "$pkgdir/usr/lib/$pkgname/"

    # delete insecure RUNPATH
    find "$pkgdir/usr/lib/$pkgname" -type f -name "*.so*" -exec chrpath --delete {} \; 2>/dev/null || true

    # config
    install -Dm644 /dev/stdin "$pkgdir/etc/$pkgname/config.yaml" <<EOF
version: "$pkgver"
lib_dir: "/usr/lib/$pkgname/lib/bl/api"
x86_64-pc-linux-gnu:
    preload_file: "os/_linux.bl"
    linker_executable: "/usr/bin/ld"
    linker_opt_exec: "/usr/lib/$pkgname/lib/bl/rt/blrt_x86_64_linux.o -dynamic-linker /lib64/ld-linux-x86-64.so.2 -e _start --export-dynamic"
    linker_opt_shared: "--shared"
    linker_lib_path: "/lib:/lib64:/usr/lib:/usr/lib64:/usr/local/lib"
EOF

    # exe
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/blc" <<EOF
#!/bin/sh
exec /usr/lib/$pkgname/bin/blc --override-config='/etc/$pkgname/config.yaml' "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/blc"

    # docs
    install -d "$pkgdir/usr/share/doc/$pkgname"
    cp -dr --no-preserve=ownership docs/side/* -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 README.md CHANGELOG.txt -t "$pkgdir/usr/share/doc/$pkgname/"

    # licenses
    install -Dm644 LICENSE LEGAL -t "$pkgdir/usr/share/licenses/$pkgname/"

    # syntax hl
    install -d "$pkgdir/usr/share/vim/vimfiles"
    cp -dr --no-preserve=ownership syntax/vim/* -t "$pkgdir/usr/share/vim/vimfiles/"
    install -Dm644 syntax/emacs/*.el -t "$pkgdir/usr/share/emacs/site-lisp/"
}
