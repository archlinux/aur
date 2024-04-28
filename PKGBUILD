# Contributor: Vianney le Clément <vleclement AT gmail · com>

pkgname=python-supergenpass-git
pkgver=r13.fc9e077
pkgrel=1
epoch=1
pkgdesc="SuperGenPass Python module and GTK interface"
arch=(any)
url="https://github.com/vianney/python-supergenpass"
license=('GPL3')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('gtk3: for GTK interface'
            'python-gobject: for GTK interface'
            'python-cairo: for GTK interface')
source=("git+${url}.git"
        "0001-Force-gtk-version-before-import.patch")
sha256sums=('SKIP'
            '8bea90e25aa5116cb0e385272daca3ae7be6c745c72e1dc54aa5481f5d9b8304')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  patch -d "${pkgname%-git}" -p1 < 0001-Force-gtk-version-before-import.patch
}

build() {
  cd "${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim:set ts=2 sw=2 et:
