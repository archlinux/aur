# Maintainer: Truong Vu <wanwan.vxt@gmail.com>

_pkgname=biscuit-lang
pkgname=biscuit-lang-bin
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
    'binutils'
    'sh'
)
makedepends=('chrpath')
optdepends=(
    'libpng: for bundled png/freetype extras'
    'zlib-ng-compat: for bundled png/freetype extras'
    'bzip2: for bundled freetype extra'
    'libxcb: for bundled clipboard extra'
    'libx11: for bundled glfw extra'
    'wayland: for bundled glfw extra'
)

provides=('biscuit-lang')
conflicts=('biscuit-lang')
backup=("etc/$_pkgname/config.yaml")
options=(!debug)

source=("https://github.com/biscuitlang/bl/releases/download/$pkgver/blc-x86_64-linux.zip")
sha256sums=('2edb9c2f3e16747c4db34550fba1e1f368ad26ad1697aa18b34b339c41d9d3de')

package() {
    cd "$srcdir"

    # lib
    install -d "$pkgdir/usr/lib/$_pkgname"
    cp -dr --no-preserve=ownership bin lib -t "$pkgdir/usr/lib/$_pkgname/"

    # delete insecure RUNPATH
    find "$pkgdir/usr/lib/$_pkgname" -type f -name "*.so*" -exec chrpath --delete {} \; 2>/dev/null || true

    # config
    install -Dm644 /dev/stdin "$pkgdir/etc/$_pkgname/config.yaml" <<EOF
version: "$pkgver"
lib_dir: "/usr/lib/$_pkgname/lib/bl/api"
x86_64-pc-linux-gnu:
    preload_file: "os/_linux.bl"
    linker_executable: "/usr/bin/ld"
    linker_opt_exec: "/usr/lib/$_pkgname/lib/bl/rt/blrt_x86_64_linux.o -dynamic-linker /lib64/ld-linux-x86-64.so.2 -e _start --export-dynamic"
    linker_opt_shared: "--shared"
    linker_lib_path: "/lib:/lib64:/usr/lib:/usr/lib64:/usr/local/lib"
EOF

    # exe
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/blc" <<EOF
#!/bin/sh
exec /usr/lib/$_pkgname/bin/blc --override-config='/etc/$_pkgname/config.yaml' "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/blc"

    # docs
    install -d "$pkgdir/usr/share/doc/$_pkgname"
    cp -dr --no-preserve=ownership docs/* -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -Dm644 README.md CHANGELOG.txt -t "$pkgdir/usr/share/doc/$_pkgname/"

    # licenses
    install -Dm644 LICENSE LEGAL -t "$pkgdir/usr/share/licenses/$pkgname/"

    # syntax hl
    install -d "$pkgdir/usr/share/vim/vimfiles"
    cp -dr --no-preserve=ownership syntax/vim/* -t "$pkgdir/usr/share/vim/vimfiles/"
    install -Dm644 syntax/emacs/*.el -t "$pkgdir/usr/share/emacs/site-lisp/"
}
