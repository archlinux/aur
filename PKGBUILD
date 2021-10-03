# Maintainer: FederAndInk <federandink at gmail dot com>
pkgname='python-sismic'
_module='sismic'
pkgver='1.6.3'
pkgrel=2
pkgdesc="Interactive Statechart Model Interpreter and Checker"
url="https://github.com/AlexandreDecan/sismic/"
depends=('python' 'python-schema' 'python-behave' 'python-ruamel-yaml')
optdepends=('plantuml: interpret and convert generated files to png')
makedepends=('python-setuptools' 'python-sphinx-autodoc-typehints' 'python-sphinx')
checkdepends=('python-coverage' 'python-pytest' 'python-pytest-mock')
license=('LGPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('5db79edf20e2a6e731b613c5c0bc7e6727ff1643811ccb5b55462f4ed7ab081b')

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
