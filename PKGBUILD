# Maintainer: Shiho Sakura <shiho@sakurastudios.eu>

pkgname=sakura-lsltest
pkgver=1.0.0
pkgrel=2
pkgdesc="Pytest-like test framework for LSL — drives sakura-lslc and sakura-slemu"
arch=('any')
url="https://github.com/Sakura-Studios-IKE/sakura-lsltest"
license=('MIT')
depends=('python>=3.9')
optdepends=('sakura-lslc' 'sakura-slemu')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Sakura-Studios-IKE/sakura-lsltest/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/sakura-lsltest-$pkgver"
    # Build the wheel without isolation so we use Arch's system Python
    # packages. The Makefile's default target runs integration tests
    # against sibling lslc/slemu checkouts, which makepkg can't satisfy
    # in its sandbox — so we bypass make and call python-build directly.
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/sakura-lsltest-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
