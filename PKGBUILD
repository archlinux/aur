# Maintainer: FederAndInk <federandink at gmail dot com>
pkgname='python-sismic'
_module='sismic'
pkgver='1.6.6'
pkgrel=1
pkgdesc="Interactive Statechart Model Interpreter and Checker"
url="https://github.com/AlexandreDecan/sismic/"
depends=('python' 'python-schema' 'python-behave' 'python-ruamel-yaml')
optdepends=('plantuml: interpret and convert generated files to png')
makedepends=('python-setuptools' 'python-sphinx-autodoc-typehints' 'python-sphinx')
checkdepends=('python-coverage' 'python-pytest' 'python-pytest-mock')
license=('LGPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('363e8fbce45479494965144311ce2e3ade1f08893abf8f97550fedb453ed2b60')

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build
  cd docs
  PYTHONPATH="${srcdir}/${_module}-${pkgver}" make man
}

check() {
  cd "${srcdir}/${_module}-${pkgver}"
  coverage run --source sismic -m pytest tests

  cd docs/examples/microwave/
  PYTHONPATH="${srcdir}/${_module}-${pkgver}" python -m unittest
}

package() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "docs/_build/man/sismic.1" "${pkgdir}/usr/share/man/man1/sismic.1"
}
