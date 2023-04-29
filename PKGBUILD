# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=irreader1.5.9
pkgver=1.5.9
pkgrel=1
epoch=
pkgdesc="万能订阅阅读器，订阅任何网站。this is the last free version"
arch=(x86_64 aarch64)
url="http://irreader.fatecore.com/"
license=('proprietary')
groups=()
depends=(gcc-libs glibc bash electron3)
makedepends=(asar npm)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("local://irreader Setup 1.5.9.exe"
	irreader.desktop)
source_x86_64=("https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v3-linux-glibc-x64.tar.gz")
source_aarch64=("https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v3-linux-glibc-arm64.tar.gz")
noextract=()
sha256sums=('6b2f61d035441ca9949a4de4a3e6249007b9c7633548a7653f5c6fb0780c29cb'
            '0703e232b5b8537f64f572d855ec777433dcc67e28cc9da0a4f03ca75753aa8c')
sha256sums_x86_64=('b841dd05e3abc3f2c659f0f0f213fb61ef22264d4741f569e1ebf00775205943')
sha256sums_aarch64=('8e22a82d1ee3c6c415768cc88ecef9d32a5050ac08e4796b96571db0d72246c8')
validpgpkeys=()

prepare() {
	rm *.pak *.dll *.bin *.gz
	pushd resources
	asar e app.asar ./app
	pushd app
	# to fixed version
	npm i iconv@3.0.1
	npm i sqlite3@5.0.2
	npm uninstall ad-block-lite
	cp -av $srcdir/napi-v3* ./node_modules/sqlite3/lib/binding/
	rm -v adb.js
	sed -i "s!const adb.*!!g" main.js
	sed -i "s!    let shouldBeBlocked = g_config_cache.adb && .*!    let shouldBeBlocked = false!g" main.js
	sed -i "220,221d" main.js
	# adb seems have some problems.. so I remove it.
}


package() {
	install -d $pkgdir/opt/irreader
	cp -av $srcdir/resources/app $pkgdir/opt/irreader/
	install -Dm755 /dev/null $pkgdir/usr/bin/irreader
	echo "#!/bin/sh" >> $pkgdir/usr/bin/irreader
	echo "electron3 /opt/irreader/app" >> $pkgdir/usr/bin/irreader
	install -Dm644 irreader.desktop -t $pkgdir/usr/share/applications/
}
