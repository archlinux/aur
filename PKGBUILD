# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=('python-sqlalchemy-git' 'python2-sqlalchemy-git')
pkgver=1.4.0b1.rc11996.ae14861a3
pkgrel=1
pkgdesc="Python SQL toolkit and Object Relational Mapper"
arch=('i686' 'x86_64')
url="http://www.sqlalchemy.org"
license=('custom:MIT')
makedepends=('git' 'python' 'python2' 'python-setuptools')
source=("git+https://github.com/sqlalchemy/sqlalchemy.git")
md5sums=('SKIP')

pkgver() {
  cd sqlalchemy
  printf %s.rc%s.%s "$(awk '/\:version\:/ {print $2}' doc/build/changelog/changelog_*|sort|tail -1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -r sqlalchemy sqlalchemy2
}

build() {
  cd sqlalchemy
  python setup.py build

  cd "$srcdir"/sqlalchemy2
  python2 setup.py build
}

package_python-sqlalchemy-git() {
  provides=("python-sqlalchemy=$pkgver")
  conflicts=('python-sqlalchemy')
  depends=('python')
  cd sqlalchemy
  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE \
	  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-sqlalchemy-git() {
  provides=("python2-sqlalchemy=$pkgver")
  conflicts=('python2-sqlalchemy')
  depends=('python2')
  cd sqlalchemy2
  python2 setup.py install --root="$pkgdir"
  install -D -m644 LICENSE \
	  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
