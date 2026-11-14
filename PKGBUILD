# Maintainer: Smoolak <smoolak@gmail.com>

_pkgname=diastatic-malt
pkgname=python-diastatic-malt
pkgver=2.15.3
pkgrel=1
pkgdesc='Python source transformation and operator overloading library (AutoGraph fork)'
arch=('any')
url='https://github.com/PennyLaneAI/diastatic-malt'
license=('Apache-2.0 AND BSD-2-Clause')
depends=('python' 'python-termcolor')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('gcc' 'pybind11' 'python-absl' 'python-numpy' 'python-pytest' 'python-tensorflow')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'python311-getfullargspec.patch'
        'stdlib-ast-migration.patch'
        'python312-test-modules.patch'
        'current-test-fixtures.patch'
        'tensorflow-private-test-helper.patch'
        'cfg-test-labels.patch'
        'deselected-tests.txt')
sha256sums=('03dfb0d8f4d1f4a88b36abf62d6f65273eb80aa49d358418a0e1ce834b76bb49'
            '366f7302362648cf3ac883df8d5746203e194affb725712b1a101f2e52b0cc35'
            '50eb3924fc7521e92a0b8af36eed7fd5e98ae071171e816a62a09c4179825fc4'
            '78dc54651ae655ccc15239880130b91977790dcfd192a1030f696c1cc7d3eae2'
            'b3b4b28d195f447794f3d1a5adc2b3d0edc05f8a9a824ed415a229015974e733'
            'a7b84a4fcfbe6268b606e21da4d81aca69636254e5d72519183d802b3d76c2e3'
            'd3f9e6e82a6e973f8373665b3c06b5af2c412c033c2ee6cc43f548cf1cf7371a'
            'bc7828347d21cd2c86db6b9b6888f073848f2ce12406308511e70d9ca6cc18ef')

prepare() {
    cd "$_pkgname-$pkgver"
    # Converted assert statements call inspect.getargspec, removed in Python 3.11.
    patch --batch --fuzz=0 -Np1 -i ../python311-getfullargspec.patch
    # 2.15.3 moved from gast to the stdlib ast. Static analysis crashed on
    # except ... as e and lost parameter annotations.
    patch --batch --fuzz=0 -Np1 -i ../stdlib-ast-migration.patch
    # Test fixtures only. The imp module is gone, the fork renamed PyToTF,
    # the official TensorFlow lacks a private test helper, and CFG labels are
    # compared by syntax tree instead of astunparse spelling.
    patch --batch --fuzz=0 -Np1 -i ../python312-test-modules.patch
    patch --batch --fuzz=0 -Np1 -i ../current-test-fixtures.patch
    patch --batch --fuzz=0 -Np1 -i ../tensorflow-private-test-helper.patch
    patch --batch --fuzz=0 -Np1 -i ../cfg-test-labels.patch
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    local site extension f rc
    local -a failed=()
    site=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
    extension=$(python -c 'import sysconfig; print(sysconfig.get_config_var("EXT_SUFFIX"))')
    rm -rf "$srcdir/check-root"
    python -m installer --destdir="$srcdir/check-root" dist/*.whl
    # Upstream's small native test fixture for conversion_test.py.
    c++ $CPPFLAGS $CXXFLAGS -shared -fPIC $(python -m pybind11 --includes) \
        tests/impl/testing/pybind_for_testing.cc \
        -o "tests/impl/testing/pybind_for_testing$extension" $LDFLAGS
    # The tests are TensorFlow AutoGraph's, kept by the fork. The listed ones
    # need TensorFlow features the fork removed on purpose, see the reasons in
    # deselected-tests.txt. They are matched by exact node id, and every entry
    # must match. Each module runs in its own process, as in TensorFlow's
    # runner, since TensorFlow state does not reset between them.
    rm -rf "$srcdir/check-plugin"
    mkdir "$srcdir/check-plugin"
    cat > "$srcdir/check-plugin/exact_deselect.py" <<'PYPLUGIN'
import os
from pathlib import Path

listed = Path(os.environ['MALT_DESELECT']).read_text().splitlines()
wanted = {line for line in listed if line and not line.startswith('#')}


def pytest_collection_modifyitems(config, items):
    drop = [item for item in items if item.nodeid in wanted]
    if drop:
        items[:] = [item for item in items if item.nodeid not in wanted]
        config.hook.pytest_deselected(items=drop)
        with open(os.environ['MALT_DESELECT_USED'], 'a') as used:
            used.writelines(item.nodeid + '\n' for item in drop)
PYPLUGIN
    : > "$srcdir/deselect-used.txt"
    while IFS= read -r f; do
        rc=0
        MALT_DESELECT="$srcdir/deselected-tests.txt" MALT_DESELECT_USED="$srcdir/deselect-used.txt" \
        PYTHONPATH="$srcdir/check-root$site:$PWD/tests:$PWD:$srcdir/check-plugin" python -P -m pytest \
            --import-mode=importlib -p no:cacheprovider -p exact_deselect --rootdir="$PWD" -q -ra "$f" || rc=$?
        # Exit status 5 means that every test of the module was deselected.
        if ((rc != 0 && rc != 5)); then
            failed+=("$f")
        fi
    done < <(find tests -name '*_test.py' | sort)
    if ((${#failed[@]})); then
        printf 'Failed test module: %s\n' "${failed[@]}"
        return 1
    fi
    python - "$srcdir/deselected-tests.txt" "$srcdir/deselect-used.txt" <<'PYUSED'
import sys
from pathlib import Path
listed = {l for l in Path(sys.argv[1]).read_text().splitlines() if l and not l.startswith('#')}
used = set(Path(sys.argv[2]).read_text().splitlines())
assert used == listed, ('stale or unmatched deselections', sorted(listed - used)[:20])
print('Deselected exactly', len(used), 'listed tests')
PYUSED
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
