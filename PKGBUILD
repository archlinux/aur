# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=manim-slides
pkgname=python-${_base,,}
pkgver=5.7.0
pkgrel=1
pkgdesc="Tool for live presentations using manim"
arch=(x86_64)
url="https://github.com/jeertmans/${_base}"
license=(MIT)
depends=(python-av python-beautifulsoup4 python-click-default-group python-jinja
  python-lxml python-numpy python-pillow python-pydantic-extra-types python-pptx
  python-qtpy python-requests python-rich python-rtoml python-tqdm)
makedepends=(python-build python-installer python-hatch-fancy-pypi-readme)
checkdepends=(python-pytest-cov python-pytest-qt pyside6 python-pytest-missing-modules
  python-manimgl manim python-setuptools xorg-server-xvfb)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9c640b2acd7cfd018e5f90994680a239a7943502774f47cb335fafe8e4c6908b266e790f87823ac220d5e58b6e1d31e2ae2166564321b5e4eefa05b44020ba01')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  export DISPLAY=:99
  nohup Xvfb $DISPLAY &
  test-env/bin/python -m pytest tests \
    --ignore=tests/test_slide.py \
    --ignore=tests/test_present.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
