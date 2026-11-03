# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-crewai-cli
pkgver=1.15.34
pkgrel=1
pkgdesc="CLI for CrewAI: scaffold, run, deploy and manage AI agent crews"
arch=('any')
url="https://github.com/crewAIInc/crewAI"
license=('MIT')
depends=(
    'python'
    "python-crewai-core=$pkgver"
    'python-click>=8.1.7'
    'python-click<9'
    'python-pydantic>=2.11.9'
    'python-pydantic-settings>=2.14.2'
    'python-appdirs'
    'python-cryptography>=42'
    'python-httpx>=0.28.1'
    'python-pyjwt>=2.15'
    'python-rich>=13.7.1'
    'python-tomli>=2.0.2'
    'python-tomli-w>=1.1'
    'python-packaging>=23'
    'python-dotenv>=1.2.2'
    'uv>=0.13.4'
    'python-textual>=7.5'
    'python-certifi>=2026.10.18'
)
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
checkdepends=('python-pytest')
_archive="crewAI-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('620adcd897459067187c89d6e11c5666ff4a9d00aa12d6b7cdb085f3863dab3c')

prepare() {
    cd "$_archive/lib/cli"
    # Exercise the installed CLI with Arch's Python 3.14 and newer Pydantic/Tomli.
    sed -i 's/requires-python = ">=3.10, <3.14"/requires-python = ">=3.10"/' pyproject.toml
    sed -i 's/pydantic>=2.11.9,<2.13/pydantic>=2.11.9,<3/' pyproject.toml
    sed -i 's/tomli~=2.0.2/tomli>=2.0.2,<3/' pyproject.toml
}

build() {
    cd "$_archive/lib/cli"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_archive/lib/cli"
    local staged="$srcdir/check-install"
    rm -rf "$staged"
    python -m installer --destdir="$staged" dist/*.whl
    local site_packages
    site_packages=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
    # Retain standalone CLI coverage for configuration, credentials, safe extraction,
    # deployment validation, HTTP client behavior and version resolution.
    CREWAI_CLI_STAGED_ROOT="$staged" CREWAI_DISABLE_TELEMETRY=true \
    CREWAI_PLUS_URL=https://fake.crewai.com \
    PYTHONNOUSERSITE=1 PYTHONPATH="$staged$site_packages" python -P - <<'PYTEST'
import os
from pathlib import Path
import sys

import crewai_cli
import pytest

staged = Path(os.environ["CREWAI_CLI_STAGED_ROOT"]).resolve()
assert Path(crewai_cli.__file__).resolve().is_relative_to(staged)
selected = [
    "deploy/test_archive.py", "deploy/test_validate.py", "skills/test_safe_extract.py",
    "test_config.py", "test_constants.py", "test_input_prompt.py", "test_plus_api.py",
    "test_settings_command.py", "test_token_manager.py", "test_version.py",
]
# Keep component fixtures and use the component project configuration.
# The workspace root adds plugins and imports main crewai, which depends on
# this CLI and is not a prerequisite of these component unit tests.
# The standalone CLI delegates full JSON Crew validation to main crewai in
# the user's project environment. These three tests exercise that optional
# downstream package, which itself depends on this CLI. Keep them explicit
# as deferred integration coverage, alongside all standalone CLI tests.
main_integration = [
    "test_valid_json_crew_project_passes",
    "test_json_task_agent_mismatch_is_error",
    "test_json_runtime_fields_are_deploy_errors",
]
result = pytest.main(["-c", "pyproject.toml", "-v", "--import-mode=importlib", "--confcutdir=tests",
                     *["--deselect=tests/deploy/test_validate.py::" + n for n in main_integration],
                     *["tests/" + p for p in selected]])
for name, module in tuple(sys.modules.items()):
    if name == "crewai_cli" or name.startswith("crewai_cli."):
        origin = getattr(module, "__file__", None)
        if origin:
            assert Path(origin).resolve().is_relative_to(staged), (name, origin)
raise SystemExit(result)
PYTEST
}

package() {
    cd "$_archive/lib/cli"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_archive/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
