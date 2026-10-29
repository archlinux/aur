# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name="spin"
pkgname="python-${_name}"
pkgver=0.19
pkgrel=1
pkgdesc="A developer tool for scientific Python libraries"
arch=('any')
url="https://github.com/scientific-python/spin"
license=('BSD-3-Clause')
# debug breaks the test(s)
options=(!debug)
depends=(
  "python"
  "python-click"
  "python-importlib-metadata"
)
makedepends=(
  "git"
  "python-setuptools"
  "python-build"
  "python-installer"
  "python-wheel"
)
checkdepends=(
  "meson"
  "meson-python"
  "python-pytest"
  "gcovr"
)
optdepends=(
  "python-pygments: For syntax highlighting"
  "python-pytest: For running the unit-tests"
)
source=("${_name}::git+${url}#tag=v${pkgver}")
b2sums=('579845031c4a5096b26d59c1a503faaea3a3493923b55325b1e9c1e5c7e3d4a0b61f31f6232a082083459eaf0c078c14e907b3c85a93b997527b189c687aab59')

prepare() {
  cd "${_name}"

  # Some of the tests uses the fullpath to Python, which causes issues
  # use simple name to avoid mixing system level with venv
  sed -i 's|sys.executable|"python"|' spin/tests/test_build_cmds.py
}

build() {
  cd "${_name}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}"

  python -m venv --system-site-packages test-env
  # Tests uses pip install etc; we need to activate the venv to test this
  (
    source test-env/bin/activate
    python -m installer dist/*.whl
    pytest spin
  )
}

package() {
  cd "${_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}

# vim: sw=2 ts=2 et:
