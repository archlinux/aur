# Maintainer: Jack R <rubacha dot jack03 at gmail.com>

pkgname=open-numismat
pkgver=1.9.5
# since yearcalculator is tightly ingrained into open-numismat, use thr closest version of it to the one released (as submodules aren't bundled in github releases)
_yearcalc_pkgname=YearCalculator
_yearcalc_pkgver=0.2
pkgrel=1
pkgdesc='Coin collecting software to organize and manage your own coin catalogue.'
arch=('any')
url="http://opennumismat.github.io"
license=('GPL3')
conflicts=('open-numismat-bin' 'open-numismat-git')
makedepends=('python-setuptools')
depends=('qt6-webchannel' 'qt6-charts' 'qt6-webengine' 'pyside6' 'python-dateutil' 'python-jinja' 'python-lxml' 'python-openpyxl' 'python-pillow')
optdepends=(
  'python-pyodbc: import from CoinManage and Numizmatik_Ru')
options=('!strip' '!emptydirs')
source=("https://github.com/OpenNumismat/open-numismat/archive/refs/tags/${pkgver}.tar.gz" 
        "https://github.com/OpenNumismat/open-numismat/releases/download/${pkgver}/open-numismat_${pkgver}_all.deb"
        "https://github.com/OpenNumismat/YearCalculator/archive/refs/tags/${_yearcalc_pkgver}.tar.gz")
noextract=("open-numismat_${pkgver}_all.deb")
sha512sums=('1080c395f66628dfc02f6d5fcdf09c117d79555eee4aa5b72e00e3d94697bcaa06a1817f99e68f1bdeae55f277953bed954cd0475c0e4158ed292b0afbca96f1'
            '87789bc82e4fc7bf7a0dce372026ff060ea81bbc13e46c55d23c6e88a48d5898cd842bd9e34d8e98812d455d58d38a1d6cd3935200577587eac8648eea8186d4'
            'c0cc3c0f7425ada12f5f3a9cd4815c394fb0007863717ee47f8606e581a3449de74621b88c6e703ae7fc484364a914e536978eff23c649f93a128b044e342d33')

build() {
  #extract private_keys.py from .deb package to $${srcdir}
  ar x "${srcdir}/open-numismat_${pkgver}_all.deb" 'data.tar.zst'
  tar -xf './data.tar.zst'  './opt/venvs/open-numismat/lib/python3.10/site-packages/OpenNumismat/private_keys.py'
  mv './opt/venvs/open-numismat/lib/python3.10/site-packages/OpenNumismat/private_keys.py' './'
  
  cp -Tr "${_yearcalc_pkgname}-${_yearcalc_pkgver}" "./${pkgname}-${pkgver}/OpenNumismat/EditCoinDialog/YearCalculator"

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
