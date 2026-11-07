# Maintainer: Noah Vogt <noah@noahvogt.com>
pkgname=tibasicc-git
pkgver=1.2.r2.gc1a58bd
pkgrel=3
pkgdesc="TI-BASIC (de-)compiler written in C++ with a decent preprocessor - git version"
arch=('x86_64' 'aarch64')
url="https://github.com/noahvogt/tibasicc"
license=('ISC')
depends=('gcc-libs' 'glibc')
makedepends=('git')
provides=('tibasicc')
conflicts=('tibasicc')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    # the link step ignores LDFLAGS, so pass them along with CXX
    make CXX="${CXX:-g++}" CXXFLAGS="$CXXFLAGS $LDFLAGS"
}

package() {
    cd "${pkgname%-git}"
    install -Dm755 tibasicc "$pkgdir/usr/bin/tibasicc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    cp -r doc/tixx_guide/linkguide "$pkgdir/usr/share/doc/$pkgname/"
}
