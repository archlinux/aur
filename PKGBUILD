# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgbase='python-catalyst'
pkgname=('python-catalyst')
_module='catalyst'
pkgver='22.04'
pkgrel=1
pkgdesc="Accelerated deep learning R&D with PyTorch."
url="https://github.com/catalyst-team/catalyst"
depends=(
  'python'
  'python-accelerate'
  'python-hydra-slayer'
  'python-numpy'
  'python-pytorch'
  'python-pyyaml'
  'python-tensorboardx'
  'python-tqdm'
)
makedepends=('python-setuptools')
checkdepends=(
  'python-pytest'
  'python-path'
)
license=('Apache')
arch=('any')
source=("${_module}-${pkgver}.tar.gz::https://github.com/catalyst-team/catalyst/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3d00a21b3a3180e7350a89d43530c4ad84db97a6ff00fbb4f48f0540621edaf1')
# source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
# sha256sums=('e226b6d68376b12a6956debe3448e8a87409259c0125317163826f0665b17c6b')

prepare() {
  cd "${srcdir}/${_module}-${pkgver}" || exit 1
  # sed -i 's/tensorboardX<2.3.0>=2.1.0/tensorboardX<2.5.0>=2.1.0/' \
  #   "requirements/requirements.txt"
  # sed -i '63s/^$/print(extras)/' setup.py
  sed -i 's:extras_require=extras,::g' setup.py  # Avoid weird setuptools error.
}

build() {
  cd "${srcdir}/${_module}-${pkgver}" || exit 1
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}" || exit 1
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
  cd "${srcdir}/${_module}-${pkgver}" || exit 1
  python -c 'import catalyst'
  # pytest -v tests  # Skip since some tests fail, and require GPU training.
}
