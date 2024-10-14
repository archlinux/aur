# Maintainer: Ben Copeland <ben@copeland.me.uk>
pkgname=tuxmake
pkgver=1.27.1
pkgrel=6
pkgdesc="A tool for building Linux kernels across architectures, toolchains, and configurations"
arch=('x86_64' 'aarch64')
url="https://tuxmake.org/"
license=('Apache')
depends=('python' 'docker' 'podman')
makedepends=('git' 'python-setuptools' 'python-wheel' 'python-build' 'python-flit' 'python-flit-core' 'python-pytest' 'python-pytest-mock')
optdepends=('docker: for containerized builds with docker'
            'podman: for containerized builds with podman')
source=("https://files.pythonhosted.org/packages/source/t/tuxmake/tuxmake-${pkgver}.tar.gz")
sha256sums=('c183624805bda0449118636b8744631ec17daa40fc7edbd2163da78e0e86e7db')

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

    pip install --root="$pkgdir" --prefix=/usr --no-deps dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

