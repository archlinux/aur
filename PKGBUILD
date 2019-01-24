# Maintainer: Erich Eckner <arch at eckner dot net>

pkgbase=python-postpic
pkgname=(python-postpic python2-postpic)
pkgver=0.4
pkgrel=1
pkgdesc='The open source particle-in-cell post processor.'
url='https://github.com/skuschel/postpic'
arch=('i686' 'x86_64')
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
source=($pkgname-$pkgver.tar.gz::https://github.com/skuschel/postpic/archive/v$pkgver.tar.gz)
sha512sums=('4f3d9ed4ae70f0fb8ae4e2e690aa9dc683cb92c78b1daef2dd251ada9653b94d7b5bf688dae64e998f808ff812650c32d8a5570224a1d72d6b0123a803bb21ac')

prepare() {
  cp -a postpic-${pkgver}{,-py2}
}

build() {
  echo "Building python..."
  (cd postpic-${pkgver}
    python setup.py build
  )
  echo "Building python2..."
  (cd postpic-${pkgver}-py2
    python2 setup.py build
  )
}

check() {
  echo "Checking python..."
  (cd postpic-${pkgver}
    python setup.py test
  )
  echo "Checking python2..."
  (cd postpic-${pkgver}-py2
    python2 setup.py test
  )
}

package_python-postpic() {
  depends=(
    "${_deppy[@]}"
    "${_depends[@]}"
  )
  optdepends=("${_optdepends[@]}")

  cd postpic-${pkgver}
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

  cd postpic-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
  #install -Dm 644 CHANGES README -t "${pkgdir}"/usr/share/doc/${pkgname}
}

# vim: ts=2 sw=2 et:
