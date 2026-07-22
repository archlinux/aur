# Maintainer: Gianluca Mazza <info@gianlucamazza.it>
# AUR package for mklang (ADR 0021 phase 3). Build from the PyPI sdist so the
# released artifact is what ships; bump pkgver on every release (see README.md).
pkgname=mklang
pkgver=0.13.0
pkgrel=1
pkgdesc="A declarative language for LLM-driven state machines (reference interpreter)"
arch=(any)
url="https://github.com/gianlucamazza/mklang"
license=(Apache-2.0)
depends=(python python-yaml python-jsonschema python-dotenv python-openai python-rich)
makedepends=(python-build python-installer python-wheel python-hatchling)
optdepends=('python-textual: mklang console TUI'
            'python-mcp: mklang-mcp MCP server'
            'python-argcomplete: shell completions')
backup=(etc/mklang/runtime.yaml)
source=("https://files.pythonhosted.org/packages/source/m/mklang/mklang-$pkgver.tar.gz")
sha256sums=('d334f74e19eb4780ea325fd1de1597d7edf9af56dfdc95b8a589fab7d35c63e8')

build() {
  cd "mklang-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "mklang-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # System-level host layout (ADR 0021): lowest-precedence config and machines.
  install -Dm644 config/runtime.example.yaml "$pkgdir/etc/mklang/runtime.yaml"
  install -Dm644 config/runtime.schema.json "$pkgdir/etc/mklang/runtime.schema.json"
  install -Dm644 examples/*.mk -t "$pkgdir/usr/share/mklang/machines/"
}
