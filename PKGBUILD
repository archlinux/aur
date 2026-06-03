# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-verl
_pkgname=verl
pkgver=0.8.0
pkgrel=1
pkgdesc="Volcano Engine Reinforcement Learning for LLMs"
arch=('any')
url="https://github.com/volcengine/verl"
license=('Apache-2.0')
depends=(
    'python'
    'python-accelerate'
    'python-codetiming'
    'python-datasets'
    'python-dill'
    'python-hydra-core'
    'python-numpy'
    'python-pandas'
    'python-peft'
    'python-pyarrow'
    'pybind11'
    'python-pylatexenc'
    'python-ray'
    'python-torchdata'
    'python-tensordict'
    'python-transformers'
    'python-wandb'
    'python-packaging'
    'tensorboard'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
optdepends=(
    'python-pytest: test extra'
    'python-pre-commit: test extra'
    'py-spy: test extra'
    'python-pytest-asyncio: test extra'
    'python-pytest-rerunfailures: test extra'
    'python-pyext: prime extra'
    'python-mathruler: geo extra'
    'python-torchvision: geo extra'
    'python-qwen-vl-utils: geo extra'
    'python-liger-kernel: gpu extra'
    'python-flash-attn: gpu extra'
    'python-math-verify: math extra'
    'python-vllm: vllm extra'
    'python-sglang: sglang extra'
    'python-trl: trl extra'
    'python-mbridge: mcore extra'
    'python-tensorrt-llm: trtllm extra'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('814352ab55179dab0724091313e0367e866af667f6a749cc248b73699eb15a21')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"

    # Relax upper-bound pins that Arch's newer packages violate.
    # numpy<2.0.0 -> Arch ships numpy 2.x; tensordict<=0.10.0 -> Arch ships 0.12.x
    sed -i \
        -e 's/"numpy<2\.0\.0"/"numpy"/' \
        -e 's/"tensordict>=0\.8\.0,<=0\.10\.0,!=0\.9\.0"/"tensordict>=0.8.0"/g' \
        setup.py
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import verl; print(getattr(verl, '__version__', 'ok'))"
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
