# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=monophony
pkgver=4.0.0
pkgrel=1
pkgdesc="Linux app for streaming music from YouTube."
arch=('any')
url="https://gitlab.com/zehkira/monophony"
license=('0BSD')
groups=()
depends=(
	'libadwaita'
	'python-brotli'
	'python-gobject'
	'python-mpris_server'
	'python-mprisify'
	'python-mutagen'
	'python-pycryptodomex'
	'python-requests'
	'python-websockets'
	'python-ytmusicapi'
	'yt-dlp'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('d2b7dc05b12b8d4221108db03ab1e8b6356dfecc701ceb6f8480052914f4ac4a')

prepare() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	sed -i "/pip3 install/d" Makefile

	# https://gitlab.com/zehkira/monophony/-/issues/208
	sed -i "/for/ s/os\.getenv(\(.*\), \([^)]*\))\(.*\):/[\2]:/g" bin/monophony.py
}

build() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	python -m installer --destdir="$pkgdir" dist/*.whl
	make install prefix="$pkgdir/usr"
}
