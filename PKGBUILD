# Maintainer: Gianluca Mazza <info@gianlucamazza.it>
# AUR package for mklang (ADR 0021 phase 3). Build from the PyPI sdist so the
# released artifact is what ships; bump pkgver on every release (see README.md).
pkgname=mklang
pkgver=1.3.2
pkgrel=1
pkgdesc="A declarative language for LLM-driven state machines (reference interpreter)"
arch=(any)
url="https://github.com/gianlucamazza/mklang"
license=(Apache-2.0)
depends=(python python-yaml python-jsonschema python-dotenv python-openai python-rich python-textual)
makedepends=(python-build python-installer python-wheel python-hatchling)
checkdepends=(python-pytest python-mcp)
# mklang-mcp targets MCP SDK v2 (`mcp>=2`); extra/python-mcp is still on the
# 1.x line, so the server exits with an actionable hint until Arch catches up.
optdepends=('python-mcp>=2: mklang-mcp MCP server'
            'python-argcomplete: shell completions')
backup=(etc/mklang/runtime.yaml)
source=("https://files.pythonhosted.org/packages/19/57/cf982f8a29f5f18a53b7ea108e566d34ea25b8b2a939cf4765098b9a84d8/mklang-$pkgver.tar.gz")
sha256sums=('b17365b0e9c7b51de1f93878c9ffbad9b676c6c95ed45dcfe3951420523ccf53')

build() {
  cd "mklang-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "mklang-$pkgver"
  # Offline suite (MockLLM/scripted — no network, no keys); the sdist ships
  # tests/ and conformance/ exactly for this.
  PYTHONPATH=src python -m pytest tests -q
}

package() {
  cd "mklang-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # System-level host layout (ADR 0021): lowest-precedence config and machines.
  install -Dm644 config/runtime.example.yaml "$pkgdir/etc/mklang/runtime.yaml"
  install -Dm644 config/runtime.schema.json "$pkgdir/etc/mklang/runtime.schema.json"
  install -Dm644 examples/*.mkl -t "$pkgdir/usr/share/mklang/machines/"
}
