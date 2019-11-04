# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Stunts <f.pinamartins at gmail dot com>
# Contributor: damir <damir at archlinux dot org>

pkgbase=python-biopython
pkgname=('python-biopython' 'python2-biopython')
_pkgname=biopython
pkgver=1.73
pkgrel=2
pkgdesc="Freely available Python tools for computational molecular biology"
arch=('x86_64')
url="http://www.biopython.org"
license=('custom')
makedepends=('python-setuptools' 'python2-setuptools')
depends=('python-numpy' 'python2-numpy')
source=(http://www.biopython.org/DIST/${_pkgname}-${pkgver}.tar.gz)
changelog=ChangeLog
sha512sums=('d067330ef8e25ca6881b56f4e5e89e16a816c89760473e2f32a6236ab202f805294650aa944f0b098987425bcb65727317da7a26deb4d4937f02b00123ea9a8f')

prepare() {
  cp -r "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py2"
  # change python to python2
  find "${_pkgname}-${pkgver}-py2" -name '*.py' -type f -exec \
      sed -i 's|env python|env python2|' {} \;
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py build
}

package_python-biopython() {
  depends=('python-numpy')
  optdepends=('python-mysql-connector: for BioSQL module')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-biopython() {
  depends=('python2-numpy')
  optdepends=('python2-reportlab: for pdf graphics code'
              'python2-mysql-connector: for BioSQL module'
              'mysql-python: for BioSQL module')

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

