# Maintainer: fft <anonim288@gmail.com>

pkgname=open-numismat-git
tag_ver=1.8.0
pkgver=1.8.0.r26.gbe32c39
pkgrel=1
pkgdesc='Application to create, organize and manage coin catalogue'
arch=('any')
url="https://opennumismat.github.io/open-numismat/"
license=('GPL3')
makedepends=('git' 'python-setuptools')
depends=('python' 'python-pyqt5' 'python-xlrd' 'python-numpy' 'python-matplotlib' 'python-jinja' 'python-lxml' 'python-dateutil')
optdepends=(
  'python-xlwt: export to excel'
  'python-pyodbc: import from CoinManage and Numizmatik_Ru')
source=("${pkgname}::git+https://github.com/OpenNumismat/open-numismat.git#branch=master"
        "https://github.com/OpenNumismat/open-numismat/releases/download/${tag_ver}/open-numismat_${tag_ver}_all.deb")
sha256sums=('SKIP'
            '268588d76ee3c9c6f337e6f5d67563f9088d84d725e619b7da0c0241167789c8')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  #extract private_keys.py from .deb package to $${srcdir}
  ar x "${srcdir}/open-numismat_${tag_ver}_all.deb" 'data.tar.xz'
  tar -xf './data.tar.xz'  './usr/lib/python3/dist-packages/OpenNumismat/private_keys.py'
  mv './usr/lib/python3/dist-packages/OpenNumismat/private_keys.py' './'

  cd ${pkgname}
  python setup.py build

}

package() {
  cd ${pkgname}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  mv "${srcdir}/private_keys.py" "${pkgdir}/usr/lib/python3.7/site-packages/OpenNumismat/"
}
