# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: graysky <graysky AT archlinux DOT us>

pkgname=ssh-audit
pkgver=2.9.0
pkgrel=1
pkgdesc='SSH configuration auditing'
arch=('any')
url='https://github.com/jtesta/ssh-audit'
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
checkdepends=('python-pytest')
_commit='3ba28b01e9d85969c8d2fb78a89f0628df9fe8a0'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$(pwd)/build/lib" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # man page
  install -vDm644 -t "$pkgdir/usr/share/man/man1" "$pkgname.1"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
