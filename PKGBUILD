# Maintainer: Dashon Wells <me@me.me>

pkgname='catt-qt'
pkgver=4.0
pkgrel=1
pkgdesc='A control GUI for Chromecasts written using python3, catt api, pychromecast and PyQt5.'
arch=('any')
url=https://github.com/soreau/catt-qt
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
"setup.py"
)
sha256sums=(
'b1a14f339844ab8dbccce5690a665ae0212f982313681b1a5fd3afcc6af3ea37'
'5c9b0c9cfc688c489155b78719bb08b93122db297fdf334df1fb4d1d46b9d40d'
"bf371892e6960054dc26ca3ca3e88f3fe6ca2ed72b95a84d1a79c93cf900c4e8"
)

build() {
  mv  setup.py "${srcdir}"/"${pkgname}"-"${pkgver}"
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
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
