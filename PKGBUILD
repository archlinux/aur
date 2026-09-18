pkgname=python-ocp-viewer-core
_build_fragment="tag=v1.0.13-1.0.4"
pkgver=1.0.13.1.0.4
pkgrel=1
pkgdesc="The shared half of the OCP viewer ecosystem"
arch=(any)
url="https://github.com/bernhard-42/ocp-viewer-core"
license=(Apache-2.0)
depends=(
ipython
jupyter-console
python-click
python-ocp
python-ocp-tessellate
python-orjson
python-websockets
python-flask
python-numpy
python-orjson
python-pyperclip
python-questionary
python-threejs_materials
python-flask-sock
python-pygltflib
python-pillow
python-matplotlib
python-webcolors
python-yaml
)
checkdepends=(
python-pytest
python-build123d
)
makedepends=(
git
make
npm
vsce
python-setuptools-scm
python-build
python-installer
python-wheel
yarn
)
optdepends=(
"python-cadquery: for working with cadquery"
"python-build123d: for working with build123d"
"vscode: this plugin works here"
"vscode-insiders: this plugin works here"
)

#install=python-ocp-vscode.install

source=("git+https://github.com/bernhard-42/ocp-viewer-core#${_build_fragment}")

b2sums=('0b9b8450e01d6b26d79fd22599ce92fde1509aa29d5247958c3d03ab63be535fe96cad3b8944b3b8dc8de2f8713d8ea26dda48ba9971a9a8d15ba82810d10bcc')

pkgver() {
  cd ocp-viewer-core
  git describe --tags | sed 's/-/./' | sed 's/^v//'
  #git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/' | sed 's/^v//'
}

prepare() {
  cd ocp-viewer-core
  #sed '/^[ \t]*vsce package/s/^/#/' -i Makefile
  #sed '/^[ \t]*@python -m build/s/^/#/' -i Makefile
  #sed '/^[ \t]*@ls -l dist/s/^/#/' -i Makefile
  #mkdir -p ocp_vscode/static/css
}

build() {
  cd ocp-viewer-core
  #npm install --cache "${srcdir}/npm-cache"
  #make dist
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --without-pip --system-site-packages --clear venv
  source venv/bin/activate

  cd ocp-viewer-core
  python -m installer dist/*.whl
#
  NATIVE_TESSELLATOR=0 OCP_VSCODE_PYTEST=1 python -m pytest -v -s tests/ --ignore=tests/test_show.py --ignore=tests/test_viewer_config.py
#  #NATIVE_TESSELLATOR=1 OCP_VSCODE_PYTEST=1 python -m pytest -v -s tests/
#  #--ignore=tests/test_show.py --ignore=tests/test_viewer_config.py
#
  deactivate
}

package() {
  cd ocp-viewer-core
  python -m installer --destdir="$pkgdir" dist/*.whl
}
