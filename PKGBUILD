# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-crewai-core
_pkgname=crewai_core
pkgver=1.15.39
pkgrel=1
pkgdesc="Shared utilities for CrewAI: version, paths, user-data, telemetry, printer"
arch=('any')
url="https://github.com/crewAIInc/crewAI"
license=('MIT')
depends=(
    'python'
    'python-appdirs'
    'python-cryptography>=42'
    'python-httpx>=0.28.1'
    'python-packaging>=23'
    'python-portalocker'
    'python-pyjwt>=2.15'
    'python-pydantic>=2.11.9'
    'python-rich>=13.7.1'
    'python-opentelemetry-api>=1.45.1'
    'python-opentelemetry-sdk>=1.45.1'
    'python-opentelemetry-exporter-otlp-proto-http>=1.45.1'
    'python-tomli>=2.0.2'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
    'python-dotenv'
    'python-requests'
)
optdepends=(
    'python-redis: distributed locking when REDIS_URL is configured'
)
_archive="crewAI-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'test_lock_store.py')
sha256sums=('897081ce7158a2596a6db7910a984213b7a763799391bc48edfb7222d71a559b'
            'cc1979d4babc95f3461490e30a82384039110fea6d0ccf4bc7c7ef3d36a8bbcb')

prepare() {
    cd "$_archive/lib/crewai-core"
    # Exercise Python 3.14 through the complete upstream core suite below.
    sed -i 's/requires-python = ">=3.10, <3.14"/requires-python = ">=3.10"/' pyproject.toml
    # Arch carries compatible newer releases; the upstream suite below exercises them.
    sed -i 's/pydantic>=2.11.9,<2.13/pydantic>=2.11.9,<3/' pyproject.toml
    sed -i 's/portalocker~=2.7.0/portalocker>=2.7.0,<5/' pyproject.toml
    sed -i 's/tomli~=2.0.2/tomli>=2.0.2,<3/' pyproject.toml
}

build() {
    cd "$_archive/lib/crewai-core"
    python -m build --wheel --no-isolation
}

check() {
    local pytest_tmp="$srcdir/core-pytest"
    rm -rf "$pytest_tmp" "$srcdir/test-home" "$srcdir/test-install"
    cd "$_archive/lib/crewai-core"
    python -m installer --destdir="$srcdir/test-install" dist/*.whl
    local site_packages
    site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    local staged="$srcdir/test-install$site_packages"

    # All upstream core cases use the installed wheel, with source-only test helpers.
    cd "$srcdir"
    CREWAI_CORE_STAGED_ROOT="$srcdir/test-install" \
    CREWAI_CORE_TESTS="$srcdir/$_archive/lib/crewai-core/tests" \
    CREWAI_CORE_PYTEST_TMP="$pytest_tmp" \
    CREWAI_CORE_LOCK_TEST="$srcdir/test_lock_store.py" \
    PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 PYTHONNOUSERSITE=1 \
    PYTHONPATH="$staged" python -P - <<'PYTEST'
import os
from pathlib import Path
import sys

import crewai_core
import pytest

staged = Path(os.environ["CREWAI_CORE_STAGED_ROOT"]).resolve()
assert Path(crewai_core.__file__).resolve().is_relative_to(staged)
tests = os.environ["CREWAI_CORE_TESTS"]
result = pytest.main([
    "-c", "/dev/null", "-p", "no:cacheprovider", "-v", "--import-mode=importlib",
    "--basetemp=" + os.environ["CREWAI_CORE_PYTEST_TMP"], "--confcutdir=" + tests, tests,
    os.environ["CREWAI_CORE_LOCK_TEST"],
])
for name, module in tuple(sys.modules.items()):
    if name == "crewai_core" or name.startswith("crewai_core."):
        origin = getattr(module, "__file__", None)
        if origin:
            assert Path(origin).resolve().is_relative_to(staged), (name, origin)
raise SystemExit(result)
PYTEST

    # Exercise encrypted credential persistence and project-definition resolution
    # through the built wheel, not the source checkout.
    CREWAI_CORE_EXPECTED_VERSION="$pkgver" \
    HOME="$srcdir/test-home" \
        PYTHONPATH="$staged${PYTHONPATH:+:$PYTHONPATH}" \
        python - <<'PY'
from datetime import datetime, timedelta
import os
from pathlib import Path
import tempfile

import crewai_core
from crewai_core.project import configured_project_definition
from crewai_core.settings import Settings
from crewai_core.token_manager import TokenManager

assert crewai_core.__version__ == os.environ["CREWAI_CORE_EXPECTED_VERSION"]

root = Path(tempfile.mkdtemp(prefix="crewai-core-smoke-"))
definition = root / "crew.jsonc"
definition.write_text('{"name": "arch-smoke"}\n')
resolved = configured_project_definition(
    "crew",
    pyproject_data={
        "tool": {
            "crewai": {
                "type": "crew",
                "definition": "crew.jsonc",
            }
        }
    },
    project_root=root,
)
assert resolved == definition.resolve()

settings_path = root / "settings.json"
settings = Settings(config_path=settings_path, org_name="Arch Linux")
settings.dump()
assert Settings(config_path=settings_path).org_name == "Arch Linux"

tokens = TokenManager("arch-smoke.enc")
tokens.save_tokens(
    "encrypted-test-token",
    int((datetime.now() + timedelta(minutes=5)).timestamp()),
)
assert tokens.get_token() == "encrypted-test-token"
tokens.clear_tokens()
assert tokens.get_token() is None
PY
    rm -rf "$pytest_tmp" "$srcdir/test-home" "$srcdir/test-install"
}

package() {
    cd "$_archive/lib/crewai-core"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_archive/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
