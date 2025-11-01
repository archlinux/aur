# Maintainer: gilcu3
# Previous Maintainer: Jack R <rubacha dot jack03 at gmail.com>
# Contributor: Jack R <rubacha dot jack03 at gmail.com>
pkgname=open-numismat
pkgver=1.10.3
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
sha512sums=('fa05fdb070d2fe4a71cece7c7695e46b1fb7d5c3a9ee1b6e1a9241e3906a51ea78d9e7eec9da70d2a741f390adccb5025d6879e65ba42ffa23020ba5797e5f64'
            '7bcab6a33df12ec2d2ba884de0819d6911a6731b3615c2b9b0523293f176d78e95b41fefb99f4e210ed99bbe9bae68042366de7855d4f8aaf3fca31bc2f1d03d'
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
