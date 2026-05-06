pkgname=python-ocp-vscode
_build_fragment="tag=v3.3.4"
pkgver=3.3.4
pkgrel=1
pkgdesc="A viewer for OCP based Code-CAD (CadQuery, build123d) integrated into VS Code"
arch=(any)
url="https://github.com/bernhard-42/vscode-ocp-cad-viewer"
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

install=python-ocp-vscode.install

source=("git+https://github.com/bernhard-42/vscode-ocp-cad-viewer#${_build_fragment}")

b2sums=('7f12bdc82b41c6f8cf2f8fe23f949353aa04290e3d441803fea203e586988947df8f6ec45db15c635f263c5fb63edc168cee369f68436fe2b52238f45be5ed17')

pkgver() {
  cd vscode-ocp-cad-viewer
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/' | sed 's/^v//'
}

prepare() {
  cd vscode-ocp-cad-viewer
  #sed '/^[ \t]*vsce package/s/^/#/' -i Makefile
  sed '/^[ \t]*@python -m build/s/^/#/' -i Makefile
  sed '/^[ \t]*@ls -l dist/s/^/#/' -i Makefile
  mkdir -p ocp_vscode/static/css
}

build() {
  cd vscode-ocp-cad-viewer
  npm install --cache "${srcdir}/npm-cache"
  make dist
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --without-pip --system-site-packages --clear venv
  source venv/bin/activate

  cd vscode-ocp-cad-viewer
  python -m installer dist/*.whl

  NATIVE_TESSELLATOR=0 OCP_VSCODE_PYTEST=1 python -m pytest -v -s tests/ --ignore=tests/test_show.py --ignore=tests/test_viewer_config.py
  #NATIVE_TESSELLATOR=1 OCP_VSCODE_PYTEST=1 python -m pytest -v -s tests/
  #--ignore=tests/test_show.py --ignore=tests/test_viewer_config.py

  deactivate
}

package() {
  cd vscode-ocp-cad-viewer
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 -t "${pkgdir}/usr/share/${pkgname}" *.vsix
}
