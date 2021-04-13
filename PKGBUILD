# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Rémy Oudompheng <remy@archlinux.org>
# Maintainer: emersion <contact emersion fr>

pkgbase=python-pyelftools-git
pkgname=('python2-pyelftools-git' 'python-pyelftools-git')
_pkgname=pyelftools
pkgver=v0.27.r7.g46187f4
pkgrel=1
pkgdesc='Python library for analyzing ELF files and DWARF debugging information'
url='https://github.com/eliben/pyelftools'
arch=('any')
license=('custom:Public Domain')
makedepends=('python-setuptools' 'python2-setuptools' 'git')
options=('!strip')
source=('git+https://github.com/eliben/pyelftools.git')
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -ra ${_pkgname}{,-py2}
  cd ${_pkgname}-py2
  sed -e 's/env python$/env python2/g' -i scripts/readelf.py
  mv scripts/readelf.py scripts/readelf.py2
  sed -r 's/readelf.py/\02/g' -i setup.py test/run_readelf_tests.py
}

build() {
  (cd ${_pkgname}
    python setup.py build
  )
  (cd ${_pkgname}-py2
    python2 setup.py build
  )
}

check() {
  (cd ${_pkgname}
    python test/run_all_unittests.py
    python test/run_examples_test.py
    if [ "${CARCH}" == "x86_64" ]; then
      python test/run_readelf_tests.py
    else
      warning "Skipping readelf tests (require x86_64)"
    fi
  )
  (cd ${_pkgname}-py2
    python2 test/run_all_unittests.py
    python2 test/run_examples_test.py
    if [ "${CARCH}" == "x86_64" ]; then
      python2 test/run_readelf_tests.py
    else
      warning "Skipping readelf tests (require x86_64)"
    fi
  )
}

package_python-pyelftools-git() {
  depends=('python')
  provides=('python-pyelftools')
  conflicts=('python-pyelftools')

  cd ${_pkgname}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst CHANGES -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
}

package_python2-pyelftools-git() {
  depends=('python2')
  provides=('python2-pyelftools')
  conflicts=('python2-pyelftools')

  cd ${_pkgname}-py2
  python2 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst CHANGES -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
}
