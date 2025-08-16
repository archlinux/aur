# Maintainer: Karashi <Karashi123@users.noreply.github.com>
pkgname=python-fastlayer-git
_pkgname=fastlayer
pkgver=0.1.0.r1.g26ef074
pkgrel=1
pkgdesc="高速インメモリキャッシュ + NumPy/Numba最適化フレームワーク (VCS版)"
arch=('any')
url="https://github.com/Karashi123/fastlayer"
license=('Apache')
depends=('python' 'python-numpy' 'python-numba')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('cython: Cython実装を試す場合'
            'pybind11: pybind11実装を試す場合')
provides=('python-fastlayer')
conflicts=('python-fastlayer')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.r%s.g%s" "$(grep -Po '(?<=version=\")([^\\\"]+)' setup.py | head -n1)" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  if [[ -f NOTICE ]]; then
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  fi
}

