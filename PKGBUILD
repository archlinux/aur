# Maintainer: Aron Young <tkf6fkt at gmail dot com>
# Contributor: Asuka Minato
pkgname=openwebmonitor4
pkgver=4.5.2
pkgrel=1
pkgdesc="OWM4 通用网页监控器"
arch=(x86_64 aarch64)
url="http://owm.fatecore.com/"
license=('proprietary')
_electron=electron6
depends=("${_electron}" glibc gcc-libs)
makedepends=(asar)
options=(!strip)
source=("http://owm.fatecore.com/download/OpenWebMonitor4-${pkgver}.zip")
source_x86_64=(
	"https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v3-linux-glibc-x64.tar.gz"
)
source_aarch64=(
	"https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v3-linux-glibc-arm64.tar.gz"
)
sha256sums=('3db34d947fd2c0424937dad1a4b0758109b178dcc9cb6af94abe801b303ee316')
sha256sums_x86_64=('b841dd05e3abc3f2c659f0f0f213fb61ef22264d4741f569e1ebf00775205943')
sha256sums_aarch64=('8e22a82d1ee3c6c415768cc88ecef9d32a5050ac08e4796b96571db0d72246c8')

prepare() {
	bsdtar -xvpf *.exe resources/
	rm -rf $srcdir/{*.gz}
	pushd resources
	asar e app.asar ./app
	pushd app
	echo 'exports.free_version_target_limit = 0xffffff;' >>./utils.js
	echo 'exports.is_registered = () => true;' >>./utils.js
	echo ';function is_vip(){return true;}' >>./settings.js
	pushd node_modules
	rm -rf node-gyp sqlite3/tools
	pushd sqlite3/lib/binding/
	cp -av $srcdir/napi-v3* ./
	mv napi-v3-linux-*-x64 napi-v3-linux-x64
}

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -av $srcdir/resources/app $pkgdir/opt/$pkgname/
	echo -e "#!/bin/sh\n${_electron} /opt/$pkgname/app" | install -Dm755 /dev/stdin $pkgdir/usr/bin/openwebmonitor4
}

