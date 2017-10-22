# Maintainer: Pochang Chen <johnchen902@gmail.com>

pkgbase=python-nclib-git
pkgname=(python-nclib-git python2-nclib-git)
_name=nclib
pkgver=r40.9213d5b
pkgrel=1
pkgdesc="Netcat as a library"
license=("MIT")
arch=('any')
url="https://github.com/rhelmot/nclib"
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=('git+https://github.com/rhelmot/nclib.git')
md5sums=('SKIP')

prepare() {
	cd "$srcdir"
    cp -aTf nclib{,-py2}
}

pkgver() {
  cd "${srcdir}/nclib"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"/nclib
    python setup.py build
	cd "$srcdir"/nclib-py2
    python2 setup.py build
}

check() {
	cd "$srcdir"/nclib
    python setup.py test
	cd "$srcdir"/nclib-py2
    python2 setup.py test
}

package_python-nclib-git() {
    depends=('python')
    conflicts=('python-nclib')
    provides=('python-nclib')
	cd "$srcdir"/nclib
    python setup.py install -O1 --root="$pkgdir"
    install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-nclib-git() {
    depends=('python2')
    conflicts=('python2-nclib')
    provides=('python2-nclib')
	cd "$srcdir"/nclib-py2
    python2 setup.py install -O1 --root="$pkgdir"
    for file in "$pkgdir"/usr/bin/*; do
        mv "$file" "$file"2
    done
    install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
