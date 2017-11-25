pkgname=drake-git
pkgver=r1680.g380ccf40
pkgrel=2

pkgdesc='runtime library replacement for gnat'
url='https://github.com/ytomino/drake'
arch=('i686' 'x86_64')
license=('GPL')

options=('!makeflags' 'staticlibs')

makedepends=('git' 'gcc-ada' 'headmaster')

provides=('drake')
conflicts=('drake')

source=('git+https://github.com/ytomino/drake')

sha256sums=('SKIP')

pkgver() {
    cd drake
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd drake/source
    make BUILDDIR=build CFLAGS="$CFLAGS"
}

package() {
    cd drake/source
    _gcc=$(gcc --version | awk '{print $3; exit}')
    install -Dm0644 adainclude/* -t "$pkgdir"/usr/lib/drake/"$CHOST"/"$_gcc"/adainclude
    install -Dm0644 adalib/* -t "$pkgdir"/usr/lib/drake/"$CHOST"/"$_gcc"/adalib

    # XXX https://github.com/ytomino/drake/issues/5#issuecomment-346916447
    mv "$pkgdir"/usr/lib/drake/"$CHOST"/"$_gcc"/adalib/lib{gnat,drake}.a
    cat <<! > "$pkgdir"/usr/lib/drake/"$CHOST"/"$_gcc"/adalib/libgnat.so
OUTPUT_FORMAT(elf64-x86-64)
GROUP(libdrake.a AS_NEEDED (-lpthread -lm -ldl -lrt))
!
}
