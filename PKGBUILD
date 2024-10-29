# Maintainer: MelianMiko <melianmiko@gmail.com>
pkgname=openfreebuds
pkgver=0.14.0
pkgrel=2
pkgdesc="Manager for HUAWEI FreeBuds"
arch=(any)
url="https://mmk.pw/en/openfreebuds"
license=('GPLv3')
depends=(python python-dbus-next python-psutil python-pyqt6 python-qasync python-aiohttp python-pillow)
makedepends=(python-pip python python-poetry qt6-tools) 
source=("$pkgname-$pkgver::git+https://github.com/melianmiko/openfreebuds.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver/"

	# someone forgot to make pyuic6 executable in python-pyqt6////
	mkdir -p .bin
	cp /usr/bin/pyuic6 .bin/
	chmod +x .bin/pyuic6
	export PATH="$PWD/.bin:$PATH"

	bash ./scripts/make_qt_parts.sh
	poetry build
}

package() {
	dist_packages_path="/usr/lib/python3.12/site-packages"

	cd "$pkgname-$pkgver/"
	pip install --upgrade --no-dependencies --target="$pkgdir$dist_packages_path" dist/*.whl

	mkdir -p $pkgdir/usr/bin
	mv $pkgdir$dist_packages_path/bin/* $pkgdir/usr/bin/
	ln -s $pkgdir/usr/bin/openfreebuds_qt $pkgdir/usr/bin/openfreebuds
	sed -i '1 s/^.*$$/\#\!\/usr\/bin\/env python3/' $pkgdir/usr/bin/*
	rm -rf $pkgdir$dist_packages_path/bin
	
	cd scripts/build_flatpak
	mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps
	install -Dm644 ./pw.mmk.OpenFreebuds.png $pkgdir/usr/share/icons/hicolor/256x256/apps/pw.mmk.OpenFreebuds.png
	mkdir -p $pkgdir/usr/share/applications
	install -Dm644 ./pw.mmk.OpenFreebuds.desktop $pkgdir/usr//share/applications/pw.mmk.OpenFreebuds.desktop
	mkdir -p $pkgdir/usr/share/metainfo
	install -Dm644 pw.mmk.OpenFreebuds.metainfo.xml -t $pkgdir/usr/share/metainfo
}

