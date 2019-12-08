# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

pkgname=python-plantuml-git
pkgver=r14.93e1aac
pkgrel=1
pkgdesc="python interface to a plantuml web service instead of having to run java locally"
arch=('any')
url="https://github.com/dougn/${pkgname%-git}"
license=('BSD')
depends=('python-httplib2')
makedepends=("git" 'python-setuptools' 'python-sphinx')
optdepends=('plantuml: to use a local plantuml')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
	make -C docs/ man
}

check() {
	cd "$srcdir/${pkgname%-git}"
	python -m plantuml ./test/basic.txt
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 docs/_build/man/plantuml.1 "${pkgdir}/usr/share/man/man1/python-plantuml.1"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
