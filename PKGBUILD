# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=newitemmonitor
pkgver=1.0.3
pkgrel=2
pkgdesc="通用型上新监控器，上新时获得通知"
arch=(x86_64 aarch64)
url="https://fatecore.com/p/nim/"
license=('private')
depends=(electron4 bash)
makedepends=(asar npm gendesk)
options=(!strip)
source=("http://resource.fatecore.com/nim/nim-v${pkgver}-win.zip"
)
sha256sums=('37aa6933e5583833448f9e9410f54d39b27b55de0e5ef4969b6047eb692c5128')

prepare() {
	bsdtar -xvpf *.exe resources
	pushd resources
	asar e app.asar ./app
	pushd app
	echo 'exports.vip_source_limit = Infinity;' >> ./scsdef.js
	echo 'exports.isVIP = () => true;' >> ./sk_electron_common/scs/libscs.js
	echo 'exports.getVipLeftDays = () => 999;' >> ./sk_electron_common/scs/libscs.js
	npm i sqlite3@5.0.2
	rm -rf node_modules/{node-gyp,@types}
}

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -av resources/app $pkgdir/opt/$pkgname/
	echo -e "#!/bin/sh\nelectron4 /opt/$pkgname/app" | install -Dm755 /dev/stdin $pkgdir/usr/bin/$pkgname
	find $pkgdir -name "icon.png" -type f -exec install -Dm644 {} $pkgdir/usr/share/pixmaps/$pkgname.png \;
	gendesk --pkgname $pkgname --pkgdesc $pkgdesc
	install -Dm644 $pkgname.desktop -t $pkgdir/usr/share/applications/
}
