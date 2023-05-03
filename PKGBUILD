# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=openwebmonitor4
pkgver=4.5.0
pkgrel=1
epoch=
pkgdesc="OWM4 通用网页监控器"
arch=(x86_64 aarch64)
url="http://owm.fatecore.com/"
license=('proprietary')
groups=()
depends=(electron11 glibc gcc-libs)
makedepends=(asar)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("http://owm.fatecore.com/download/OpenWebMonitor4-4.5.0.zip")
source_x86_64=(
	"https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v3-linux-glibc-x64.tar.gz"
	)
source_aarch64=(
"https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v3-linux-glibc-arm64.tar.gz"
)
noextract=()
sha256sums=('9e96f0eb96c60352d76fa3d4b2dbb1110c5f79c178c60b742731c82237a07431')
sha256sums_x86_64=('b841dd05e3abc3f2c659f0f0f213fb61ef22264d4741f569e1ebf00775205943')
sha256sums_aarch64=('8e22a82d1ee3c6c415768cc88ecef9d32a5050ac08e4796b96571db0d72246c8')
validpgpkeys=()

prepare() {
	bsdtar -xvpf *.exe resources/
	rm -rf $srcdir/{*.gz}
	pushd resources
	asar e app.asar ./app
	pushd app/node_modules
	rm -rf node-gyp sqlite3/tools
	pushd sqlite3/lib/binding/
	cp -av $srcdir/napi-v3* ./
	mv napi-v3-linux-*-x64 napi-v3-linux-x64
}

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -av $srcdir/resources/app $pkgdir/opt/$pkgname/
	install -Dm755 /dev/null $pkgdir/usr/bin/openwebmonitor4
	echo "#!/bin/sh" >> $pkgdir/usr/bin/openwebmonitor4
	echo "electron11 /opt/$pkgname/app" >> $pkgdir/usr/bin/openwebmonitor4
}
