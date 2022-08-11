# Maintainer: Igor R. Dejanović <igor dot dejanovic at gmail.com>
# Contributor: Xiretza <xiretza at xiretza dot xyz>

pkgname=python-textx
_srcname=textX
pkgver=3.0.0
pkgrel=1
pkgdesc="Python library for building Domain-Specific Languages and parsers"
arch=('any')
url="https://textx.github.io/textX/"
license=('MIT')
depends=('python' 'python-arpeggio' )
optdepends=('python-click: textX CLI support')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pip' 'python-jinja' 'python-click')
source=($pkgname-$pkgver.tar.gz::https://github.com/textX/$_srcname/archive/$pkgver.tar.gz)
md5sums=('6d868822583d86f66cda71f40b1bebb5')

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
    pip install --user --no-index -f ./ -e "$prj" || exit 1
  done

  # Run all tests
  PATH="$tmpdir/bin:$PATH" pytest --ignore tests/perf

  rm -rf "$tmpdir"
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
