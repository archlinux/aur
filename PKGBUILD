# Maintainer: gilcu3
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="euporie"
pkgver=2.9.1
pkgrel=1
pkgdesc="Jupyter notebooks in the terminal"
arch=('any')
url="https://${pkgname}.readthedocs.io"
_url="https://github.com/joouha/${pkgname}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-pathlib-abc')
checkdepends=('python-pytest' 'python-pytest-asyncio')
depends=(
  # from pyproject.toml
  'python>=3.8' 'python-prompt_toolkit' 'python-pygments' 'jupyter-nbformat'
  'python-jupyter-client>=7.1' 'python-aenum' 'python-typing_extensions'
  'python-fastjsonschema' 'python-platformdirs' 'python-pyperclip'
  'python-imagesize' 'python-markdown-it-py' 'python-linkify-it-py'
  'python-mdit_py_plugins' 'python-flatlatex' 'timg'
  'python-pillow>=9.0' 'python-sixelcrop' 'python-universal_pathlib'
  'python-fsspec' 'python-jupytext>=1.14.0'
  # from namcap
  'python-jupyter-core' 'python-ipykernel' 'python-rich' 'python-mtable'
  'python-sympy' 'python-numpy' 'python-html2text'
  'python-magic' 'python-matplotlib' 'python-cairosvg' 'python-aiohttp'
  'python-ziamath' 'python-chafapy' 'python-teimpy' 'python-pylatexenc')
optdepends=('python-asyncssh: for Euporie hub support')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha256sums=('462e4e942b9f6990f5ac9cb61f7547cdbf5b7cf56b792f6065c78ffd2b4bdd2a')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check () {
  cd "${srcdir}/${_pkgsrc}"
  pytest
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.rst"   "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vs "${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
