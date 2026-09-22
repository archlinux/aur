# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-pkg-resources
pkgver=81.0.0
pkgrel=1
pkgdesc='Legacy package resource API, separated from Setuptools'
arch=('any')
url='https://github.com/pypa/setuptools'
license=('MIT')
depends=('python' 'python-packaging' 'python-jaraco.text' 'python-platformdirs')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
# Setuptools 82 removed this module. Older releases own the same files.
conflicts=('python-setuptools<1:82.0.0')
source=(
  'git+https://github.com/pypa/setuptools.git#commit=049815b259805879f2fd60987f1d9e0d39c9dc96'
)
sha256sums=('SKIP')

prepare() {
  # 81.0.0 is the last upstream release carrying pkg_resources. Package only
  # that API, not an old setuptools backend or its vendored dependencies.
  mkdir -p compat/pkg_resources checks
  cp setuptools/pkg_resources/{__init__.py,py.typed} compat/pkg_resources/
  cp setuptools/LICENSE compat/
  sed -i '/^sys.path.extend.*vendor_path/d' compat/pkg_resources/__init__.py
  cp setuptools/pkg_resources/tests/{__init__.py,test_markers.py,test_resources.py,test_working_set.py} checks/
  cat > compat/pyproject.toml <<'EOF'
[build-system]
requires = ["setuptools"]
build-backend = "setuptools.build_meta"

[project]
name = "pkg-resources"
version = "81.0.0"
description = "Legacy package resource API from Setuptools"
requires-python = ">=3.10"
license = "MIT"
license-files = ["LICENSE"]
dependencies = ["packaging", "jaraco.text", "platformdirs"]

[tool.setuptools]
packages = ["pkg_resources"]

[tool.setuptools.package-data]
pkg_resources = ["py.typed"]
EOF
}

build() {
  cd compat
  python -m build --wheel --no-isolation
}

check() {
  local site
  site=$(python -c 'import site; print(site.getsitepackages()[0])')
  python -m installer --destdir="$srcdir/check-install" compat/dist/*.whl
  # Entry-point tests address themselves as pkg_resources.tests.*. Keep their
  # upstream module identity inside the disposable test prefix, not the wheel.
  cp -a checks "$srcdir/check-install$site/pkg_resources/tests"
  PYTHONPATH="$srcdir/check-install$site" PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
    python -m pytest -c /dev/null -o cache_dir="$srcdir/pytest-cache" \
      --import-mode=importlib -ra "$srcdir/check-install$site/pkg_resources/tests"
}

package() {
  python -m installer --destdir="$pkgdir" compat/dist/*.whl
  install -Dm644 compat/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
