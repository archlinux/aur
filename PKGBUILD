# Maintainer: Michael A. Sinclair <squattingmonk@gmail.com>
# Contributor: Kevin Sheehan <kms.sheehan@gmail.com>
pkgname=nwnsc-git
pkgver=v1.1.0.r2.01f8791
pkgrel=1
pkgdesc="A command-line NWScript compiler for Neverwinter Nights"
arch=('any')
url="https://gitlab.com/glorwinger/nwnsc"
license=('custom')
groups=()
depends=('lib32-gcc-libs')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/glorwinger/nwnsc.git'
        'fix-steam-paths.patch'
        'fix-free-invalid-size.patch')
md5sums=('SKIP'
         '8bec12f6ea5cdd132524337f04647164'
         '58a10f7ebeb2597505fb72cb8efc2f7e')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git am --3way "$srcdir/fix-steam-paths.patch"
    git am --3way "$srcdir/fix-free-invalid-size.patch"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake .
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 nwnsc/nwnsc "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
