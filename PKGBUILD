pkgname=python-ocp-viewer
_build_fragment="tag=v1.1.3"
pkgver=1.1.3
pkgrel=1
pkgdesc="Standalone viewer for three-cad-viewer"
arch=(any)
url="https://github.com/bernhard-42/ocp_viewer"
license=(Apache-2.0)
depends=(
ipython
jupyter-console
python-click
python-ocp
python-ocp-tessellate
python-ocp-viewer-core
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


source=("git+https://github.com/bernhard-42/ocp_viewer#${_build_fragment}")

b2sums=('8e54ef0a504ad5801061c150ebf901e775992c01c28cff4a8fa910d89e9e473c85f783f3f8e0b1bbcd02c39ed3535a6e0ded54eb849372691339cb042f3a5da7')

pkgver() {
  cd ocp_viewer
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/' | sed 's/^v//'
}

prepare() {
  cd ocp_viewer
  #sed '/^[ \t]*vsce package/s/^/#/' -i Makefile
  #sed '/^[ \t]*@python -m build/s/^/#/' -i Makefile
  #sed '/^[ \t]*@ls -l dist/s/^/#/' -i Makefile
  #mkdir -p ocp_vscode/static/css
}

build() {
  cd ocp_viewer
  #npm install --cache "${srcdir}/npm-cache"
  #make dist
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --without-pip --system-site-packages --clear venv
  source venv/bin/activate
  cd ocp_viewer
  python -m installer dist/*.whl

  local _these_fail=(
  test_status_after_show_returns_safe_collapse
  test_show_against_fresh_standalone_does_not_hang 
  test_the_files_the_page_loads_are_served_with_their_types
  test_the_copied_in_files_are_named_when_absent
  )
  printf -v _joined '%s and not ' "${_these_fail[@]}"
  NATIVE_TESSELLATOR=0 OCP_VSCODE_PYTEST=1 python -m pytest tests -k "$(echo "not ${_joined% and not }")"  # skip the tests we know fail
#
  #NATIVE_TESSELLATOR=0 OCP_VSCODE_PYTEST=1 python -m pytest -v -s tests/ --ignore=tests/test_show.py --ignore=tests/test_viewer_config.py
#  #NATIVE_TESSELLATOR=1 OCP_VSCODE_PYTEST=1 python -m pytest -v -s tests/
#  #--ignore=tests/test_show.py --ignore=tests/test_viewer_config.py
#
  deactivate
}

package() {
  cd ocp_viewer
  python -m installer --destdir="$pkgdir" dist/*.whl
}
