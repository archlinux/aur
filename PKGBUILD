# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=swaystatus-git
pkgver=0.10.2.r1.89f6c9f
pkgrel=1
pkgdesc="Generate a status line for swaybar"
arch=('any')
url="https://github.com/jmcantrell/${pkgname%-git}"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-uv-build')
checkdepends=('python-pytest' 'python-pytest-cov')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}" || return
    git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

check() {
    cd "$srcdir/${pkgname%-git}" || return
    PYTHONPATH=$PWD/src pytest --no-cov
}

prepare() {
    git -C "$srcdir/${pkgname%-git}" clean -dfx
}

build() {
    cd "$srcdir/${pkgname%-git}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname%-git}" || return
    install -pm644 -Dt "$pkgdir"/usr/share/licenses/"$pkgname" ./LICENSE
    python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
}
