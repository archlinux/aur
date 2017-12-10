# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase='crush'
pkgname=("python-${pkgbase}" "python2-${pkgbase}")
pkgver='1.0.35'
pkgrel='1'
pkgdesc='Library to control placement in a hierarchy.'
arch=('any')
url="https://github.com/ceph/python-${pkgbase}"
makedepends=(	'python' 'python-setuptools' 'python-d2to1' 'python-pbr'
		'python2' 'python2-setuptools' 'python2-d2to1' 'python2-pbr'
		'cmake' 'python-sphinx' 'python-mock')
license=('GPL')
source=("https://files.pythonhosted.org/packages/source/c/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('a0cfb6166965a9cf19d479a14a2909e02af67775772773eb91ab3089b8e2e759')

prepare() {
  # https://github.com/ceph/python-crush/pull/3
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # https://github.com/ceph/python-crush/pull/3
  sed -i 's|extension-crush.libcrush|extension=crush.libcrush|g' docs/dev/hacking.rst
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build_sphinx
}

package_python-crush() {
  depends=('python-d2to1' 'python-numpy' 'python-pandas' 'python-pbr'
	   'python-pyparsing' 'python-dateutil' 'python-pytz' 'python-six'
	   'python-appdirs' 'python-packaging')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

  mkdir -p "${pkgdir}/usr/share/doc/python-${pkgbase}"
  cp -ax "build/html/"* "${pkgdir}/usr/share/doc/python-${pkgbase}"
}

package_python2-crush() {
  depends=('python2-d2to1' 'python2-numpy' 'python2-pandas' 'python2-pbr'
	   'python2-pyparsing' 'python2-dateutil' 'python2-pytz' 'python2-six'
	   'python2-appdirs' 'python2-packaging')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"

  mkdir -p "${pkgdir}/usr/share/doc/python2-${pkgbase}"
  cp -ax "build/html/"* "${pkgdir}/usr/share/doc/python2-${pkgbase}"
}
