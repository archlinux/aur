# Maintainer: Erich Eckner <arch at eckner dot net>

pkgbase=python-postpic
pkgname=(python-postpic python2-postpic)
_pkgname="${pkgbase#*-}"
pkgver=0.4
pkgrel=2
pkgdesc='The open source particle-in-cell post processor.'
url='https://github.com/skuschel/postpic'
arch=('i686' 'pentium4' 'x86_64')
license=('GPL3')
_deppy2=(
  'python2>=2.7'
  'python2<2.8'
)
_deppy=(
  'python>=3.7'
  'python<3.8'
)
_depends=(
  'python-matplotlib' 'python-numpy>=1.7' 'python-scipy' 'python-future' 'python-urllib3' 'python-numexpr'
)
_makedepends=(
  'python-setuptools'
  'cython'
  'python-h5py'
)
_optdepends=(
  'python-h5py: h5 reader for openPMD support'
  'python-sdf:  sdf support for EPOCH reader'
)
makedepends=(
  "${_deppy[@]}"
  "${_deppy2[@]}"
  "${_depends[@]}"
  "${_depends[@]/python/python2}"
  "${_makedepends[@]}"
  "${_makedepends[@]/ython/ython2}"
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/skuschel/${_pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('c1a2ce68e7df5c4f16b01f46d2e171ac48c3eeddc7b2c219c6b070df5e4e4521b81ff9b7b45b514ff78b4866a1bfa44ad83ce357865c59d3b4f86e274d81fe69')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
}

build() {
  echo "Building python..."
  (cd ${_pkgname}-${pkgver}
    python setup.py build
  )
  echo "Building python2..."
  (cd ${_pkgname}-${pkgver}-py2
    python2 setup.py build
  )
}

check() {
  echo "Checking python..."
  (cd ${_pkgname}-${pkgver}
    python setup.py test
  )
  echo "Checking python2..."
  (cd ${_pkgname}-${pkgver}-py2
    python2 setup.py test
  )
}

package_python-postpic() {
  depends=(
    "${_deppy[@]}"
    "${_depends[@]}"
  )
  optdepends=("${_optdepends[@]}")

  cd ${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
  #install -Dm 644 CHANGES README -t "${pkgdir}"/usr/share/doc/${pkgname}
}

package_python2-postpic() {
  depends=(
    "${_deppy2[@]}"
    "${_depends[@]/python/python2}"
  )
  optdepends=("${_optdepends[@]/python/python2}")

  cd ${_pkgname}-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
  #install -Dm 644 CHANGES README -t "${pkgdir}"/usr/share/doc/${pkgname}
}

# vim: ts=2 sw=2 et:
