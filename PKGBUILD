# Maintainer: Jack R <rubacha dot jack03 at gmail.com>

pkgname=open-numismat
pkgver=1.8.20
pkgrel=2
pkgdesc='Coin collecting software to organize and manage your own coin catalogue.'
arch=('any')
url="http://opennumismat.github.io"
license=('GPL3')
conflicts=('open-numismat-bin' 'open-numismat-git')
makedepends=('python-setuptools')
depends=('python' 'python-pyqt5' 'python-pyqt5-webengine' 'python-jinja' 'python-matplotlib' 'python-numpy' 'python-xlwt' 'python-xlrd' 'python-lxml' 'python-dateutil')
optdepends=(
  'python-pyodbc: import from CoinManage and Numizmatik_Ru')
options=('!strip' '!emptydirs')
source=("https://github.com/OpenNumismat/open-numismat/archive/refs/tags/${pkgver}.tar.gz" "https://github.com/OpenNumismat/open-numismat/releases/download/${pkgver}/open-numismat_${pkgver}_all.deb")
noextract=("open-numismat_${pkgver}_all.deb")
sha512sums=('8daaee80ce68c27bd400a628d0803ce40ce3fc91abcd7e186b3e29a2dea0b571fa72715c7babd6076966476b7694b341f0fa968482055ba418224eb7c0ceb851'
            'e0187b1e5102f0bfea4f6af13b243b97bfd89ac891a60ea09f95f6201feb53305ea68b3facecc42a517ca051da1c5ec333f812434e30a8dce1936b2155c4207a')

build() {
  #extract private_keys.py from .deb package to $${srcdir}
  ar x "${srcdir}/open-numismat_${pkgver}_all.deb" 'data.tar.xz'
  tar -xf './data.tar.xz'  './usr/lib/python3/dist-packages/OpenNumismat/private_keys.py'
  mv './usr/lib/python3/dist-packages/OpenNumismat/private_keys.py' './'

  cd ${pkgname}-${pkgver}
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
