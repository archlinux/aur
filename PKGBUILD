# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pycoin
pkgver=0.92.20220213
pkgrel=1
_commit=62fd46a
pkgdesc="Utilities for Bitcoin and altcoin addresses and transaction manipulation"
url="https://github.com/richardkiss/pycoin"
arch=('any')
license=('MIT')
depends=('python')
makedepends=(
	'git'
	'python-setuptools-scm'
	'python-toml'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx')
checkdepends=('python-pytest')
changelog=CHANGES
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('1BE03D394138A2C2E2EF64D4E0F43326DBD8AB6A') ## Richard Kiss

prepare() {
	cd "$pkgname"
	sed -i \
		-e "/'block/s/block/pycoin-block/" \
		-e "/'ku/s/ku/pycoin-ku/" \
		-e "/'tx/s/tx/pycoin-tx/" \
		-e "/'msg/s/msg/pycoin-msg/" \
		-e "/'keychain/s/keychain/pycoin-keychain/" \
		-e "/'b58/s/b58/pycoin-b58/" \
		-e "/'coinc/s/coinc/pycoin-coinc/" \
		setup.py
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
	## FIXME: docs do not build
	# ( cd docs; make man )
}

check() {
	cd "$pkgname"
	PYTHONPATH=./ pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 \
		README.md \
		COMMAND-LINE-TOOLS.md \
		CREDITS \
		-t "$pkgdir/usr/share/doc/$pkgname/"
	# install -Dm644 docs/_build/man/pycoin.1 -t "$pkgdir/usr/share/man/man1/"
}
