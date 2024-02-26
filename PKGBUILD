# Maintainer: gilcu3 <gilcu3 at gmail dot com>
# Previous Maintainer: Jack R <rubacha dot jack03 at gmail.com>

pkgname=open-numismat
pkgver=1.9.6
# since yearcalculator is tightly ingrained into open-numismat, use thr closest version of it to the one released (as submodules aren't bundled in github releases)
_yearcalc_pkgname=YearCalculator
_yearcalc_pkgver=0.2
_imageeditor_pkgname=ImageEditor
_imageeditor_pkgver=0.5
pkgrel=1
pkgdesc='Coin collecting software to organize and manage your own coin catalogue.'
arch=('any')
url="http://opennumismat.github.io"
license=('GPL3')
conflicts=('open-numismat-bin' 'open-numismat-git')
makedepends=('python-setuptools')
depends=('qt6-webchannel' 'qt6-charts' 'qt6-webengine' 'pyside6' 'python-dateutil' 'python-jinja' 'python-lxml' 'python-openpyxl' 'python-pillow' 'python-imagehash')
optdepends=(
  'python-pyodbc: import from CoinManage and Numizmatik_Ru')
options=('!strip' '!emptydirs')
source=("https://github.com/OpenNumismat/open-numismat/archive/refs/tags/${pkgver}.tar.gz" 
        "https://github.com/OpenNumismat/open-numismat/releases/download/${pkgver}/open-numismat_${pkgver}_all.deb"
        "https://github.com/OpenNumismat/YearCalculator/archive/refs/tags/${_yearcalc_pkgver}.tar.gz"
        "https://github.com/OpenNumismat/${_imageeditor_pkgname}/archive/refs/tags/${_imageeditor_pkgver}.tar.gz")
noextract=("open-numismat_${pkgver}_all.deb")
sha512sums=('39ccb7373517cd9f3fb37f3313f459791060b9362ecd6d5065f4fb025209360457574ac6606fa1faaf702862adcfc36181a3cbfd165b4bc3c934d6b6f5c8dd97'
            'a791c714dc358c6e28be1664e7b90b32be4c5bc919040259a2a72c0f4db123a684ef0cbfdd664c409d173ae92d864f60d4d2fa41f16eb33fff1b12063fe5c61b'
            'c0cc3c0f7425ada12f5f3a9cd4815c394fb0007863717ee47f8606e581a3449de74621b88c6e703ae7fc484364a914e536978eff23c649f93a128b044e342d33'
            '272d5bfa4c33596738b1d64251728984a446f5f2f2979e2d8392b41a8d334553d4dc1ddcf1fe5a525b51e9e122e3853f723ef7ed24572950cd140705f79ef6c2')

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
