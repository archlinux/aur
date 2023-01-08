# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=python-polars
pkgver=0.15.14
pkgrel=1
pkgdesc="Blazingly fast DataFrames library using Apache Arrow Columnar Format as memory model"
arch=("x86_64")
url="https://www.pola.rs/"
license=('MIT')
depends=('python' 'python-numpy')
optdepends=('python-pandas: for interoperability with pandas frames'
            'python-pyarrow: for interoperability with arrow types'
            'python-pytz: to enable conversion to python datetimes with timezones'
            'python-fsspec: to transparently open files locally or remotely')
makedepends=('maturin' 'rust-nightly' 'cmake' 'python-installer')
_name=${pkgname#python-}
_tag="py-$pkgver"
source=("https://github.com/pola-rs/polars/archive/refs/tags/$_tag.tar.gz")
b2sums=("97daf666430b56df636352a614ea03c0276418add2655c9f5fd0035c96d264080a4e27a840760a4bc3f58c09cfd1313ca9517b21db60fb80660b5c7200ebf3de")

build() {
    rm wheels -rf
    cd polars-$_tag/py-polars
    maturin build -o ../../wheels --release
}

package() {
    python -m installer -d "$pkgdir" ./wheels/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" polars-$_tag/LICENSE
}
