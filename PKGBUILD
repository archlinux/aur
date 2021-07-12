# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=python-taskipy
_pkgname="${pkgname#python-}"
pkgver=1.8.1
pkgrel=1
pkgdesc="The complementary task runner for Python"
arch=('any')
url="https://github.com/illBeRoy/taskipy"
license=('MIT')
depends=('python' 'python-toml' 'python-psutil' 'python-colorama')
makedepends=('python-poetry' 'python-pip')
optdepends=()
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  'remove-mslex.patch'
)
b2sums=('82a6d49d2b463741b96dd5637c59bc14baac8d6ea04d95e8d4f74d5d8d6fc5c9d5994340a2e31d4809690dbb347c948b4038f4580a24bf41cdb4fe3875c9035c'
        'c0bfa11252c845d0ef85811df706bf1ab8e976f45576c1d5420f37ef3797b2a63ecbf02012467f5bc76022fb61be03a83f413b93caef817227d7850b89ad809d')

prepare() {
  cd "$_pkgname-$pkgver"
  # remove traces of Windows-only dependency
  patch -p 1 -i "$srcdir/remove-mslex.patch"
}

build() {
  cd "$_pkgname-$pkgver"
  poetry build --format wheel
}

package() {
  cd "$_pkgname-$pkgver"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
