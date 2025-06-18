# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-torchsde
pkgver=0.2.6
pkgrel=2
pkgdesc="Differentiable SDE solvers with GPU support and efficient sensitivity analysis"
arch=('any')
url="https://github.com/google-research/torchsde"
license=('Apache-2.0')
depends=('python'
         'python-numpy'
         'python-scipy'
         'python-pytorch'
         'python-trampoline')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
checkdepends=('python-pytest')
_tag='5a63002b0767f629c9bc09e9965a50bf3d583ef8'
source=("${pkgname}::git+${url}.git#tag=${_tag}"
        "enable-compatibility-with-pytest-8.3.4.patch")
sha512sums=('SKIP'
            '8d5c335ba65e48ecb33345462630db7267d736e58686a3720505c0821cd1c527a5d063e16a19f77beeb1df67fbaf1676385d6d78e75e7ab6ea2641573fe1f358')

prepare() {
  cd "${pkgname}"
  git apply --verbose ../enable-compatibility-with-pytest-8.3.4.patch
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  # May take some time (>10 mins with pytest-xdist)
  # Simply disable tests should be ok
  cd "${pkgname}"
  PYTHONPATH="${PWD}/build/lib" pytest tests/
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
