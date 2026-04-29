# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-pyctcdecode
_pyname=pyctcdecode
pkgver=0.5.0
pkgrel=1
pkgdesc='CTC beam search decoder for speech recognition (with KenLM-style LM support)'
arch=('any')
url='https://github.com/kensho-technologies/pyctcdecode'
license=('Apache-2.0')
depends=(
    'python>=3.7'
    'python-numpy'
    'python-pygtrie'    # AUR
    'python-hypothesis'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('f3bcb313e43ca16a54938b3e77b0b375328653bba932668243db745fde513a2c')

prepare() {
    # Upstream pins numpy<2.0.0 defensively but the runtime code is
    # numpy-2 compatible; relax the constraint so we work with Arch's
    # numpy 2.x.
    cd "$_pyname-$pkgver"
    sed -i 's/numpy>=1.15.0,<2.0.0/numpy>=1.15.0/' setup.py 2>/dev/null || true
    sed -i 's/numpy>=1.15.0,<2.0.0/numpy>=1.15.0/' pyproject.toml 2>/dev/null || true
}

build() {
    cd "$_pyname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
