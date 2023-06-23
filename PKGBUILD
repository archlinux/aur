
# Maintainer: Your Name <youremail@domain.com>
# Contributor: Asuka Minato
pkgname=ummguard
pkgver=1.0.3
pkgrel=1
pkgdesc="保持软件始终运行,软件闪退后自动拉起"
arch=(x86_64 aarch64)
url="https://fatecore.com/p/ummguard/"
license=('PRIVATE')
depends=(electron7 bash)
makedepends=(npm asar)
options=(!strip)
source=("https://fatecore-apps-1253910480.cos.ap-shanghai.myqcloud.com/ummguard/ummguard-1.0.3-win.zip"
        )
sha256sums=('058c97657c0866af241814759d627c4fad431ee309a7a354226f6fbf3be7e330')

prepare() {
	bsdtar -xvpf *.exe
	pushd resources
	asar e app.asar ./app
	pushd app
	npm i sqlite3@5.0.2
	rm -rf node_modules/{electron,@types,node-gyp,typescript}
	rm -rf node_modules/**/test
	# I don't know why it's so large, > 100M. But it works.
}

package() {
	install -d $pkgdir/opt/$pkgname
	cp -av resources/app $pkgdir/opt/$pkgname
	install -Dm755 /dev/null $pkgdir/usr/bin/$pkgname
	echo "#!/bin/sh" >> $pkgdir/usr/bin/$pkgname
	echo "electron7 /opt/$pkgname/app" >> $pkgdir/usr/bin/$pkgname
}
