# Maintainer: Ben Copeland <ben@copeland.me.uk>
pkgname=tuxmake
pkgver=1.29.2
pkgrel=1
pkgdesc="A tool for building Linux kernels across architectures, toolchains, and configurations"
arch=('x86_64' 'aarch64')
url="https://tuxmake.org/"
license=('Apache')
depends=('python' 'docker' 'podman')
makedepends=(
    'git'
    'python-setuptools'
    'python-wheel'
    'python-build'
    'python-flit'
    'python-flit-core'
    'python-pytest'
    'python-pytest-mock'
    'python-installer'
)
optdepends=(
    'docker: for containerized builds with docker'
    'podman: for containerized builds with podman'
)
source=("https://files.pythonhosted.org/packages/source/t/tuxmake/tuxmake-${pkgver}.tar.gz")
sha256sums=('a501a8518bce0b456a67a3c72f5cce6b859003947260c9b80e6643cf13b4e172')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export PYTHONPATH="$srcdir/$pkgname-$pkgver:$PYTHONPATH"
    pytest
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
