# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Benoît Allard <benoit.allard@gmx.de>

pkgname="dbt-core"
pkgver=2.0.11
pkgrel=1
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
             "python-maturin"
             "python-wheel")
options=("!lto")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbt-labs/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('ab1abc6e4a0726ff2adb7ce1df07bfa59541fc509c8e3e97db94ec8f6ff1b89c631066c99ff0bb5c93065aef03a126913408d1f249acabc7cd0d567f3109816c')

prepare(){
 cd "dbt-$pkgver"
 export RUSTUP_TOOLCHAIN=stable
 cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build(){
 cd "dbt-$pkgver/crates/dbt-sa-python"
 export RUSTUP_TOOLCHAIN=stable
 export CARGO_TARGET_DIR="$srcdir/target"
 # upstream uses a single codegen unit, which compiles the final crate on one core
 export CARGO_PROFILE_RELEASE_LTO=off
 export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=16
 python -m build --wheel --no-isolation
}

package(){
 cd "dbt-$pkgver/crates/dbt-sa-python"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "$srcdir/dbt-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
