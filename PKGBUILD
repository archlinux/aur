# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-cxxfilt-git
pkgdesc="Demangling C++ symbols in Python"
url="https://github.com/afq984/python-cxxfilt"
pkgver=r15.7fccd25
pkgrel=2
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-six')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('BSD')
source=("$pkgname::git+https://github.com/afq984/python-cxxfilt")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git clean -xdf
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer \
        --destdir="$pkgdir" \
        --prefix=/usr \
        --compile-bytecode=1 \
        dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
