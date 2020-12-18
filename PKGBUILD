# Maintainer: leuko <leuko_aydos_de>
pkgname=python-nbgrader-git
provides=('python-nbgrader')
conflicts=('python-nbgrader')
pkgver=r2892.3aa5af2a
pkgrel=1
pkgdesc="A system for assigning and grading notebooks"
arch=(any)
url="https://github.com/jupyter/nbgrader"
license=(BSD)
depends=(
	python
	python-setuptools  # used at runtime for dep. checking (thanks to loqs)
	python-sqlalchemy
	python-dateutil
	python-traitlets
	python-tornado
	python-requests
	python-jsonschema
	python-alembic
	python-rapidfuzz
	jupyter
	jupyter-notebook
	jupyter-nbconvert
	jupyter-nbformat
	python-jupyter_core
	python-jupyter_client
)
makedepends=("python-setuptools" "git")
source=("git+https://github.com/jupyter/nbgrader")
md5sums=('SKIP')
pkgver() {
        cd nbgrader
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
        cd nbgrader
	# https://bbs.archlinux.org/viewtopic.php?pid=1942534
	# https://bugs.archlinux.org/index.php?do=details&task_id=68884
	sed -Ei 's/^(\s*)("jupyter")/\1#\2/' setup.py
}
build() {
        cd "$srcdir/nbgrader"
	python setup.py build
}
package() {
        cd "$srcdir/nbgrader"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
