# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: digital mystik <dgtl_mystik at protonmail dot ch>

_name=trezor-agent
pkgname=python-trezor-agent
pkgver=0.14.4
pkgrel=1
pkgdesc="Using hardware wallets as SSH/GPG agent"
arch=('any')
url="https://github.com/romanz/trezor-agent"
license=('LGPL3')
depends=('python-docutils' 'python-shutilwhich' 'python-trezor'
         'python-configargparse' 'python-daemon' 'python-ecdsa' 'python-pynacl'
         'python-mnemonic' 'python-pymsgbox' 'python-semver' 'python-unidecode')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cbab620a1e21fed8089fcb7682c9d37500f0b60a5fb6e2d4d56ec261c67dabe6')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
	cd agents/trezor
	python -m build --wheel --no-isolation -o "$srcdir/$_name-$pkgver/dist/"
}

package() {
	cd "$_name-$pkgver"
	for i in dist/*.whl
	do
		PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" "$i"
	done

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/libagent-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
