pkgname=python-ocp_vscode
_build_fragment="tag=v3.2.1"
pkgver=3.2.1
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
vsce
python-setuptools-scm
python-build
python-installer
python-wheel
)

install=python-ocp_vscode.install

source=("git+https://github.com/bernhard-42/vscode-ocp-cad-viewer#${_build_fragment}")

sha256sums=('3460631a70d2b4c6eea9a8e8e155f37159f9e3e21ef2fd1d83fa30d97a3f4765')

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
  NATIVE_TESSELLATOR=1 OCP_VSCODE_PYTEST=1 python -m pytest -v -s tests/ --ignore=tests/test_show.py --ignore=tests/test_viewer_config.py

  deactivate
}

package() {
  cd vscode-ocp-cad-viewer
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 -t "${pkgdir}/usr/share/${pkgname}" *.vsix
}
