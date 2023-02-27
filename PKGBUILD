# Maintainer:  Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>
# Contributor: Narrat <autumn-wind at web dot de>
# Contributor: David Scholl <djscholl at gmail dot com>

pkgname=leo
pkgver=6.7.1
pkgrel=1
pkgdesc="Outliner, Editor, and Personal Information Manager"
arch=('any')
url='https://github.com/leo-editor/leo-editor'
license=('MIT' 'BSD')
depends=(
	'jupyter-nbformat'
	'python-asttokens'
	'python-black'
	'python-docutils'
	'python-flexx'
	'python-meta'
	'python-pyflakes'
	'python-pylint'
	'python-pyqt5'
	'python-pyqtwebengine'
	'python-pyshortcuts'
	'python-sphinx'
	'shared-mime-info')
makedepends=(
	'dos2unix'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
optdepends=('python-pyenchant: spellchecking support')
# checkdepends=('python-pytest')
provides=('leo-editor')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/leo/leo-${pkgver/_/-}.tar.gz"
        'remove-tests.patch'
        'leo.desktop'
        'leo.xml')
sha256sums=('e5671503a1d0d62a9a00a01470b2b23a6f3cb0d35808cc499509f15dd91e066f'
            'cc351848ffa6ce740c8cbb74f60363b6f4b3f3fccd90a09512e76900006f37fa'
            '4633876eb91eff206660359ee7da459211e8f87fd73ebbc680fd437c70b63467'
            '630852279324b0d9acf656c4684f16777d64f49b4062bd101c5cddbfc33c82cb')

prepare() {
	cd "$pkgname-$pkgver"
	dos2unix setup.py
	patch -p1 -l < "$srcdir/remove-tests.patch"
}

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

## FIXME: tests cause a Python abort
# check() {
# 	cd "$pkgname-editor-$pkgver"
# 	pytest -x --disable-warnings
# }

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dvm644 "$srcdir/leo.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dvm644 "$srcdir/leo.xml" -t "$pkgdir/usr/share/mime/packages/"
	install -Dvm644 "leo/Icons/application-x-leo-outline.png" "$pkgdir/usr/share/pixmaps/leo.png"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/leo-${pkgver%_*}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
