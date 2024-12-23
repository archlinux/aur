# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=3.3.0
pkgrel=2
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
sha512sums=('3744653ed8e89e52f72975891e3c357752baa8f99f04e5492072f366fc842b97852a2380bc1bc122bdbf4de6b7afab50d2f906a6f3701fcb798739364701fa77'
            'd52441559897ce0de476a6120b7e36b082bbcb0722436a77c1a60456a86d02f370df6bc58384c838a3ad2df47c1603a6fabd5044c303284bac2ea75a99a76a8a')
b2sums=('d3d5d8c5394a3c8182f22978f660eb0b7f9a5d7fcb5d6e299f9d802c692ac12ba8c59b8901029f300f5747737b7163812621bf2b38ed476fccc98e2848a12e6c'
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
