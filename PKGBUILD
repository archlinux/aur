# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=irreader1.5.9
pkgver=1.5.9
pkgrel=9
pkgdesc="万能订阅阅读器，订阅任何网站。this is the last free version"
arch=(x86_64 aarch64)
url="http://irreader.fatecore.com/"
license=('proprietary')
depends=(gcc-libs glibc bash electron11)
makedepends=(asar npm)
options=(!strip)
source=("irreader Setup 1.5.9.exe::https://github.com/wuyudi/Use-irreader-on-linux/raw/master/irreader%20Setup%201.5.9.exe"
	patch
	$pkgname.desktop)
source_x86_64=("https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v6-linux-glibc-x64.tar.gz")
source_aarch64=("https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v6-linux-glibc-arm64.tar.gz")
sha256sums=('5cf058020acf85478b263ca367a66ea6e943860c1532132e0c7dbab401374702'
            '0a861e557f0cb3cc3db0c2f503a62c1935774a2eaed54ae907d2bbe4c5986607'
            '62d1f86255c32b15e557b227d9c38cc6adb7b6af1c9c52dd4842d47e76eb2aee')
sha256sums_x86_64=('d31475a48731bda50747d4187f46f028565e84086473b55e165e9e4447430164')
sha256sums_aarch64=('4cfa941ac72e76eac65bb1e6e4668fd5c94c2179c8680c4a445f77644e819d08')

prepare() {
	rm ./*.pak ./*.dll ./*.bin ./*.gz
	pushd resources
	asar e app.asar ./app
	pushd app
	# to fixed version
	npm i iconv@3.0.1
	npm i sqlite3@5.0.2
	npm uninstall ad-block-lite
	cp -av "$srcdir"/napi-v* ./node_modules/sqlite3/lib/binding/
	rm -rf ./node_modules/{node-gyp,sqlite3/{deps,src,tools},node-addon-api}
	patch -p1 <"$srcdir"/patch
}

package() {
	install -d "$pkgdir"/opt/$pkgname
	cp -av "$srcdir"/resources/app "$pkgdir"/opt/$pkgname/
	echo -e "#!/bin/sh\nelectron11 /opt/$pkgname/app" | install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$pkgname
	install -Dm644 $pkgname.desktop -t "$pkgdir"/usr/share/applications/
	find . -type f -name "icon_about_win.png" -exec install -Dm644 {} "$pkgdir"/usr/share/pixmaps/$pkgname.png \;
}
