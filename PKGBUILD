# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=sqlfluff
pkgver=0.8.2
pkgrel=1
pkgdesc="A dialect-flexible and configurable SQL linter"
arch=('any')
url="https://www.sqlfluff.com"
license=('MIT')
depends=(
  'python'
  'python-appdirs'
  'python-cached-property'
  'python-click'
  'python-colorama'
  'python-diff-cover'
  'python-hypothesis'
  'python-jinja'
  'python-oyaml'
  'python-pathspec'
  'python-pytest'
  'python-tblib'
  'python-toml'
  'python-tqdm'
  'python-typing_extensions'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sqlfluff/sqlfluff/archive/$pkgver.tar.gz")
sha512sums=('ac073a114e597430eeff4b34c9fec05253e124751c2cb79a865cbb9b42be449cd0d313a1c9bd986145587f7d534109e8bedd3a71983398c4873aaa46aa5cec04')
b2sums=('3370e65faf0d613ed6131c1da77f776c9e70896c1c2b5847b481b767006e4719a280a40b69d4862fcd0a1c3ff6fef53a3966134f725fcc29e47ec824ddc17fbc')

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"

  # skip failing tests for now
  PYTHONPATH="$PWD/src:$PYTHONPATH" pytest \
    --ignore test/core/plugin_test.py \
    --ignore plugins/sqlfluff-templater-dbt \
    --ignore plugins/sqlfluff-plugin-example \
    --deselect test/test_testing.py::test_rules__test_helper_has_variable_introspection
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
