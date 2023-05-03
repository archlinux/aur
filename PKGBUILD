# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=openwebmonitor3
pkgver=3.5.2
pkgrel=1
epoch=
pkgdesc="通用型网页内容监控工具"
arch=(x86_64 aarch64)
url="http://owm.fatecore.com/"
license=('proprietary')
groups=()
depends=(electron11)
makedepends=(asar)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://owm.fatecore.com/download/OpenWebMonitor3-3.5.2.zip"
        "patch")
source_x86_64=(
	"https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v3-linux-glibc-x64.tar.gz"
	)
source_aarch64=(
"https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v3-linux-glibc-arm64.tar.gz"
)
noextract=()
sha256sums=('f788d367c73e5f287405452bce6b8d8b1f263e76fd4ff76a8c8b42e8e6e8f8a4'
            'dd6f93c153dc09ba60dae10bb3a16912c69469c9715231310ade3b85977fab03')
sha256sums_x86_64=('b841dd05e3abc3f2c659f0f0f213fb61ef22264d4741f569e1ebf00775205943')
sha256sums_aarch64=('8e22a82d1ee3c6c415768cc88ecef9d32a5050ac08e4796b96571db0d72246c8')
validpgpkeys=()

prepare() {
	bsdtar -xvpf ./**/*.exe resources/
	rm -rf $srcdir/{*.gz}
	pushd resources
	asar e app.asar ./app
	pushd app
	npm i sqlite3@5.0.2
	patch -p1 < $srcdir/patch
	pushd node_modules
	rm -rf node-gyp sqlite3/tools
	pushd sqlite3/lib/binding/
	cp -av $srcdir/napi-v3* ./
	mv napi-v3-linux-*-x64 napi-v3-linux-x64
}

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -av $srcdir/resources/app $pkgdir/opt/$pkgname/
	install -Dm755 /dev/null $pkgdir/usr/bin/$pkgname
	echo "#!/bin/sh" >> $pkgdir/usr/bin/$pkgname
	echo "electron11 /opt/$pkgname/app" >> $pkgdir/usr/bin/$pkgname
}
