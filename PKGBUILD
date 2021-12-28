# Maintainer: Jack R <rubacha dot jack03 at gmail.com>

pkgname=open-numismat
pkgver=1.8.12
pkgrel=1
pkgdesc='Coin collecting software to organize and manage your own coin catalogue.'
arch=('any')
url="http://opennumismat.github.io"
license=('GPL3')
groups=('')
conflicts=('open-numismat-bin' 'open-numismat-git')
makedepends=('python-setuptools')
depends=('python' 'python-pyqt5' 'python-pyqt5-webengine' 'python-jinja' 'python-matplotlib' 'python-numpy' 'python-xlwt' 'python-xlrd' 'python-lxml' 'python-dateutil')
optdepends=(
  'python-pyodbc: import from CoinManage and Numizmatik_Ru')
options=('!strip' '!emptydirs')
source=("https://github.com/OpenNumismat/open-numismat/archive/refs/tags/${pkgver}.tar.gz" "https://github.com/OpenNumismat/open-numismat/releases/download/${pkgver}/open-numismat_${pkgver}_all.deb")
noextract=("open-numismat_${pkgver}_all.deb")
sha512sums=('a1b695d441992dcf5d9656d67416d6539746f82e93cab0d65923cc7d88db8e3cbcb43c2047d5be88a101b7b17e731ea4eae4a69570fd27605ddef0d7012bfa82' '26fa4a68c6bff3d2151a2a41589731d947c3cda464d3277b2191f18e9b09ce5f264a58dabdadbe202e82ef32ef4034bee2a9ffa409339fa03b572557aacc9e23')

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

  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmap/${pkgname}.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
