# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=manim-slides
pkgname=python-${_base,,}
pkgver=5.5.4
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
sha512sums=('d0d159b19d7c005616922ab340c96c9438742e8f3448803e0d5e1f5b52d1c3619a7d3b76a959d36a890f047d0db60729427960d9226c1e1061ce21673c4b7211')

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
