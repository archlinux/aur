# Maintainer: otaj
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgname=python-eagerpy-git
_name=eagerpy
pkgdesc="Toolbox to create adversarial examples that fool neural networks in PyTorch, TensorFlow, Keras,"
pkgver=0.30.0.r11.g5b3b37a
pkgrel=1
arch=(any)
url='https://github.com/jonasrauber/eagerpy'
license=(MIT)
provides=('python-eagerpy')
conflicts=('python-eagerpy')
optdepends=('python-pytorch: PyTorch functionality' 'python-tensorflow: TensorFlow functionality' 'python-jax: Jax functionality')
depends=('python-numpy')
makedepends=(
  'python-build' 'python-installer' 'python-wheel' 'git'
)
checkdepends=('python-pytest')
options=(!emptydirs)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/$_name"
  python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/$_name"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -o addopts=""
}

package() {
  cd "${srcdir}/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

