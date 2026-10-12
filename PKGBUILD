# Maintainer: Robin Trioux <robin@trioux.eu>

pkgname=mistral-vibe-bin
pkgver=2.26.1
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
source_x86_64=("https://files.pythonhosted.org/packages/0e/1c/e5533483eda87bb03c763487b666bc0b00d844546f5f13b28e1ffd7669ed/mistral_vibe-2.26.1-cp312-abi3-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/31/5b/d495b78ccc69172ba7213bd785a6aa35f8b0462a7f39eba791375af64b3f/mistral_vibe-2.26.1-cp312-abi3-manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('1ceb43e38a2e82cb8c54e1032b011874f8422e998cf87b4a3fdf58704133de55')
sha256sums_aarch64=('896a432651b922b7e16f01e26b4fce55b4ebd7a5ca122cf82c1e9d6a8a849821')
noextract=("mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_x86_64.whl"
           "mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_aarch64.whl")

package() {
    python -m installer --destdir="$pkgdir" "${srcdir}"/*.whl
    echo "#!/usr/bin/env python3" > "${pkgdir}/usr/bin/vibe"
    pyver=$(python3 --version | awk '{print $2}' | cut -d. -f1,2)
    cat "${pkgdir}/usr/lib/python${pyver}/site-packages/vibe/cli/entrypoint.py" >> "${pkgdir}/usr/bin/vibe"
    chmod 755 "${pkgdir}/usr/bin/vibe"
}
