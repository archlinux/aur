# Maintainer: Evgenii Alekseev

_pkgname=aiohttp-apispec
pkgname=python-$_pkgname-git
pkgver=3.0.0b2.r8.ge37d587
pkgrel=3
pkgdesc='Build and document REST APIs with aiohttp and apispec (git version)'
arch=('any')
url='https://github.com/maximdanilchenko/aiohttp-apispec'
license=('MIT')
depends=('python-aiohttp' 'python-apispec' 'python-jinja' 'python-webargs')
makedepends=('git' 'python-setuptools')
conflicts=("python-$_pkgname")
provides=("python-$_pkgname=${pkgver%.r*}")
source=("$pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^[A-Za-z]*//'
}

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  # we don't need to distribute examples
  rm -r "$pkgdir$(python -c 'import site; print(site.getsitepackages()[0])')/example"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
