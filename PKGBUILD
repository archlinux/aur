# Maintainer: Mattia Moffa <mattia@moffa.xyz>

pkgname=virtualbricks-develop-git
pkgver=r2169.1017943
pkgrel=2
pkgdesc="Qemu/KVM and VDE frontend (git development branch)"
arch=('any')
url="https://github.com/virtualsquare/virtualbricks"
license=('GPL2')
depends=('python-gobject' 'python-pillow' 'python-pygraphviz' 'python-twisted' 'python-zope-interface' 'vde2' 'qemu-full')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=("vde-netemu-git: channel emulator support")
provides=("virtualbricks=$pkgver")
conflicts=("virtualbricks")
source=('virtualbricks::git+https://github.com/virtualsquare/virtualbricks.git#branch=develop'
        'virtualbricks.patch')
sha256sums=('SKIP'
            'd62e8df03f9ca96d6b6e1c271eeeed2fd6276f79ab37d7d12ad8a93e8b9731c7')

pkgver() {
  cd virtualbricks
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd virtualbricks
  patch --strip=1 --input="${srcdir}/virtualbricks.patch"
}

build() {
  cd virtualbricks
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="$pkgdir" virtualbricks/dist/*.whl
}
