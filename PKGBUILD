# Maintainer: Igor R. Dejanović <igor dot dejanovic at gmail.com>

pkgname=python-textx
_srcname=textX
pkgver=2.2.0
pkgrel=1
pkgdesc="Python library for building Domain-Specific Languages and parsers"
arch=('any')
url="https://textx.github.io/textX/"
license=('MIT')
depends=('python' 'python-arpeggio' 'python-click')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pip' 'python-jinja')
source=($pkgname-$pkgver.tar.gz::https://github.com/textX/$_srcname/archive/v$pkgver.tar.gz)
md5sums=('486b93f50c7c2b5b129ebc80a804ee15')

build() {
  cd $_srcname-$pkgver
  python setup.py build
}

check() {
  cd $_srcname-$pkgver

  tmpdir=$(mktemp -d)
  export PYTHONUSERBASE="$tmpdir"

  # Install all tests projects
  prjs=(.
        tests/functional/subcommands/example_project
        tests/functional/registration/projects/types_dsl
        tests/functional/registration/projects/data_dsl
        tests/functional/registration/projects/flow_dsl
        tests/functional/registration/projects/flow_codegen)
  for prj in "${prjs[@]}"; do
    pip install --user -e "$prj" || exit 1
  done

  # Run all tests
  PATH="$tmpdir/bin:$PATH" pytest --ignore tests/perf

  # Uninstall all test projects
  pip uninstall -y textX || exit 1
  pip uninstall -y textX-subcommand-test || exit 1
  pip uninstall -y types_dsl || exit 1
  pip uninstall -y data_dsl || exit 1
  pip uninstall -y flow_dsl || exit 1
  pip uninstall -y flow_codegen || exit 1

  rm -rf "$tmpdir"
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
