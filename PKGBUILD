# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-markdown
_npm_base=markdown-it-vue
pkgname=python-${_base}
pkgdesc="Markdown widget for trame"
pkgver=2.0.2
_npm_pkgver=1.1.7
pkgrel=4
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(MIT)
depends=(python-trame-client)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  https://registry.npmjs.org/${_npm_base}/-/${_npm_base}-${_npm_pkgver}.tgz)
sha512sums=('a1a1177ad1f1c55a3afeccf4c7f682dc08ff744eb1f6843f1085d5889a7c5853cfe2b292e46d420014c3ce6489bd2ffa05b8c6c704d988993de33b2d117dbde0'
  '71511e9900b82cb55ef182ebebe7851aa013bc2f3bb8d862f69962c3964b9f42e48920775ec98d416ebd94c0c8e4471b01e85e172b0e9493681b479832e61060')

prepare() {
  sed -i 's/^include/#include/' ${_base}-${pkgver}/MANIFEST.in
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  # Install Client
  mv ${srcdir}/package/dist/fonts ${pkgdir}${site_packages}/${_base/-/_}/module
  mv ${srcdir}/package/dist/img ${pkgdir}${site_packages}/${_base/-/_}/module
  mv ${srcdir}/package/dist/${_npm_base}.css ${pkgdir}${site_packages}/${_base/-/_}/module
  mv ${srcdir}/package/dist/${_npm_base}.umd.min.js ${pkgdir}${site_packages}/${_base/-/_}/module

  rm ${pkgdir}${site_packages}/trame/__init__.py
  rm ${pkgdir}${site_packages}/trame/modules/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
