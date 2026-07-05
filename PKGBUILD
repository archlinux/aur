# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Alexander Scharinger
# Contributor: Tristan Webb <t2webb@ucsd.edu>
# Contributor Sindwiller
# Contributor SecByShresth <shresthpaul133@gmail.com>

pkgname=pyspread
pkgver=2.4.5
pkgrel=1
pkgdesc="Python-based non-traditional spreadsheet application with GUI"
arch=('any')
url="https://pyspread.gitlab.io/"
license=('GPL-3.0-or-later')
depends=(
  'python-numpy'
  'python-pyqt6'
  'python-pyqt6-webengine'
  'python-markdown2'
  'qt6-svg'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'python-matplotlib: plotting support'
  'python-pyenchant: spell checking'
  'python-pip: plugin installation'
  'python-dateutil: date handling'
  'python-rpy2: R integration'
  'python-plotnine: ggplot-like plotting'
  'python-openpyxl: Excel file support'
  'python-pycel: Compile Excel spreadsheets to Python'
  'r: R plotting package integration'
)
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/p/pyspread/pyspread-${pkgver}.tar.gz")
sha256sums=('ecdbab9fd3a62ba2c4cf94d3e78dc951829cfcb8e99307cdffbaf479b4b53df6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fix legacy naked relative imports in the error-handling blocks
  sed -i 's/from __init__ import/from pyspread.__init__ import/g' pyspread/main_window.py
  sed -i 's/from cli import/from pyspread.cli import/g' pyspread/pyspread.py
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Dynamically discover active site-packages path directory
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  # Link Desktop Entry
  install -D -m644 \
    "${pkgdir}${site_packages}/pyspread/share/applications/io.gitlab.pyspread.pyspread.desktop" \
    "${pkgdir}/usr/share/applications/io.gitlab.pyspread.pyspread.desktop"

  # Link SVG App Icon
  install -D -m644 \
    "${pkgdir}${site_packages}/pyspread/share/icons/hicolor/svg/pyspread.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pyspread.svg"
}
