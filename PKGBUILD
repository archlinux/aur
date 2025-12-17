# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=3.4.0
pkgrel=1
pkgdesc="An award-winning free and open-source video editor"
arch=(any)
url="https://www.openshot.org/"
license=(GPL-3.0-Only)
depends=(
  ffmpeg
  hicolor-icon-theme
  libopenshot
  libopenshot-audio
  python
  python-pyqt5
  python-pyqt5-webengine
  python-pyzmq
  python-requests
  qt5-base
  qt5-svg
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  xorg-server-xvfb
)
optdepends=('faac: for exporting audio using AAC')
source=(
  https://github.com/OpenShot/openshot-qt/archive/v$pkgver/$pkgname-$pkgver.tar.gz
  $pkgname-2.6.1-no_metric_default.patch
)
sha512sums=('b017638455f3167a5248119b0bc29bd1c51f79b5c4404f95765a4e339d4382a888cce7dad2bd91a4844c08fd373c36008126eedf200b36011866209d43f9d3d6'
            'd52441559897ce0de476a6120b7e36b082bbcb0722436a77c1a60456a86d02f370df6bc58384c838a3ad2df47c1603a6fabd5044c303284bac2ea75a99a76a8a')
b2sums=('30902c15c002748d2286d75a5bca352f84263c4fa1c7e1995a2412381cf93046af7a3f1e1f4b96c7702ce635c77f329cd50346c8aa44b1f9e32358f0eca773d6'
        '6f75f37be8d3e03090a8ca53e645b3269f92c7f44aa39cfbe1a03266a36d508d5c18eebbb5792ed9d6d031b3694902bc3fa3a2dac745aad60b2bc331657a364a')

prepare() {
	cd $pkgname-qt-$pkgver
	# disable default metric collection with google analytics
	patch -Np1 -i ../$pkgname-2.6.1-no_metric_default.patch
}

build() {
	cd $pkgname-qt-$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd $pkgname-qt-$pkgver
	xvfb-run python src/tests/query_tests.py
}

package() {
	python -m installer --destdir="$pkgdir" $pkgname-qt-$pkgver/dist/*.whl
	cd $pkgname-qt-$pkgver
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/"  {AUTHORS,CONTRIBUTING,README}.md
}
