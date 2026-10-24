# Maintainer: Aleks Ozolins <aleks@ozolins.xyz>
pkgname=orgwarrior
pkgver=0.3.1
pkgrel=1
pkgdesc="A taskwarrior-style command line for Org mode's agenda, through your running Emacs"
arch=('any')
url="https://github.com/aleksozolins/orgwarrior"
license=('GPL-3.0-or-later')
depends=('python' 'emacs')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/o/orgwarrior/orgwarrior-$pkgver.tar.gz")
sha256sums=('4f0c6584f76da05071d468a304250e00c57daa75de60ed9761fb7acd7a239494')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  # The parser and config in Python, the engine in ERT (emacs --batch):
  # nothing that needs a running daemon.
  PYTHONPATH=src python -m pytest -q tests/test_parse.py tests/test_config.py tests/test_elisp.py
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 docs/orgwarrior.1 "$pkgdir/usr/share/man/man1/orgwarrior.1"
}
