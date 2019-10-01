# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=('python-libffmpeg' 'python2-libffmpeg')
_pkgname=ffmpeg
pkgver=1.4
pkgrel=1
pkgdesc="ffmpeg python package"
arch=('any')
url="https://pypi.org/project/ffmpeg"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/f0/cc/3b7408b8ecf7c1d20ad480c3eaed7619857bf1054b690226e906fdf14258/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6931692c890ff21d39938433c2189747815dca0c60ddc7f9bb97f199dba0b5b9')

prepare() {
  cp -r "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_pkgname}-${pkgver}-2"

  cd "${srcdir}/${_pkgname}-${pkgver}/ffmpeg"
  sed -i "s/local\///" *.py
  sed -i "s/python2.7/python/" stream.py 

  cd "${srcdir}/${_pkgname}-${pkgver}-2/ffmpeg"
  sed -i "s/local\/bin\/python3/bin\/python2/" *.py
  sed -i "s/python2.7/python2/" stream.py 
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
  cd "${srcdir}/${_pkgname}-${pkgver}-2"
  python2 setup.py build
}

package_python-libffmpeg() {
  depends=(
    'ffmpeg' 
    'python' 
    'python2' # For stream.py
  )
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

package_python2-libffmpeg() {
  depends=(
    'ffmpeg' 
    'python2'
  )
  cd "${srcdir}/${_pkgname}-${pkgver}-2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
