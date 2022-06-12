# Maintainer: Dashon Wells <me@me.me>

pkgname='cattqt'
pkgver=3.0
pkgrel=1
pkgdesc='A control GUI for Chromecasts written using python3, catt api, pychromecast and PyQt5.'
arch=('any')
url=https://github.com/soreau/"${pkgname}"
license=('GPLv3')

depends=(
  'python'
  'python-pyqt5'
  'catt'
  'python-pychromecast>=7.5.0')

makedepends=('python-setuptools')

# I am grabbing the package from pypi because the github repo seems
# to be using flit to generate the setup.py file and I couldn't figure out
# how to use it
source=(
https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz
"catt-qt.desktop"
"patch"
)
sha256sums=(
'5815f759367554ca3961740f646d86b205667ce140f4c7f58210dc23314fa809'
'5c9b0c9cfc688c489155b78719bb08b93122db297fdf334df1fb4d1d46b9d40d'
'458c785d85542b7f79eb3c2fe43cac58cc5007f9f02fca732462d37adfad69d0'
)

build(){
  # this package breaks with python version 3.10. I currently have a pr open
  # to fix the issue, but for now we will just patch it
  mv patch "${srcdir}"/"${pkgname}"-"${pkgver}"
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

   patch -p0 < patch
  python setup.py build
}

package() {
 # catt-qt doesn't have a desktop icon so I made one for convenience
 # install Desktop icon before switching directories
  install -Dm644 catt-qt.desktop "${pkgdir}"/usr/share/applications/catt-qt.desktop

  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -Dm644 README.rst "${pkgdir}"/usr/share/doc/"${pkgname}"/README.rst
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm644 cattqt/chromecast.png "${pkgdir}"/usr/share/icons/"${pkgname}".png
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
