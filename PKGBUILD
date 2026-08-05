# Maintainer: a821
# Contributor: Emil Edholm <emil@edholm.it>

pkgname=honggfuzz-git
pkgver=2.6.r104.gcf8b66a4
pkgrel=1
pkgdesc="Security oriented, feedback-driven, evolutionary, easy-to-use fuzzer"
arch=('x86_64')
url="https://honggfuzz.dev"
license=('Apache-2.0')
depends=('binutils' 'libunwind')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/google/honggfuzz.git"
         missing-true-macro.patch)
sha256sums=('SKIP'
            'f9ff919cad42f553c4391b26e1e91ace00f3e5cd879ea63a5c0376a0a363358a')

pkgver() {
    git -C "$pkgname" describe --tags --exclude '[a-z]*' | sed -e 's/-/.r/;s/-/./g'
}

prepare() {
    patch -d "$pkgname" -p1 < missing-true-macro.patch
}

build() {
    unset CFLAGS
    make -C "$pkgname"
}

package() {
    make -C "$pkgname" DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim: set ts=4 sw=4 et:
