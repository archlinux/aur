# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: redponike <proton (dot) me>
# Contributor: Wu Zhenyu <wuzhenyu@ustc.edu>

_pkgname=x-transformers
pkgname=python-x-transformers
pkgver=2.32.1
pkgrel=1
# Upstream does not tag releases. Pin the commit that set version 2.32.1.
_commit=2619e6f38ffa68e7f390574936e29c10ba63c896
pkgdesc="A concise but complete full-attention transformer with a set of promising experimental features from various papers"
arch=('any')
url="https://github.com/lucidrains/x-transformers"
license=('MIT')
depends=(
    'python'
    'python-assoc-scan>=0.0.6'
    'python-einops>=0.8.0'
    'python-einx>=0.3.0'
    'python-loguru'
    'python-packaging>=21.0'
    'python-pytorch>=2.0'
    'python-torch-einops-utils>=0.2.6'
)
makedepends=('python-build' 'python-hatchling' 'python-installer')
# UniversalPretrainWrapper compiles its synthetic data generator with
# torch.compile. TorchInductor then needs a C compiler and setuptools, which
# python-pytorch does not declare. test_up exercises this path in check().
checkdepends=('python-pytest' 'python-setuptools')
optdepends=(
    'gcc: TorchInductor compilation used by UniversalPretrainWrapper'
    'python-flash-attn: packed variable-length sequences with FlashAttention'
    'python-setuptools: TorchInductor compilation used by UniversalPretrainWrapper'
)
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('6e287c28a174e5e43f9440a39c328e3e09e1a328b0bba1988c71af1503881cba')

build() {
    cd "$_pkgname-$_commit"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$_commit"
    local site
    site=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
    rm -rf "$srcdir/check-root" "$srcdir/check-suite"
    python -m installer --destdir="$srcdir/check-root" dist/*.whl
    # Run the complete upstream suite outside the checkout against the staged
    # wheel. The FlashAttention test skips itself without a capable CUDA GPU.
    mkdir -p "$srcdir/check-suite"
    cp -a tests "$srcdir/check-suite/"
    cd "$srcdir/check-suite"
    CUDA_VISIBLE_DEVICES='' PYTHONPATH="$srcdir/check-root$site" \
        python -P -m pytest -ra tests
    PYTHONPATH="$srcdir/check-root$site" python -P - "$srcdir/check-root" <<'PY'
import sys
from pathlib import Path
import x_transformers
assert Path(x_transformers.__file__).resolve().is_relative_to(Path(sys.argv[1]).resolve())
PY
}

package() {
    cd "$_pkgname-$_commit"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
