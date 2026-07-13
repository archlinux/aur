# Maintainer: SkillOpt Team <https://github.com/microsoft/SkillOpt/issues>
pkgbase=python-skillopt
pkgname=('python-skillopt' 'python-skillopt-webui')
pkgver=0.2.0
pkgrel=1
pkgdesc="Agentic Skill Optimization via Reflective Training Loops"
arch=('any')
url="https://github.com/microsoft/SkillOpt"
license=('MIT')
install=python-skillopt.install
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  # Runtime deps are also listed in makedepends so namcap's split-package
  # check passes: each sub-package can be built independently and must find
  # its full transitive closure on the build host.
  'python-azure-core'
  'python-azure-identity'
  'python-httpx'
  'python-numpy'
  'python-openai'
  'python-openpyxl'
  'python-yaml'
  'python-gradio'
  # Note: omegaconf, pytorch, ray are NOT in makedepends. They are lazy-imported
  # only when the user activates the alfworld extra, so they live in optdepends
  # only. Listing them here would force every `makepkg -s` user to install ~2GB
  # of PyTorch + ~200MB of Ray for a build that doesn't need them.
)
# sdist tarball from PyPI (CDN path is content-addressed and stable per version)
source=("https://files.pythonhosted.org/packages/ec/93/c896156981f56228e6a20ed1a95814aabb75d5e4a97a44534b216a269fdb/skillopt-${pkgver}.tar.gz")
sha256sums=('d9f047336d4d13936f26589677406db77df43897fa23dd7973f81aff7907c4e4')

# ---------------------------------------------------------------------------
# Build: PEP 517 isolated wheel build using the system setuptools backend.
# ---------------------------------------------------------------------------
build() {
  cd "${srcdir}/skillopt-${pkgver}"
  python -m build --wheel --no-isolation
}

# ---------------------------------------------------------------------------
# python-skillopt: full install of the wheel + CLI entry points + LICENSE.
# ---------------------------------------------------------------------------
package_python-skillopt() {
  depends=(
    'python-openai>=1.30.0'
    'python-yaml>=6.0'
    'python-numpy>=1.24.0'
    'python-openpyxl>=3.1.0'
    'python-azure-identity>=1.15.0'
    'python-azure-core>=1.30.0'
    'python-httpx>=0.27.0'
  )
  optdepends=(
    'python-alfworld: ALFWorld benchmark environment (skillopt[alfworld] extra)'
    'python-gymnasium: ALFWorld backend gym env (skillopt[alfworld] extra)'
    'python-omegaconf: ALFWorld config loader (skillopt[alfworld] extra)'
    'python-pytorch: ALFWorld deep-learning backend (skillopt[alfworld] extra)'
    'python-ray: Parallel rollout execution for ALFWorld (skillopt[alfworld] extra)'
    'python-claude-agent-sdk: Claude model backend (skillopt[claude] extra)'
    'python-vllm: Qwen local model backend via vLLM (skillopt[qwen] extra)'
    'python-json-repair: Robust JSON parsing for Claude/Qwen backends'
    'python-datasets: SearchQA data materialization (skillopt[searchqa] extra)'
    'mkdocs-material: Build the documentation site (skillopt[docs] extra)'
    'mkdocstrings: Build the documentation site (skillopt[docs] extra)'
    'python-skillopt-webui: Gradio dashboard meta-package (skillopt[webui] extra)'
    'ruff: Linter for development (skillopt[dev] extra)'
    'python-pytest: Test runner for development (skillopt[dev] extra)'
    # NOTE: skillopt[codex] needs `openai-codex-sdk` from PyPI. It is not yet
    # packaged on Arch/AUR, so it cannot be a proper optdepends. Users enabling
    # the Codex backend must `pip install --user openai-codex-sdk` (or use a
    # venv) — see the post_install() hook in python-skillopt.install.
  )

  cd "${srcdir}/skillopt-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # License (hardcode the package name; ${pkgname} is an array in split PKGBUILDs)
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-skillopt/LICENSE"
}

# ---------------------------------------------------------------------------
# python-skillopt-webui: meta-package. The WebUI is shipped inside the main
# `skillopt` wheel under the `skillopt_webui` module; installing this split
# only pulls `python-gradio` as a hard runtime dependency so users get the
# dashboard with `pacman -S python-skillopt-webui`.
# ---------------------------------------------------------------------------
package_python-skillopt-webui() {
  pkgdesc="Gradio dashboard for python-skillopt (meta-package; pulls python-skillopt + python-gradio)"
  depends=(
    'python-skillopt'
    'python-gradio>=4.0.0'
  )

  install -dm755 "${pkgdir}/usr/share/doc/python-skillopt-webui"
  cat > "${pkgdir}/usr/share/doc/python-skillopt-webui/README.md" <<'EOF'
# python-skillopt-webui

This is an AUR split / meta-package. The WebUI source itself ships inside
the upstream `skillopt` Python wheel (module: `skillopt_webui`). This
package only adds `python-gradio` as a hard runtime dependency so that
`pacman -S python-skillopt-webui` gives you everything needed to launch
the dashboard.

To start the WebUI after installation:

    python -m skillopt_webui.app --port 7860

See `python -m skillopt_webui.app --help` for flags (--host, --share, etc.).
EOF

  install -Dm644 "${srcdir}/skillopt-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/python-skillopt-webui/LICENSE"
}