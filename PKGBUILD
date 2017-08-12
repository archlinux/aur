# Maintainer: Alessandro Menti <alessandro.menti@alessandromenti.it>
pkgname=kwstyle-git
pkgver=r3211.8148e5ac
pkgrel=1
pkgdesc="The Kitware Style Checker"
arch=('i686' 'x86_64')
url="https://kitware.github.io/KWStyle/"
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake>=2.8.4' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('kwstyle::git+https://github.com/Kitware/KWStyle.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make
}

check() {
    cd "$srcdir/${pkgname%-git}/build"
    make test
}

package() {
    cd "$srcdir/${pkgname%-git}/build"
    make DESTDIR="$pkgdir/" install
    install -Dm644 ../Copyright.txt "$pkgdir"/usr/share/licenses/$pkgname/Copyright.txt
}
