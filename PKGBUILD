# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=ummguard
pkgver=1.0.3
pkgrel=1
epoch=
pkgdesc="保持软件始终运行,软件闪退后自动拉起"
arch=(x86_64 aarch64)
url="https://fatecore.com/p/ummguard/"
license=('PRIVATE')
groups=()
depends=(electron7 bash)
makedepends=(npm asar)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("https://fatecore-apps-1253910480.cos.ap-shanghai.myqcloud.com/ummguard/ummguard-1.0.3-win.zip"
        )
noextract=()
sha256sums=('058c97657c0866af241814759d627c4fad431ee309a7a354226f6fbf3be7e330')
validpgpkeys=()

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
