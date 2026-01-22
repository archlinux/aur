pkgname=python-ocp_vscode
_build_hash=4131f9ec3c640591f5badae1b2f3a3fb12b7a190
pkgver=3.0.1
pkgrel=1
pkgdesc="A viewer for OCP based Code-CAD (CadQuery, build123d) integrated into VS Code"
arch=(x86_64)
url="https://github.com/bernhard-42/vscode-ocp-cad-viewer"
license=(Apache-2.0)
depends=(
python-ocp_tessellate
python-requests
python-ipykernel
python-orjson
python-websockets
python-flask
python-pyperclip
python-questionary
python-flask-sock
)
checkdepends=(
python-pytest
python-build123d
)
makedepends=(
git
make
npm
python-setuptools-scm
python-build
python-installer
python-wheel
)

source=("git+https://github.com/bernhard-42/vscode-ocp-cad-viewer#commit=${_build_hash}")

sha256sums=('4029859ca6862d1cf2f91ebe7f280d5ad16437effd41cad72909c2ee1091e993')

pkgver() {
  cd vscode-ocp-cad-viewer
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/' | sed 's/^v//'
}

prepare() {
  cd vscode-ocp-cad-viewer
  sed '/^[ \t]*vsce package/s/^/#/' -i Makefile
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

  NATIVE_TESSELLATOR=0 OCP_VSCODE_PYTEST=1 python -m pytest -v -s pytests/ -k 'not test_color_list'
  NATIVE_TESSELLATOR=1 OCP_VSCODE_PYTEST=1 python -m pytest -v -s pytests/ -k 'not test_color_list'

  deactivate
}

package() {
  cd vscode-ocp-cad-viewer
  python -m installer --destdir="$pkgdir" dist/*.whl
}
