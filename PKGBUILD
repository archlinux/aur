# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

_name="pytorch-msssim"
pkgname=python-${_name}-git
provides=("python-${_name}")
conflicts=("python-${_name}")
pkgver=r155.b057b07
pkgrel=2
pkgdesc="Fast and differentiable MS-SSIM and SSIM for pytorch"
url="https://github.com/VainF/${_name}"
license=('MIT')
arch=('any')
depends=('python-pytorch')
makedepends=(python-build python-installer python-wheel git python-pillow python-setuptools)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_name}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

check() {
    cd ${srcdir}/${_name}/tests
    #python tests_comparisons_2d3d.py  # req skimage
    #python tests_comparisons_skimage.py  # req skimage
    #python tests_comparisons_tf_skimage.py  # req. skimage
    python tests_loss.py  # req. pillow
    #python tests_cuda.py  # req. cuda
}

build() {
    cd ${srcdir}/${_name}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_name}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

