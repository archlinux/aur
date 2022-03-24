# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=mdformat
pkgdesc="CommonMark compliant Markdown formatter"
pkgver=0.7.14
pkgrel=1
arch=(any)
url="https://github.com/executablebooks/${pkgname}"
license=(MIT)
depends=(python-tomli python-markdown-it-py)
makedepends=(python-build python-install python-poetry-core)
checkdepends=(python-pytest)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('520591580538bd17e0d0170d7a53a356241ba8e1cc8025c1d7583c55e5e405cf5b9cdb1b53db663d25a87ac86e03024105271cbf5ceb7bea2a05d1702677fa94')

build() {
  cd ${pkgname}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  test-env/bin/python -m pytest -k 'not no_codeblock_trailing_newline and not style[default_style.md-options0]'
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # https://github.com/FFY00/python-install/pull/6
  chmod +x ${pkgdir}/usr/bin/*

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${pkgname}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
