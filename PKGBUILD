# Maintainer: x2b <psaoj.10.Toranaga-San@spamgourmet.com>

pkgname=highs-git
pkgrel=1
pkgdesc="Linear optimization software (Git version)"
arch=('i686' 'x86_64')
pkgver=r8589.624bc58d3
_pkgname=HiGHS
url="https://github.com/ERGO-Code/HiGHS"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('cmake' 'git')
provides=('highs')
conflicts=('highs')
source=("git+https://github.com/ERGO-Code/HiGHS.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${_pkgname}"
    mkdir -p "build"
    cd "build"

    cmake \
      -DCMAKE_EXE_LINKER_FLAGS=$LDFLAGS \
      -DCMAKE_SHARED_LINKER_FLAGS=$LDFLAGS \
      -DCMAKE_INSTALL_PREFIX=/usr \
      ..
}

build() {
    cd "$srcdir/${_pkgname}/build"
    make
}

check() {
    cd "$srcdir/${_pkgname}/build"
    make test
}

package() {
    cd "$srcdir/${_pkgname}/build"
    make DESTDIR="$pkgdir/" install

    cd "$srcdir/${_pkgname}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
