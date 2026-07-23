# Maintainer: Gianluca Mazza <info@gianlucamazza.it>
# AUR package for mklang (ADR 0021 phase 3). Build from the PyPI sdist so the
# released artifact is what ships; bump pkgver on every release (see README.md).
pkgname=mklang
pkgver=1.0.2
pkgrel=1
pkgdesc="A declarative language for LLM-driven state machines (reference interpreter)"
arch=(any)
url="https://github.com/gianlucamazza/mklang"
license=(Apache-2.0)
depends=(python python-yaml python-jsonschema python-dotenv python-openai python-rich python-textual)
makedepends=(python-build python-installer python-wheel python-hatchling)
checkdepends=(python-pytest python-mcp)
optdepends=('python-mcp: mklang-mcp MCP server'
            'python-argcomplete: shell completions')
backup=(etc/mklang/runtime.yaml)
source=("https://files.pythonhosted.org/packages/e9/de/aa8fc98a37c9b7a0adc5ce7f99ca4e9ae5162cb6e805dc4afedf52d26fc6/mklang-1.0.2.tar.gz")
sha256sums=('8306373001a802437d18a3991dbef31a3ac29f57793540e5584db3c7fe5860b4')

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
