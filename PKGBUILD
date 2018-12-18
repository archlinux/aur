# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=htmlmin
pkgbase=python-htmlmin
pkgname=('htmlmin' 'python-htmlmin' 'python2-htmlmin')
pkgver=0.1.12
_gitcommit=220b1d16442eb4b6fafed338ee3b61f698a01e63
pkgrel=1
pkgdesc='Configurable HTML Minifier with safety features'
url='https://htmlmin.readthedocs.io/en/latest/'
arch=('any')
license=('BSD')
makedepends=('python-sphinx' 'python-setuptools'
             'python2-sphinx' 'python2-setuptools')
checkdepends=('python-pytest'
              'python2-pytest')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/mankyd/htmlmin/archive/${_gitcommit}.tar.gz)
sha256sums=('9d96f711d1f3d997f29bf83e704fc8dae0233beb400afa278792ff8349cd22a2')
sha512sums=('6d9db4b6bcdd6d223be8b4e3830da4d63ac6d7d28ee83abd97809b0b901968c994c8434c992fbdd148101ba25d8d786c93657cb5f82881af44dadbba40bf3252')

prepare() {
  cp -ra ${_pkgname}-${_gitcommit}{,-py2}
  sed 's|env python|env python2|' -i ${_pkgname}-${_gitcommit}-py2/htmlmin/command.py
}

build() {
  msg2 "Building python..."
  (cd ${_pkgname}-${_gitcommit}
    python setup.py build
    sphinx-build -b text docs docs/_build/text
    sphinx-build -b man docs docs/_build/man
  )
  msg2 "Building python2..."
  (cd ${_pkgname}-${_gitcommit}-py2
    python2 setup.py build
    sphinx-build2 -b text docs docs/_build/text
    sphinx-build2 -b man docs docs/_build/man
  )
}

check() {
  msg2 "Checking python..."
  (cd ${_pkgname}-${_gitcommit}
    python setup.py test
  )
  msg2 "Checking python2..."
  (cd ${_pkgname}-${_gitcommit}-py2
    python2 setup.py test
  )
}

package_htmlmin() {
  depends=('python' 'python-setuptools' 'python-htmlmin')
  pkgdesc+=' (CLI)'
  cd ${_pkgname}-${_gitcommit}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -d "${pkgdir}/usr/share/"{licenses,doc,man/man1}
  ln -s /usr/share/licenses/python-htmlmin "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/doc/python-htmlmin "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s /usr/share/man/man1/python-htmlmin.1.gz "${pkgdir}/usr/share/man/man1/htmlmin.1.gz"

  rm -r "${pkgdir}"/usr/lib
}

package_python-htmlmin() {
  depends=('python')
  cd ${_pkgname}-${_gitcommit}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README.rst CHANGELOG -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/htmlmin.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"

  rm -r "${pkgdir}"/usr/lib/python*/site-packages/htmlmin/tests \
    "${pkgdir}/usr/bin"
}

package_python2-htmlmin() {
  depends=('python2')
  cd ${_pkgname}-${_gitcommit}-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README.rst CHANGELOG -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/htmlmin.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"

  rm -r "${pkgdir}"/usr/lib/python*/site-packages/htmlmin/tests \
    "${pkgdir}/usr/bin"
}

# vim: ts=2 sw=2 et:
