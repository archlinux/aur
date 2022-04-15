# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-privy-git
_name=privy
pkgver=6.0.0.r67.624bb58
pkgrel=3
pkgdesc="An easy, fast lib to correctly password-protect your data"
arch=('any')
url="https://github.com/ofek/privy"
license=('MIT' 'Apache')
depends=('python-cryptography' 'python-argon2_cffi')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ofek/privy.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  printf "$(python setup.py --version).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_name"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir/$site_packages/tests"

  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
