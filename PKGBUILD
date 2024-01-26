# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=python-polars
pkgver=0.20.6
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
b2sums=("5c9fa0e983ca1193d04d781266f92711824ef24ce096cd6f88c7d8a14c65322274594146d98f7a782a3fe2c39fd1989d628cf5c0ab04cf16426c977bd93ac58b")

build() {
    rm wheels -rf
    cd polars-$_tag/py-polars
    maturin build -o ../../wheels --release
}

package() {
    python -m installer -d "$pkgdir" ./wheels/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" polars-$_tag/LICENSE
}
