# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Benoît Allard <benoit.allard@gmx.de>

pkgname="dbt-core"
pkgver=2.0.8
pkgrel=3
pkgdesc="Tool for data analysts to build analytics the way engineers build applications"
arch=("x86_64" "aarch64")
url="https://www.getdbt.com/"
license=("Apache-2.0")
# since 2.0 the Python package is the Rust engine (Fusion), built with maturin
depends=("python"
         "python-mashumaro"
         "python-msgpack")
makedepends=("cargo"
             "protobuf"
             "python-build"
             "python-installer"
             "python-maturin")
options=("!lto")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbt-labs/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('bac2b52d7ca01d476cad49fc61cf425413201228a0eed79df7e1c8a44cb917fe738f0f36fc2539ca9e202fc6dd0c1669f1f384fa4878ad90e41934977fe919d5')

prepare(){
 cd "dbt-$pkgver"
 export RUSTUP_TOOLCHAIN=stable
 cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build(){
 cd "dbt-$pkgver/crates/dbt-sa-python"
 export RUSTUP_TOOLCHAIN=stable
 export CARGO_TARGET_DIR="$srcdir/target"
 python -m build --wheel --no-isolation
}

package(){
 cd "dbt-$pkgver/crates/dbt-sa-python"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "$srcdir/dbt-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
