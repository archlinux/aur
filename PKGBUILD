# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-flit-core3
pkgver=3.12.0
pkgrel=1
pkgdesc='PEP 517 build backend for projects requiring Flit 3'
arch=('any')
url='https://github.com/pypa/flit'
license=('BSD-3-Clause')
depends=('python>=3.11')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-testpath')
provides=("python-flit-core=$pkgver")
conflicts=('python-flit-core')
source=("flit-$pkgver.tar.gz::https://github.com/pypa/flit/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c157ff92c01f4bb169182722ff76aadac113926b729215e91909021aa56e2ea3')

prepare() {
    cd "flit-$pkgver/flit_core"
    # Python 3.11+ supplies tomllib. Use its supported standard-library path
    # and omit the unused bundled copy of Tomli and its license glob.
    rm -rf flit_core/vendor
    python - <<'PY'
from pathlib import Path
path = Path('pyproject.toml')
text = path.read_text()
old = 'license-files = ["LICENSE*", "flit_core/vendor/**/LICENSE*"]'
assert text.count(old) == 1
path.write_text(text.replace(old, 'license-files = ["LICENSE*"]'))
PY
}

build() {
    cd "flit-$pkgver/flit_core"
    # Upstream's backend-path bootstraps this exact source, independently of
    # an installed Flit 4 backend.
    python -m build --wheel --no-isolation
}

check() {
    cd "flit-$pkgver/flit_core"
    local staged="$srcdir/check-install" site_packages
    rm -rf "$staged"
    python -m installer --destdir="$staged" dist/*.whl
    site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
    # Retain the self-build cases too. Give the installed code their source
    # metadata and fixture files, without copying source implementation modules.
    cp -a tests_core "$staged$site_packages/"
    install -m644 pyproject.toml README.rst LICENSE bootstrap_install.py build_dists.py \
        "$staged$site_packages/"
    cd "$staged$site_packages"
    FLIT_CORE_STAGED_ROOT="$staged" PYTHONNOUSERSITE=1 PYTHONPATH="$staged$site_packages" \
        python -P - <<'PY'
import os
from pathlib import Path
import flit_core
import pytest
root = Path(os.environ['FLIT_CORE_STAGED_ROOT']).resolve()
assert flit_core.__version__ == '3.12.0'
assert Path(flit_core.__file__).resolve().is_relative_to(root)
result = pytest.main(['-v', '--import-mode=importlib', 'tests_core'])
for name, module in tuple(__import__('sys').modules.items()):
    if name == 'flit_core' or name.startswith('flit_core.'):
        location = getattr(module, '__file__', None)
        if location:
            assert Path(location).resolve().is_relative_to(root), (name, location)
raise SystemExit(result)
PY
}

package() {
    cd "flit-$pkgver/flit_core"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
