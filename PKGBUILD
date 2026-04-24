# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=manim-slides
pkgname=python-${_base,,}
pkgver=5.6.0
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
sha512sums=('f8a61239e7f4cd834b723e8a931a3f07e60003bb7798bcb9320ea5f9b03372f13148991a1972ae55306bc4d2b9c80cc745cab0a768f4db38ecd62c1676f9a6e6')

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
