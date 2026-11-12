# Maintainer: gilcu3
# Previous Maintainer: Jack R <rubacha dot jack03 at gmail.com>
# Contributor: Jack R <rubacha dot jack03 at gmail.com>
pkgname=open-numismat
pkgver=1.11.3
# since yearcalculator is tightly ingrained into open-numismat, use thr closest version of it to the one released (as submodules aren't bundled in github releases)
_yearcalc_pkgname=YearCalculator
_yearcalc_pkgver=0.3
_imageeditor_pkgname=ImageEditor
_imageeditor_pkgver=0.6
pkgrel=1
pkgdesc='Coin collecting software to organize and manage your own coin catalogue.'
arch=('any')
url="http://opennumismat.github.io"
license=('GPL3')
conflicts=('open-numismat-bin' 'open-numismat-git')
makedepends=('python-setuptools')
depends=('qt6-multimedia' 'qt6-webchannel' 'qt6-charts' 'qt6-webengine' 'pyside6' 'python-dateutil' 'python-jinja' 'python-lxml' 'python-openpyxl' 'python-pillow' 'python-imagehash' 'python-zxing-cpp' 'python-opencv')
optdepends=(
  'python-pyodbc: import from CoinManage and Numizmatik_Ru')
options=('!strip' '!emptydirs')
source=("https://github.com/OpenNumismat/open-numismat/archive/refs/tags/${pkgver}.tar.gz" 
        "https://github.com/OpenNumismat/open-numismat/releases/download/${pkgver}/open-numismat_${pkgver}_all.deb"
        "https://github.com/OpenNumismat/${_yearcalc_pkgname}/archive/refs/tags/${_yearcalc_pkgver}.tar.gz"
        "https://github.com/OpenNumismat/${_imageeditor_pkgname}/archive/refs/tags/${_imageeditor_pkgver}.tar.gz")
noextract=("open-numismat_${pkgver}_all.deb")
sha512sums=('273db64075792b75661865a48003836a9f581c22e7e4b70db854083ccaee0dbeea815622fcd869ec3abc21f928c8e37a565fd7fd8962134d5b1807181afcc188'
            '0b4944e8c0f36376dcf164d31b4aea6acc2e54bbf729503b4d9871b615a24cc701543a158a7ad1b9b86274448803918d411ff97d8be3982606df02b09e2ec795'
            '93800c7bd9baba4912c97e88403c59e36df96b2f1e48069ac9492041a244a8321f7bb82ca62d7a9e19b81a9e3936f57ee517437fff274cd5baa0d37a26fc7df9'
            '305305beaf8432c73988d645713d96a86e9f7258e51c54514ec2258259bad90c3867dc6f618ac3169f68c00afdbe3a6c9a5a90fa6174da246127b5e3be8beb48')

build() {
  #extract private_keys.py from .deb package to $${srcdir}
  ar x "${srcdir}/open-numismat_${pkgver}_all.deb" 'data.tar.zst'
  tar -xf './data.tar.zst'  './opt/venvs/open-numismat/lib/python3.10/site-packages/OpenNumismat/private_keys.py'
  mv './opt/venvs/open-numismat/lib/python3.10/site-packages/OpenNumismat/private_keys.py' './'
  
  cp -Tr "${_yearcalc_pkgname}-${_yearcalc_pkgver}" "./${pkgname}-${pkgver}/OpenNumismat/EditCoinDialog/YearCalculator"
  cp -Tr "${_imageeditor_pkgname}-${_imageeditor_pkgver}" "./${pkgname}-${pkgver}/OpenNumismat/ImageEditor"
  
  cd ${pkgname}-${pkgver}
  #python3 tools/build_resources.py
  python setup.py build

}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  local site_packages_dir=$(python -c "import site; print(site.getsitepackages()[0])")
  mv "${srcdir}/private_keys.py" "${pkgdir}/${site_packages_dir}/OpenNumismat/"

  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
