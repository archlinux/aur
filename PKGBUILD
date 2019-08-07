# Maintainer: x2b <psaoj.10.Toranaga-San@spamgourmet.com>

pkgname=highs-git
pkgrel=1
pkgdesc="Linear optimization software (Git version)"
arch=('i686' 'x86_64')
pkgver=r1685.074d658
_pkgname=HiGHS
url="https://github.com/ERGO-Code/HiGHS"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
provides=('highs')
conflicts=('highs')
source=("git+git://github.com/ERGO-Code/HiGHS.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${_pkgname}"
    mkdir -p "build"
    cd "build"

    cmake "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=Release \
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
