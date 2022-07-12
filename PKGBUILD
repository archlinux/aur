# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pycoin
_pkg="${pkgname#python-}"
pkgver=0.92.20220529
pkgrel=1
_commit=199304f
pkgdesc="Utilities for Bitcoin and altcoin addresses and transaction manipulation"
url="https://github.com/richardkiss/pycoin"
arch=('any')
license=('MIT')
depends=('python-setuptools')
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
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
	make -C docs man
}

check() {
	cd "$pkgname"
	PYTHONPATH=./ pytest -x
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md COMMAND-LINE-TOOLS.md CREDITS -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 docs/_build/man/pycoin.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
