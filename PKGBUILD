# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-pysmt-git
pkgdesc="A library for SMT formulae manipulation and solving"
url="https://github.com/pysmt/pysmt"
pkgver=0.9.5.r53.gf7b599c
pkgrel=1
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-six')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('Apache')
source=("$pkgname::git+https://github.com/pysmt/pysmt#branch=master")
md5sums=('SKIP')

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
}
