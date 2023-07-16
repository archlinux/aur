pkgname=cppkafka-git
_gitname=cppkafka
pkgver=0.4.0.r12.g91ac543
pkgrel=1
pkgdesc="Modern C++ Apache Kafka client library (wrapper for librdkafka)"
arch=('x86_64')
url="https://github.com/mfontanini/cppkafka"
license=('BSD')
depends=('librdkafka-git')
makedepends=('git' 'cmake' 'boost')
source=("git+https://github.com/mfontanini/cppkafka")
sha256sums=('SKIP')
epoch=1
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")

pkgver() {
    cd "$srcdir/$_gitname"
    # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
    local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]')

    # Format git-based version for pkgver
    # Expected format: e.g. 1.5.0rc2.r521.g99982a1c
    echo "${_gitversion}" | sed \
        -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
        -e 's|\([0-9]\+-g\)|r\1|' \
        -e 's|-|.|g'
}

build () {
    cd "$srcdir/$_gitname"
    cmake -DCPPKAFKA_DISABLE_TESTS=ON -DCMAKE_BUILD_TYPE=RELWITHDEBINFO -DCMAKE_CXX_FLAGS=-flto -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package () {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir/" install
}
