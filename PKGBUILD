# Maintainer:  Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>
# Contributor: Narrat <autumn-wind at web dot de>
# Contributor: David Scholl <djscholl at gmail dot com>

pkgname=leo
pkgver=6.6
pkgrel=1
pkgdesc="Outliner, Editor, and Personal Information Manager"
arch=('any')
url='https://github.com/leo-editor/leo-editor'
license=('MIT' 'BSD')
depends=(
	'python-pyqt5'
	'python-pyqtwebengine'
	'python-asttokens'
	'python-docutils'
	'python-flexx'
	'python-meta'
	'python-pylint'
	'python-pyflakes'
	'python-black'
	'python-pyshortcuts'
	'python-sphinx'
	'jupyter-nbformat'
	'shared-mime-info')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
optdepends=('python-pyenchant: spellchecking support')
provides=('leo-editor')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'leo.desktop'
        'leo.xml')
sha256sums=('aa08ad516c3ef20d2d0c9190f2c0cb2786656e98b68091cc37bf720ece9123ee'
            '4633876eb91eff206660359ee7da459211e8f87fd73ebbc680fd437c70b63467'
            '630852279324b0d9acf656c4684f16777d64f49b4062bd101c5cddbfc33c82cb')

prepare() {
	cd "$pkgname-editor-$pkgver"
	sed -i \
		-e '/setupext-janitor/d' \
		-e '/wheel/s/,/]/' \
		-e '/twine/d' \
		pyproject.toml
}

build() {
	cd "$pkgname-editor-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-editor-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "$srcdir/leo.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "$srcdir/leo.xml" -t "$pkgdir/usr/share/mime/packages/"
	install -Dm644 "leo/Icons/application-x-leo-outline.png" "$pkgdir/usr/share/pixmaps/leo.png"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/leo-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
