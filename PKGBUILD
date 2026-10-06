# Maintainer: Robin Trioux <robin@trioux.eu>

pkgname=mistral-vibe-bin
pkgver=2.26.0
pkgrel=1
pkgdesc='Minimal CLI coding agent by Mistral (binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/mistralai/mistral-vibe'
license=(Apache-2.0)
provides=("mistral-vibe=${pkgver}")
conflicts=('mistral-vibe')
depends=(
    "python"
    "python-agent-client-protocol"
    "python-aiofiles"
    "python-dotenv"
    "python-giturlparse"
    "python-google-auth"
    "python-httpx"
    "python-humanize"
    "python-jsonpatch"
    "python-keyring"
    "python-linkify-it-py"
    "python-mcp"
    "python-mistralai"
    "python-opentelemetry-api"
    "python-opentelemetry-exporter-otlp"
    "python-opentelemetry-semantic-conventions"
    "python-packaging"
    "python-pexpect"
    "python-pydantic"
    "python-pydantic-settings"
    "python-pyperclip"
    "python-rfc8785"
    "python-rich"
    "python-sentry_sdk"
    "python-textual"
    "python-tomli-w"
    "python-tree-sitter-bash"
    "python-truststore"
    "python-watchfiles"
    "python-yaml"
    "python-zstandard"
    "python-sounddevice"
    "python-croniter"
)
makedepends=("python-installer")
# Upstream publishes no sdist; the official manylinux_2_28 wheels bundle the
# prebuilt Rust artifacts (vibe/_bin/vibe-rs TUI and the
# mistralai_vibe_local_harness native extension) and only need glibc >= 2.28.
source_x86_64=("https://files.pythonhosted.org/packages/29/3d/9cf25425a0aecc4947099919b6b398c539768074d9b215efd3c06d152224/mistral_vibe-2.26.0-cp312-abi3-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/35/68/502698a3122fd8606a24172e7d0216f4dc45791bb85022acba402962ee4c/mistral_vibe-2.26.0-cp312-abi3-manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('d8230b8abd7c39a8e90d60884b1f5ee8c95ffb459c62c21f3ea0e3041117a114')
sha256sums_aarch64=('91087d3507924f44823be8567d8d051da7669b1ad2b60e549e75e91ede282a4e')
noextract=("mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_x86_64.whl"
           "mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_aarch64.whl")

package() {
    python -m installer --destdir="$pkgdir" "${srcdir}"/*.whl
    echo "#!/usr/bin/env python3" > "${pkgdir}/usr/bin/vibe"
    pyver=$(python3 --version | awk '{print $2}' | cut -d. -f1,2)
    cat "${pkgdir}/usr/lib/python${pyver}/site-packages/vibe/cli/entrypoint.py" >> "${pkgdir}/usr/bin/vibe"
    chmod 755 "${pkgdir}/usr/bin/vibe"
}
