# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=swaystatus-git
pkgver=0.5.0.r2.2268aec
pkgrel=1
pkgdesc="Generate a status line for swaybar"
arch=('any')
url="https://git.sr.ht/~jmcantrell/${pkgname%-git}"
license=('MIT')
depends=('python' 'python-toml')
optdepends=('python-systemd: systemd journal logging')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
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
    python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
}
