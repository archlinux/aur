# Maintainer: éclairevoyant

_gitname=pympv
pkgname="python-$_gitname-git"
pkgver=0.8.0.r2.a971cf4
pkgrel=1
pkgdesc="A Python wrapper for libmpv"
arch=('i686' 'x86_64')
url="https://github.com/marcan/$_gitname"
license=('GPL3')
depends=('mpv' 'python')
makedepends=('cython' 'git' 'python-setuptools')
provides=('python-pympv')
conflicts=('python-mpv' 'python-pympv')
source=("git+$url.git")
b2sums=('SKIP')

pkgver () {
	cd $_gitname
	_version_blame="$(git blame -s -L/version=/,+1 setup.py)"
	printf "%s.r%s.%s" \
		"$(echo $_version_blame | sed 's/.*="\(.*\)",/\1/')" \
		"$(echo $_version_blame | awk '{system("git rev-list --count "$1"..HEAD")}')" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd $_gitname
	python setup.py build
}

package() {
	cd $_gitname
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
