# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname=firedm
_pkg=FireDM
pkgver=2022.2.5
pkgrel=1
pkgdesc="Python open source alternative to IDM (Internet Download Manager)"
arch=('any')
url='https://github.com/firedm/FireDM'
license=('LGPL3' 'custom')
depends=(
	'ffmpeg'
	'python-awesometkinter'
	'python-certifi'
	'python-packaging'
	'python-pillow'
	'python-plyer'
	'python-pycurl'
	'python-pystray'
	'youtube-dl'
	'yt-dlp')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
changelog=CHANGELOG
replaces=('pyidm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        firedm.{desktop,png})
sha256sums=('60522ba6aac88f88fd0405fa2d5b7ff26c590a23caa749a38e178078d7f71a58'
            '6eede2b395834a874257d54a4ad8b62da32f2b287ce94d7335b63623a5475c2d'
            '31685c2b1900e780c75b016db28c5fe41c2c354643b7222429d9c8b02234b49c')

prepare() {
	sed -i '/disable_update_feature/s/False/True/' "$_pkg-$pkgver/firedm/config.py"
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	install -Dm644 firedm.png -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 firedm.desktop -t "$pkgdir/usr/share/applications/"
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
