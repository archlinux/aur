# Maintainer:  Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>
# Contributor: Narrat <autumn-wind at web dot de>
# Contributor: David Scholl <djscholl at gmail dot com>

pkgname=leo
pkgver=6.6.4
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
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-pyenchant: spellchecking support')
# checkdepends=('python-pytest')
provides=('leo-editor')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'leo.desktop'
        'leo.xml')
sha256sums=('abda5fef1ab9af22e9f77f0afc39ceb27c99eb338b925a8b31a03a848020349f'
            '4633876eb91eff206660359ee7da459211e8f87fd73ebbc680fd437c70b63467'
            '630852279324b0d9acf656c4684f16777d64f49b4062bd101c5cddbfc33c82cb')

prepare() {
	cd "$pkgname-editor-$pkgver"
	sed -i -e '/setupext-janitor/d' -e '/wheel/s/,/]/' -e '/twine/d' pyproject.toml
	# sed -i '/packages=/s/()/(exclude=["leo.test.*", "leo.unittests.*"])/' setup.py
}

build() {
	cd "$pkgname-editor-$pkgver"
	python -m build --wheel --no-isolation
}

## FIXME: tests cause a Python abort
# check() {
# 	cd "$pkgname-editor-$pkgver"
# 	pytest -x --disable-warnings
# }

package() {
	cd "$pkgname-editor-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "$srcdir/leo.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "$srcdir/leo.xml" -t "$pkgdir/usr/share/mime/packages/"
	install -Dm644 "leo/Icons/application-x-leo-outline.png" "$pkgdir/usr/share/pixmaps/leo.png"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/leo-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
