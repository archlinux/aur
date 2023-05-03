# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <youremail@domain.com>
pkgname=irreader1.5.9
pkgver=1.5.9
pkgrel=7
epoch=
pkgdesc="万能订阅阅读器，订阅任何网站。this is the last free version"
arch=(x86_64 aarch64)
url="http://irreader.fatecore.com/"
license=('proprietary')
groups=()
depends=(gcc-libs glibc bash electron11)
makedepends=(asar npm)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("irreader Setup 1.5.9.exe::https://ipfs.io/ipfs/QmTuCHDhHVYTuyYvEKQW4pf1ZTyZYUNFGCtKdiJ4Tz4m8N?filename=irreader%20Setup%201.5.9.exe"
	patch
	irreader.desktop)
source_x86_64=("https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v3-linux-glibc-x64.tar.gz")
source_aarch64=("https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v3-linux-glibc-arm64.tar.gz")
noextract=()
sha256sums=('5cf058020acf85478b263ca367a66ea6e943860c1532132e0c7dbab401374702'
            'cceadd2a859e263fe26d7aa63f6977ca1a90f0e853ddd68fd4be0c73f3d8e88d'
            '0fcaa9f67c08bef24eb2c291e6f109db664630326eabdb41c56412bbac17085b')
sha256sums_x86_64=('b841dd05e3abc3f2c659f0f0f213fb61ef22264d4741f569e1ebf00775205943')
sha256sums_aarch64=('8e22a82d1ee3c6c415768cc88ecef9d32a5050ac08e4796b96571db0d72246c8')
validpgpkeys=()

prepare() {
	rm ./*.pak ./*.dll ./*.bin ./*.gz
	pushd resources
	asar e app.asar ./app
	pushd app
	# to fixed version
	npm i iconv@3.0.1
	npm i sqlite3@5.0.2
	npm uninstall ad-block-lite
	cp -av "$srcdir"/napi-v3* ./node_modules/sqlite3/lib/binding/
	rm -rf ./node_modules/{node-gyp,sqlite3/{deps,src,tools},node-addon-api}
	patch -p1 < "$srcdir"/patch
}


package() {
	install -d "$pkgdir"/opt/irreader
	cp -av "$srcdir"/resources/app "$pkgdir"/opt/irreader/
	install -Dm755 /dev/null "$pkgdir"/usr/bin/irreader
	echo "#!/bin/sh" >> "$pkgdir"/usr/bin/irreader
	echo "electron11 /opt/irreader/app" >> "$pkgdir"/usr/bin/irreader
	install -Dm644 irreader.desktop -t "$pkgdir"/usr/share/applications/
	find . -type f -name "icon_about_win.png" -exec install -Dm644 {} "$pkgdir"/usr/share/pixmaps/irreader.png \;
}
