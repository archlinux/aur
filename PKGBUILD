# Maintainer: Jack R <rubacha dot jack03 at gmail.com>

pkgname=open-numismat
pkgver=1.8.22
pkgrel=1
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
sha512sums=('ad496b9b14857c6e7df38a481135dc1f76958b5617197844cdd82b13bd720d9c348e7af6ca1b75ab80dd8ea8873c7a3febe30ad54c097fbd481c0cd4f1d42e06'
            '254c85e84eb6e85a3916e03567df72383123a354375a9013084539c2642d57e6c8e3f8be5b1295bc774ebd0ac18d5d2cf24e77ea83fd453d418174f5bca0f667')

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
