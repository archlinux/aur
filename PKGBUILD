# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgbase=python-ipympl
pkgname=(python2-ipympl python-ipympl python-ipympl-common)
_pkgname="${pkgbase#*-}"
pkgver=0.2.1
pkgrel=4
pkgdesc="Matplotlib Jupyter Extension"
url="https://pypi.org/project/ipympl/"
_deppy2=(
  'python2>=2.7'
  'python2<2.8'
)
_deppy=(
  'python>=3.7'
  'python<3.8'
)
_makedepends=(
  'python-setuptools'
  'jupyterlab'
)
license=('BSD')
arch=(any)
source=("https://pypi.python.org/packages/f3/ed/f7d73a5e35ca3423e65ef70a7de0f640bc24919ec4fc57d5f0c1b831f5ff/${_pkgname}-0.2.1.tar.gz")
sha256sums=('48ede51641bee78c32994cbd86b385714d61beb7d80c87f0cc1b70efb51dd5f5')

makedepends=(
  "${_deppy[@]}"
  "${_deppy2[@]}"
  "${_depends[@]}"
  "${_depends[@]//python/python2}"
  "${_makedepends[@]}"
  "${_makedepends[@]//ython/ython2}"
)
prepare() {
  cp -r ${_pkgname}-${pkgver}{,-py2}
}

build() {
  (
    echo "building python2"
    cd ${_pkgname}-${pkgver}-py2
    python2 setup.py build
    mkdir "${srcdir}/pkg-py2"
    python2 setup.py install --root="${srcdir}/pkg-py2/" --optimize=1 --skip-build
  )
  (
    echo "building python"
    cd ${_pkgname}-${pkgver}
    python setup.py build
    mkdir "${srcdir}/pkg"
    python setup.py install --root="${srcdir}/pkg/" --optimize=1 --skip-build
  )
  mkdir "${srcdir}/pkg-common"
  for s in "${srcdir}/pkg-py2" "${srcdir}/pkg"; do
    (
      cd "$s"
      find * -not -type d
    )
  done \
  | sort \
  | uniq -d \
  | grep -vxF LICENSE \
  | while read -r f; do
    diff "${srcdir}/pkg-py2/${f}" "${srcdir}/pkg/${f}" || return $?
    install -D "${srcdir}/pkg-py2/${f}" "${srcdir}/pkg-common/${f}"
    rm "${srcdir}/pkg/${f}" "${srcdir}/pkg-py2/${f}"
  done
  find "${srcdir}/pkg" "${srcdir}/pkg-py2" -depth -type d -empty -delete
}

package_python2-ipympl() {
  depends=(
    "${_deppy2[@]}"
    "${_depends[@]//python/python2}"
    'python-ipympl-common'
  )
  mv "${srcdir}/pkg-py2"/* "${pkgdir}/"
  install -D "${_pkgname}-${pkgver}-py2/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-ipympl() {
  depends=(
    "${_deppy[@]}"
    "${_depends[@]}"
    'python-ipympl-common'
  )
  mv "${srcdir}/pkg"/* "${pkgdir}/"
  install -D "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-ipympl-common() {
  mv "${srcdir}/pkg-common"/* "${pkgdir}/"
  mv "${pkgdir}/usr/etc" "${pkgdir}/"
}
