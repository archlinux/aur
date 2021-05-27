# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: localizator <localizator@ukr.net>
# Contributor: Edvinas Valatka <edacval@gmail.com>

pkgname=seafile-client
pkgver=8.0.2
pkgrel=1
pkgdesc='GUI client for synchronizing your local files with seafile server'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/$pkgname"
license=('Apache')
depends=(
    'seafile'
    'qt5-base'
    'qt5-webengine'
    'qt5-tools'
)
optdepends=('gtk-update-icon-cache')
makedepends=("cmake")
conflicts=('seafile-client-qt5')
provides=('seafile-client-qt5')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
    'fix_build_with_glib2.diff'
)
sha256sums=(
    'a6be7e55236cd4fb6028259ab5f35163ce044811f45b6008f280d42f5cee9f8d'
    '203a941b8c2b683b6cff15767117956ff34a393301ecc66e7860f8eba9701370'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 -i "$srcdir/fix_build_with_glib2.diff"

    cd "$srcdir"
    rm -rf build
    mkdir -p build
}

build() {
    cd "$srcdir/build"
    cmake \
        -DBUILD_TESTING=ON \
        -DBUILD_SHIBBOLETH_SUPPORT=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        "$srcdir/$pkgname-$pkgver"
    make
}

check() {
    cd "$srcdir/build"
    make test
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
}
