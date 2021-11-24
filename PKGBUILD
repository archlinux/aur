# Maintainer: leuko <leuko_aydos_de>
# WARNING: as of 2021-11-24 parts of nbgrader still depend on older packages,
# so you should use it in a virtualenv. This package is still useful if you
# want to at least distribute the UI parts (HTML+CSS+Javascript) system-wide
# for students. Teachers can then work with formgrader in a virtualenv

pkgname=python-nbgrader-git
provides=('python-nbgrader')
conflicts=('python-nbgrader')
pkgver=r3017.1ae2886e
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

	# remove version pins to avoid installing old versions. This is not tested
	# and may break things.
	sed -Ei 's/^(\s*)"(nbconvert|traitlets)==.*"/\1"\2"/' setup.py	
}
build() {
	cd nbgrader
	python setup.py build
}
package() {
	cd nbgrader
	python setup.py install --prefix=/usr --root="$pkgdir" --skip-build

	echo
	echo Installing notebook extension from the build-directory
	echo
	jupyter nbextension install --prefix="$pkgdir"/usr "$srcdir"  # without --py

	#FIXME does not work, because nbextension disable does not support --prefix
	#following should be run manually
	# assume that most users are students (not teachers)
	# enable only student-related extensions, because as of 2021-11-24 the
	# formgrader should be run in a virtualenv. Otherwise checking assignments
	# and generating reports may fail.
	# Some extensions like formgrader need both nb- and server-extensions.
	# Only disable nb-extensions. Goal is to *only* remove the GUI parts, so
	# do not disable serverextensions.
	#jupyter nbextension disable --system formgrader/main
	#jupyter nbextension disable --system create_assignment/main

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
