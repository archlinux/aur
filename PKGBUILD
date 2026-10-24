# Maintainer: Aleks Ozolins <aleks@ozolins.xyz>
pkgname=orgwarrior
pkgver=0.4.3
pkgrel=1
pkgdesc="A taskwarrior-style command line for Org mode's agenda, through your running Emacs"
arch=('any')
url="https://github.com/aleksozolins/orgwarrior"
license=('GPL-3.0-or-later')
depends=('python' 'emacs')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/o/orgwarrior/orgwarrior-$pkgver.tar.gz")
sha256sums=('647af1c3fca9b155aaaaa69ed4720c3bc29efb1f9a2b330b0a8b98fc98f3b8e3')

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
