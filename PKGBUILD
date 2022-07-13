# Maintainer: leuko <leuko_aydos_de>

pkgname=jupyter-nbgrader
pkgver=0.7.1
pkgrel=1
pkgdesc="A system for assigning and grading notebooks"
arch=(any)
url=https://github.com/jupyter/nbgrader
license=(BSD)
depends=(
	python
	python-setuptools

	python-sqlalchemy
	python-dateutil
	jupyter-notebook
	jupyter-nbconvert
	python-requests
	python-jsonschema
	python-alembic
	python-rapidfuzz
	python-jinja
	python-markupsafe
	python-jupyter_client
	jupyter-server
	python-qtconsole
	python-ipywidgets
	jupyter-nbclient
	python-traitlets
)
makedepends=(python-setuptools)
source=(git+https://github.com/jupyter/nbgrader)
source=(https://files.pythonhosted.org/packages/source/n/nbgrader/nbgrader-$pkgver.tar.gz)
sha256sums=(
	871705d8bc4ad82c80a2376868381b2290fd69f0398b986925b9eaf9fd496fca
)
prepare() {
	#TODO remove after update
	# Undo traitlets pin, it seems to be only relevant for the tests
	# https://github.com/jupyter/nbgrader/pull/1593
	sed -i 's/traitlets<5\.2\.0/traitlets/' "$srcdir"/nbgrader-$pkgver/setup.py

	# nbgrader explicitly depends on jupyter-notebook, but jupyterhub only
	# seems to work with `jupyter-nbclassic`. Disable dependency checks:
	sed -i '/^\s*"notebook/d' "$srcdir"/nbgrader-$pkgver/setup.py
	sed -i '/^\s*"ipywidgets/d' "$srcdir"/nbgrader-$pkgver/setup.py
}
build() {
	cd nbgrader-$pkgver
	python setup.py build
}
package() {
	cd nbgrader-$pkgver
	python setup.py install --prefix=/usr --root="$pkgdir" --skip-build

	echo
	echo Installing notebook extension from the build-directory
	echo
	jupyter nbextension install --prefix="$pkgdir"/usr "$srcdir/nbgrader-$pkgver"
	# Do not use `--py nbgrader` because package is not yet installed

	# jupyter-{server,nb}extension-enable does not support setting a prefix.
	# Follow
	# https://jupyter-notebook.readthedocs.io/en/stable/examples/Notebook/Distributing%20Jupyter%20Extensions%20as%20Python%20Packages.html#Automatically-enabling-a-server-extension-and-nbextension
	# to automatically enable the nbextension and the serverextension and
	# create the file instead.
	# The files can be created with the command
	# sudo jupyter serverextension enable --py nbgrader
	# sudo jupyter nbextension enable --py nbgrader
	# and copied here.
	#TODO suggest maintainer automatic activation like here:
	# https://github.com/jupyter-lsp/jupyterlab-lsp/tree/master/python_packages/jupyter_lsp/jupyter_lsp/etc
	
	# jupyter_notebook_config.d
	_file="$pkgdir"/etc/jupyter/jupyter_notebook_config.d/nbgrader.json
	mkdir -p $(dirname $_file)
	cat > $_file <<-EOF
	{
	  "NotebookApp": {
	    "nbserver_extensions": {
	      "nbgrader.server_extensions.formgrader": true,
	      "nbgrader.server_extensions.validate_assignment": true,
	      "nbgrader.server_extensions.assignment_list": true,
	      "nbgrader.server_extensions.course_list": true
	    }
	  }
	}
	EOF

	# notebook.d
	_file="$pkgdir"/etc/jupyter/nbconfig/notebook.d/nbgrader.json
	mkdir -p $(dirname $_file)
	cat > $_file  <<-EOF
	{
	  "load_extensions": {
	    "create_assignment/main": true,
	    "validate_assignment/main": true
	  }
	}
	EOF

	# notebook.d
	_file="$pkgdir"/etc/jupyter/nbconfig/tree.d/nbgrader.json
	mkdir -p $(dirname $_file)
	cat > $_file  <<-EOF
	{
	  "load_extensions": {
	    "formgrader/main": true,
	    "assignment_list/main": true,
	    "course_list/main": true
	  }
	}
	EOF

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
