# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=apptimer
pkgver=1.1.0
pkgrel=2
epoch=
pkgdesc="APP用量统计，工作小时数统计，掌握全天/周/月工作状态"
arch=(x86_64 aarch64)
url="http://apptimer.fatecore.com/"
license=('PRIVATE')
groups=()
depends=(bash electron11)
makedepends=(npm bash asar p7zip)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("http://apptimer.fatecore.com/download/latest/overwork-win32-latest.zip"
	patch
	active-win.patch)
noextract=()
sha256sums=('cb5e4394fc9c9d4044c6a244a99f33262aebcf1483c73121ad5cb3c040b67def'
            'e5ffdbbad49e5e5ca5942ba6a8a223640340b46b808c23a442a1314bf8643b14'
            '1fe7b048fb4ac1772ccaa5080b90f9f6471c467d7f9fdfa637b1851934108b94')
validpgpkeys=()

prepare() {
	7z x *.exe
	pushd "\$PLUGINSDIR"
	7z x ./app-32.7z
	pushd resources
	asar e ./app.asar $srcdir/app
	popd
	popd
	pushd app
	npm i sqlite3@5.0.2 ffi-napi@4.0.3 active-win@8.1.0 node-key-sender@1.0.11
	npm uninstall ffi active-win-lite robotjs
	patch -p1 < $srcdir/patch
	pushd node_modules/active-win/lib/
	patch -p1 < $srcdir/active-win.patch
}

package() {
	install -Dm755 /dev/null $pkgdir/usr/bin/$pkgname
	echo "#!/bin/sh" >> $pkgdir/usr/bin/$pkgname
	echo "electron11 /opt/$pkgname/app" >> $pkgdir/usr/bin/$pkgname
	install -d $pkgdir/opt/$pkgname/
	cp -av app $pkgdir/opt/$pkgname/
}
