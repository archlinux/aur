# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
_base=pytest-flakes
pkgname=python-${_base}
pkgver=4.0.3
pkgrel=3
pkgdesc="pytest plugin to check source code with pyflakes"
arch=('any')
url="https://github.com/asmeurer/${_base}"
license=(MIT)
depends=(python-pytest python-pyflakes)
makedepends=(python-setuptools)
checkdepends=(python-coverage python-pytest-pep8)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('ca63d68063cf48789d86dee3707b3ea7c5076fc1f636e17f408ad6f444303fb3a701af8d1e464d49af745e350272bffe8596853a52c01baa0bdb0b6b0c0bb303')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="$PWD/tmp_install/$site_packages" py.test
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
