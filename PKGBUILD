# Maintainer: Igor R. Dejanović <igor dot dejanovic at gmail.com>
# Contributor: Xiretza <xiretza at xiretza dot xyz>

pkgname=python-textx
_srcname=textX
pkgver=3.1.1
pkgrel=1
pkgdesc="Python library for building Domain-Specific Languages and parsers"
arch=('any')
url="https://textx.github.io/textX/"
license=('MIT')
depends=('python' 'python-setuptools' 'python-arpeggio' 'python-future')
optdepends=('python-click: textX CLI support')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-runner' 'python-pip' 'python-jinja' 'python-click' 'python-html5lib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/textX/$_srcname/archive/$pkgver.tar.gz")
sha256sums=('18ecd288aaba27d361fd421986088a139773ca7ed29cbddf9f7d6f8003314b6e')

build() {
  cd $_srcname-$pkgver
  python -m build --wheel --no-isolation
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
    pip install \
      --user \
      --no-index \
      --no-build-isolation \
      --find-links ./ \
      --editable \
      "$prj" || exit 1
  done

  # Run all tests
  PATH="$tmpdir/bin:$PATH" pytest --ignore tests/perf

  rm -rf "$tmpdir"
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
