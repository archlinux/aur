# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-crewai-cli
pkgver=1.15.44
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
    'python-textual'
    # Current public Textual Git omits these mandatory upstream runtime inputs.
    # The shipped guard checks their actual installed upstream version ranges.
    'python-markdown-it-py'
    'python-mdit_py_plugins'
    'python-linkify-it-py'
    'python-platformdirs'
    'python-pygments'
    'python-typing_extensions'
    'python-certifi>=2026.10.18'
)
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
checkdepends=('python-pytest')
_archive="crewAI-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        textual-runtime.patch check-textual-runtime.py)
sha256sums=('f345e0a5f982514c89a5c7427e81bb39359cfdda97269d22669661f1e35e16b6'
            'e6ad8458faea7bbe59e1bf10be476e6067f84ae2e50bd56634f5b4af1346568c'
            'fa7e5b5bbd68aebaa49fc2dd15d731c467a2adc46a4ca2bd17fda47400ea8585')

prepare() {
    cd "$_archive/lib/cli"
    patch -Np1 --fuzz=0 -i "$srcdir/textual-runtime.patch"
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
    CREWAI_CLI_STAGED_ROOT="$staged" CREWAI_DISABLE_TELEMETRY=true \
    PYTHONNOUSERSITE=1 PYTHONPATH="$staged$site_packages" \
        python -P "$srcdir/check-textual-runtime.py"
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
    "test_config.py", "test_constants.py", "test_create_agent.py", "test_input_prompt.py",
    "test_plus_api.py", "test_settings_command.py", "test_token_manager.py", "test_version.py",
]
# Keep component fixtures and use the component project configuration.
# The workspace root adds plugins and imports main crewai, which depends on
# this CLI and is not a prerequisite of these component unit tests.
# Full JSON validation and provider-routing parity require the downstream Main
# distribution. Main depends on this CLI, so preserve these exact integration
# cases in Main's check suite while testing all standalone CLI cases here.
main_integration = [
    "test_valid_json_crew_project_passes",
    "test_json_task_agent_mismatch_is_error",
    "test_json_runtime_fields_are_deploy_errors",
]
# These agent cases load or import the generated agent through main crewai.
agent_integration = [
    "test_create_agent_exports_installable_agent",
    "test_agent_deploy_validation_checks_real_export",
    "test_agent_deploy_validation_loads_project_dotenv_in_subprocess",
    "test_create_config_agent_loads_and_archives_without_source_package",
    "test_config_agent_runs_same_loader_and_preserves_inputs",
    "test_reference_scaffold_tools_and_skills_work_outside_project_root",
    "test_config_agent_validates_without_package_directory",
]
provider_integration = ['test_provider_for_model_infers_bare_names_as_crewai_does', 'test_every_provider_extra_is_a_crewai_extra', 'test_provider_for_model_matches_every_prefix_crewai_routes', 'test_litellm_extra_matches_crewai_routing_for_every_prefix', 'test_every_model_the_wizard_lists_gets_the_extras_crewai_needs_to_run_it', 'test_classic_provider_extra_covers_every_model_it_lists']
result = pytest.main(["-c", "pyproject.toml", "-v", "--import-mode=importlib", "--confcutdir=tests",
                     *["--deselect=tests/deploy/test_validate.py::" + n for n in main_integration],
                     *["--deselect=tests/test_constants.py::" + n for n in provider_integration],
                     *["--deselect=tests/test_create_agent.py::" + n for n in agent_integration],
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
