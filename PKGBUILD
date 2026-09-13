# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-crewai-core
_pkgname=crewai_core
pkgver=1.15.20
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
    'python-pyjwt>=2.13'
    'python-pydantic>=2.11.9'
    'python-rich>=13.7.1'
    'python-opentelemetry-api>=1.42'
    'python-opentelemetry-sdk>=1.42'
    'python-opentelemetry-exporter-otlp-proto-http>=1.42'
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
)
optdepends=(
    'python-redis: distributed locking when REDIS_URL is configured'
)
_archive="crewAI-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('af32bba2ceef65116be48b998c09658ea79b3a8b2d6bf677be428cfa8b7afa10')

prepare() {
    cd "$_archive/lib/crewai-core"
    # Allow Python 3.14 (Arch ships 3.14); upstream caps at <3.14 for no code reason.
    sed -i 's/requires-python = ">=3.10, <3.14"/requires-python = ">=3.10"/' pyproject.toml
    # Arch carries compatible newer releases; the upstream suite below exercises them.
    sed -i 's/pydantic>=2.11.9,<2.13/pydantic>=2.11.9,<3/' pyproject.toml
    sed -i 's/portalocker~=2.7.0/portalocker>=2.7.0,<4/' pyproject.toml
    sed -i 's/tomli~=2.0.2/tomli>=2.0.2,<3/' pyproject.toml
    sed -i 's/opentelemetry-api~=1.42.0/opentelemetry-api>=1.42.0,<2/' pyproject.toml
    sed -i 's/opentelemetry-sdk~=1.42.0/opentelemetry-sdk>=1.42.0,<2/' pyproject.toml
    sed -i 's/opentelemetry-exporter-otlp-proto-http~=1.42.0/opentelemetry-exporter-otlp-proto-http>=1.42.0,<2/' pyproject.toml
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

    # The complete upstream crewai-core suite is offline and needs no plugins.
    cd "$srcdir"
    PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
        PYTHONPATH="$staged${PYTHONPATH:+:$PYTHONPATH}" \
        python -m pytest -c /dev/null -p no:cacheprovider -v \
        --basetemp="$pytest_tmp" \
        --confcutdir="$_archive/lib/crewai-core/tests" \
        "$_archive/lib/crewai-core/tests"

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
