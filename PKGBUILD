# Maintainer: fft <anonim288@gmail.com>

pkgname=open-numismat-git
tag_ver=1.8.8
pkgver=1.8.8.r2.g7378955
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
            '250b23ede902d0eee4b2c18eb65446d7f90093d148402a913c77e9077166c0de')

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
  local site_packages_dir=$(python -c "import site; print(site.getsitepackages()[0])")
  mv "${srcdir}/private_keys.py" "${pkgdir}/${site_packages_dir}/OpenNumismat/"
}
