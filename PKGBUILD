# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-css-inline
_pkgname=css_inline
pkgver=0.20.2
pkgrel=1
pkgdesc="High-performance library for inlining CSS into HTML 'style' attributes"
arch=('x86_64')
url="https://github.com/Stranger6667/css-inline"
license=('MIT')
depends=(python)
makedepends=(
    python-build
    python-installer
    python-maturin
    python-wheel
)
options=(!lto)
# great-tables requires css-inline>=0.20.2,<0.21; do not bump past the 0.20 series
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/css-inline/$_pkgname-$pkgver.tar.gz")
sha256sums=('f495c24b96386dcc8fd6621507deeb81c5bc33ad4da26ec4fe625bda644eb937')

build() {
    cd "$_pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    # keep build paths out of the compiled extension (reproducibility)
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"

    # The sdist does not ship the Python test suite, so smoke-test the extension
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    rm -rf tmp_install
    python -m installer --destdir=tmp_install dist/*.whl
    PYTHONPATH="$PWD/tmp_install/$site_packages" python -c '
import css_inline
out = css_inline.inline("<html><head><style>h1 { color: red }</style></head><body><h1>hi</h1></body></html>")
assert "color: red" in out and "style=" in out, out
print("css_inline smoke test OK")
'
}

package() {
    cd "$_pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl
    # drop the maturin-generated SBOM which embeds absolute build paths
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/*.dist-info/sboms
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
