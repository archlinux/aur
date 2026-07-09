# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('phonors')
pkgver=0.3.0
pkgrel=2
pkgdesc="A Python module implemented in Rust for Phonopy"
arch=('any')
url="https://github.com/phonopy/phonors"
license=('BSD')
provides=('python-phonors')   # 新增这一行
depends=(
    "python"
)
optdepends=(

)
makedepends=(
    'maturin'
    'python-build'
    'python-installer'
    'python-wheel'
    'rust'
)


source=("git+https://github.com/phonopy/phonors.git#tag=v${pkgver}")
sha256sums=('SKIP')


# 调优开关：设为 1 启用 target-cpu=native
_use_native_opt=1

build() {
    cd "$srcdir"/"$pkgname"
    rm -rf target/wheels/

    if [[ $_use_native_opt -eq 1 ]]; then
        export RUSTFLAGS='-C target-cpu=native'
    fi

    maturin build --release --strip --manylinux
}


package() {
  cd "$srcdir"/"$pkgname"
  PIP_CONFIG_FILE=/dev/null pip install \
    --no-index --isolated --root="$pkgdir" \
    --ignore-installed --no-deps target/wheels/*.whl
}
