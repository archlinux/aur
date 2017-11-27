pkgname=drake-git
pkgver=r1684.ge8764516
pkgrel=3

pkgdesc='runtime library replacement for gnat'
url='https://github.com/ytomino/drake'
arch=('i686' 'x86_64')
license=('MIT')

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
    cd drake
    _gcc=$(gcc -dumpversion)
    install -Dm0644 source/adainclude/* -t "$pkgdir"/usr/lib/drake/"$CHOST"/"$_gcc"/adainclude

    # gnatmake special cases 0444 permissions on ALI files as "locked" which
    # marks them as assumed correct and up to date.
    install -Dm0444 source/adalib/*.ali -t "$pkgdir"/usr/lib/drake/"$CHOST"/"$_gcc"/adalib

    install -Dm0644 source/adalib/*.{a,o,so} -t "$pkgdir"/usr/lib/drake/"$CHOST"/"$_gcc"/adalib
    install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
    install -Dm0644 info.rst "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.CREDITS
}
