# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexandre Bury <alexandre.bury@gmail.com>

_name=deltalake
pkgname="python-${_name}"
pkgver=1.6.6
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
b2sums=('0dbe06104d7088d92cbef1be68ecf4620de025293e99f6635ef2d136ba6c57e5cad409e1c7e91eb94ddc6aa36c4a856ca7cc248016b905649295a45805cf88fb')

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
