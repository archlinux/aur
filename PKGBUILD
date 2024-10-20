# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=python-polars
pkgver=1.10.0
pkgrel=1
pkgdesc="Blazingly fast DataFrames library using Apache Arrow Columnar Format as memory model"
arch=("x86_64")
url="https://www.pola.rs/"
license=('MIT')
depends=('python' 'python-numpy')
options=('!lto')
optdepends=('python-pandas: for interoperability with pandas frames'
            'python-pyarrow: for interoperability with arrow types'
            'python-pytz: to enable conversion to python datetimes with timezones'
            'python-fsspec: to transparently open files locally or remotely')
makedepends=('maturin' 'rust-nightly' 'cmake' 'python-installer')
_name=${pkgname#python-}
_tag="py-$pkgver"
source=("https://github.com/pola-rs/polars/archive/refs/tags/$_tag.tar.gz")
b2sums=("1f8784e5d5d3b40134de4410a2456d07074edc2a489d1e2da47389134135d3fb4306ab62ab29f3f895887795d534c6849022d2dcb57bc9d49cec111270a51296")

prepare() {
    cd polars-$_tag/py-polars
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    rm wheels -rf
    cd polars-$_tag/py-polars
    maturin build -o ../../wheels --release
}

package() {
    python -m installer -d "$pkgdir" ./wheels/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" polars-$_tag/LICENSE
}
