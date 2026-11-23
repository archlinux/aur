# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexandre Bury <alexandre.bury@gmail.com>

_name=deltalake
pkgname="python-${_name}"
pkgver=1.7.0
pkgrel=1
pkgdesc="Native Delta Lake Python binding based on delta-rs with Pandas integration"
arch=(x86_64)
url="https://github.com/delta-io/delta-rs"
license=(MIT)
depends=(python python-pyarrow)
options=(!lto !debug)
optdepends=('python-pandas: for interoperability with pandas frames'
            'python-pyspark: for spark integration')
makedepends=(python-build python-installer python-wheel python-maturin)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('17683e2a2d0ae45de6228a6bd1a4220c45e1bd9f8c43ecddcc0dada2edc8b23d70a40ea4c07eb63cffbf62a3343d99c50fb176146702c2af20dcabcfe3e1b6f4')

prepare() {
    cd "$_name-$pkgver"
    sed -i '/profile/s/dev/release/' pyproject.toml
    cargo fetch --target host-tuple
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

# TODO: check() function

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" target/wheels/*.whl
    install -Dm644 python/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 python/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
