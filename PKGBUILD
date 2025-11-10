# Maintainer: 0xdials <youremail@example.com>
pkgname=pibootcheck
pkgver=0.9.0
pkgrel=1
pkgdesc="Read-only Raspberry Pi boot-chain verification toolkit"
arch=('any')
url="https://github.com/0xdials/pibootcheck"
license=('MIT')
depends=('python' 'python-click' 'python-rich' 'python-jinja' 'python-pandas' 'python-dateutil')
makedepends=('python-setuptools' 'python-wheel' 'git' 'binwalk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/0xdials/pibootcheck/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fee55ff6e709dcc92c22267c51e88ce138adf7c8881498076751b43690a2d418')  # Replace SKIP with the real checksum before publishing

python_version=3.10

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m venv .venv
    source .venv/bin/activate
    pip install --upgrade pip setuptools wheel build
    pip install -r requirements.txt
    python -m build --wheel
    deactivate
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m venv "$pkgdir/usr/lib/$pkgname-venv"
    source "$pkgdir/usr/lib/$pkgname-venv/bin/activate"
    pip install --no-deps ./
    deactivate

    # Install the package files
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/usr/lib/$pkgname-venv/bin/pibootcheck" "$pkgdir/usr/bin/pibootcheck"

    # Install README and LICENSE
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    source .venv/bin/activate
    pip install ./
    # Run basic tests if available
    if command -v pytest >/dev/null 2>&1; then
        pytest -v
    fi
    deactivate
}

# vim:set ts=2 sw=2 et:
