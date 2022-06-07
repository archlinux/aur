# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pytest-codeblocks
pkgname=python-${_base}
pkgdesc="Test code blocks in your READMEs"
pkgver=0.16.0
pkgrel=2
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-pytest)
makedepends=(python-virtualenv)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e841ed11c8cd8e73b888bdee3ceda82193e0ed0441d623c586c69c45412039656a09e9f872f187c72d4e245ac8ee99b4a099ed9ae1a13f88f564bc0b9fae69f6')

# prepare() {
#   sed -i 's/requires = \["setuptools>=61"\]/requires = \["setuptools>=60"\]/' ${_base}-${pkgver}/pyproject.toml
# }

build() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages venv
  . venv/bin/activate
  venv/bin/python -m pip install --upgrade setuptools
  venv/bin/python -c "from setuptools import setup; setup();" build
}

check() {
  cd ${_base}-${pkgver}
  venv/bin/python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest -p pytester
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
