# Maintainer: Jack R <rubacha dot jack03 at gmail.com>

pkgname=open-numismat
pkgver=1.8.16
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
sha512sums=('e6daa67c0a88a8e59ff67b1463e37c2d8ccd74448200432eee047525a954e9920ab57042ad86f8649785590d48fa6da3063d0a831e3f9a9dcc2a4e5a61bad611'
            '716b50265d13f67d5a5f116eebe4584d71d5527c510a51c1c5a6ba0ad4378363553dee6953995df6e083fd8b3cda77d338a43b57534432528f4a335a1b85713f')

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
