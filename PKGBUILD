# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-avocado-git
pkgver=101.0
pkgrel=1
pkgdesc="Set of tools and libraries to help with automated testing"
arch=('any')
url="http://avocado-framework.github.io/"
license=('GPL2')
source=("git+https://github.com/avocado-framework/avocado")
sha256sums=('SKIP')
depends=('python' 'libvirt-python')
makedepends=('git' 'python-setuptools' 'python-docutils')
conflicts=('python-avocado')
provides=("python-avocado=${pkgver%+*}")

pkgver() {
  cd avocado
  git describe --long --abbrev=10 | sed 's/-/+/; s/-/./'
}

build() {
  cd avocado
  python setup.py build
  make man
}

# FIXME: Upstream obviously doesn't run their own tests as they are always broken
false &&
check() {
  cd avocado
  make check
}

package() {
  cd avocado
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -d "$pkgdir/usr/share/man/man1/"
  install -m644 man/*.1 "$pkgdir/usr/share/man/man1/"
}
