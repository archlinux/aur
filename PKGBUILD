# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=superghidra
pkgver=1.0.4
pkgrel=1
pkgdesc='Reverse-engineering suite for Ghidra: P-code lifting, Z3, binary diffing'
arch=('any')
url="https://github.com/yuatemycat/SuperGhidra"
license=('AGPL-3.0-or-later')
depends=('python' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-setuptools')
# The Ghidra-bridge and GPU extras are not listed: upstream imports `pyghidra`
# and `wgpu` lazily, and no package in the repos or the AUR provides either
# module, so naming them would add dependencies pacman cannot resolve. Users who
# want those two backends install them from PyPI rather than through pacman.
optdepends=(
  'python-z3-solver: prove two P-code snippets equivalent, or answer UNKNOWN'
  'python-lz4: LZ4 compression of Ghidra 16 KB buffer pages'
  'python-zstandard: Zstandard compression of Ghidra 16 KB buffer pages'
  'python-frida: inspect a live emulator at runtime'
  'python-psutil: apply the CPU affinity and priority of each resource mode, and validate an emulator process by executable name'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e23bb0b41a509de32b8ed3ca55e179b6e6e327317998e8e218a9704baad37e52')

latestver() {
  curl -fsSL "https://pypi.org/pypi/${pkgname}/json" |
    python -c 'import json, sys; print(json.load(sys.stdin)["info"]["version"])'
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

# The sdist ships no upstream test suite, so this asserts the published surface
# instead. The wheel installs the package plus ~30 top-level modules that
# sibling projects import by their bare names, and every optional backend is
# imported lazily, so importing the whole surface is what proves a default
# install needs no optional dependency and that nothing was dropped or shadowed
# in packaging. That surface is only importable once installed, so the wheel is
# installed into a throwaway root first; the same install is what proves the
# JSON schemas reached site-packages, since they are opened by path rather than
# through the import system. `filter` is asserted because it is the subcommand
# that exercises the lifting stack without invoking Ghidra, and its output is
# checked rather than its exit status.
check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python - <<'PY'
import importlib
import os
import pathlib
import subprocess
import sys
import tempfile
import zipfile

wheel = next(pathlib.Path("dist").glob("*.whl"))
with zipfile.ZipFile(wheel) as archive:
    shipped = [name for name in archive.namelist() if name.endswith(".py")]


def dotted(name):
    parts = name.removesuffix(".py").split("/")
    if parts[-1] == "__init__":
        parts.pop()
    return ".".join(parts)


modules = sorted(module for module in map(dotted, shipped) if module)

with tempfile.TemporaryDirectory() as tmp:
    install = subprocess.run(
        [sys.executable, "-m", "installer", f"--destdir={tmp}", str(wheel)],
        capture_output=True,
        text=True,
    )
    assert install.returncode == 0, install.stderr

    installed = pathlib.Path(tmp)
    site = next(installed.glob("usr/lib/python3.*/site-packages"))
    sys.path.insert(0, str(site))

    for module in modules:
        importlib.import_module(module)
    print(f"imported {len(modules)} modules")

    validator = importlib.import_module("superghidra.schemas.validator")
    for schema in validator.SCHEMA_FILES:
        validator.load_schema(schema)
    print(f"loaded {len(validator.SCHEMA_FILES)} schemas")

    raw = "undefined4 main(void)\n{\n  return 0;\n}\n"
    with tempfile.TemporaryDirectory() as work:
        source = pathlib.Path(work) / "raw.c"
        source.write_text(raw)
        done = subprocess.run(
            [str(next(installed.glob("usr/bin/superghidra"))), "filter", str(source)],
            capture_output=True,
            text=True,
            env={**os.environ, "PYTHONPATH": str(site)},
        )

assert done.returncode == 0, done.stderr
assert "uint32_t main(void)" in done.stdout, done.stdout
assert "#include <stdint.h>" in done.stdout, done.stdout
print("cli filter: rewrote undefined4 to uint32_t with headers")
PY
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
