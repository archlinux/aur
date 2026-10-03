# Maintainer: Rinne <aur@rinne.in>

pkgname=agents-anywhere-cli
pkgver=2.0.3
pkgrel=1
pkgdesc='Local runtime connector for Agents Anywhere'
arch=('any')
url='https://github.com/anywhere-labs/Agents-Anywhere'
license=('unknown')

depends=(
  'python>=3.12'
  'python-asyncer'
  'python-claude-agent-sdk'
  'python-httpx'
  'python-jsonschema>=4.26.0'
  'python-loguru'
  'python-pexpect>=4.9.0'
  'python-psutil>=7.2.2'
  'python-ptyprocess'
  'python-pydantic>=2.0.0'
  'python-pyte>=0.8.2'
  'python-python-socks>=2.8.1'
  'python-socksio'
  'python-websockets>=16.0'
  'openai-codex>=0.144.4'
)

makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
)

source=(
  "Agents-Anywhere::git+https://github.com/anywhere-labs/Agents-Anywhere.git#tag=v${pkgver}"
  "openai_codex-0.160.0-py3-none-any.whl::https://files.pythonhosted.org/packages/09/a6/3e848b805f31a9a736ee1e54f92c2457de2c4e9d0553404975f2bac2dd33/openai_codex-0.160.0-py3-none-any.whl"
)
sha256sums=(
  'SKIP'
  '61d2d855ca2ebedfd51280fbeb60ff31fc47ccbd55ebce186505e3f3da096921'
)

build() {
  cd "${srcdir}/Agents-Anywhere/connector"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/Agents-Anywhere/connector"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Agents Anywhere imports the Python openai_codex SDK directly. Arch's
  # openai-codex package provides the native Codex executable, while the
  # Python SDK is only available from PyPI, so install its pure-Python wheel
  # into this package rather than maintaining a separate AUR package.
  python -m installer --destdir="${pkgdir}" \
    "${srcdir}/openai_codex-0.160.0-py3-none-any.whl"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
