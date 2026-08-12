# Maintainer: Ulises Jeremias Cornejo Fandos <ulisescf.24@gmail.com>
pkgname=agent-toolkit
pkgver=1.10.0
pkgrel=1
pkgdesc="Composable AI agent toolkit — loops, skills, profiles for Claude Code, Cursor, OpenCode, Windsurf, and more"
arch=('any')
url="https://github.com/ulises-jeremias/agent-toolkit"
license=('MIT')
depends=('python>=3.10')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ulises-jeremias/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('be06653263e41ed1bb74bd6fbdeca499f262683bd0385b4fd03b0aa6484ea8f6')

build() {
    cd "$pkgname-$pkgver"
    # Ensure bundled data is present for the wheel (source tarball needs prepare; PyPI wheels already contain it)
    # See https://github.com/ulises-jeremias/agent-toolkit/issues/258 (coordinate with #244)
    if [ -f scripts/prepare-package-data.sh ]; then
        bash scripts/prepare-package-data.sh
    fi
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
