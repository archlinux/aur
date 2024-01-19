# Maintainer: fft

pkgname=open-numismat-git
tag_ver=1.9.5
pkgver=1.9.6.r0.g6b65b2c9
pkgrel=1
pkgdesc='Application to create, organize and manage coin catalogue'
arch=('any')
url="https://opennumismat.github.io/open-numismat/"
license=('GPL-3.0-only')
makedepends=('git' 'python-setuptools')
depends=('pyside6' 'python-dateutil' 'python-jinja' 'python-imagehash' 'python-lxml' 'python-numpy' 'python-opencv' 'python-openpyxl' 'python-pillow' 'python-pyqt6-charts')
source=("${pkgname}::git+https://github.com/OpenNumismat/open-numismat.git#branch=master"
        "https://github.com/OpenNumismat/YearCalculator.git"
        "https://github.com/OpenNumismat/open-numismat/releases/download/${tag_ver}/open-numismat_${tag_ver}_all.deb")
sha256sums=('SKIP'
            'SKIP'
            'c419e9c480f13b74b008780dc97db3dbf991145266c435ef00e84cd7559e13b7')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
  cd ${pkgname}
  git submodule init
  git submodule update
}

build() {
  #extract private_keys.py from .deb package to ${srcdir}
  ar x "${srcdir}/open-numismat_${tag_ver}_all.deb" 'data.tar.zst'
  tar -xf './data.tar.zst' './opt/venvs/open-numismat/lib/python3.10/site-packages/OpenNumismat/private_keys.py'
  mv './opt/venvs/open-numismat/lib/python3.10/site-packages/OpenNumismat/private_keys.py' './'

  cd ${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  local site_packages_dir=$(python -c "import site; print(site.getsitepackages()[0])")
  mv "${srcdir}/private_keys.py" "${pkgdir}/${site_packages_dir}/OpenNumismat/"
}
