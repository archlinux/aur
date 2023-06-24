# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=openwebmonitor3
pkgver=3.5.2
pkgrel=2
pkgdesc="通用型网页内容监控工具"
arch=(x86_64 aarch64)
url="http://owm.fatecore.com/"
license=('proprietary')
depends=(electron11)
makedepends=(asar npm gendesk)
options=(!strip)
source=("http://owm.fatecore.com/download/OpenWebMonitor3-3.5.2.zip"
        "patch")
source_x86_64=(
	"https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v6-linux-glibc-x64.tar.gz"
	)
source_aarch64=(
"https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v6-linux-glibc-arm64.tar.gz"
)
sha256sums=('f788d367c73e5f287405452bce6b8d8b1f263e76fd4ff76a8c8b42e8e6e8f8a4'
            'dd6f93c153dc09ba60dae10bb3a16912c69469c9715231310ade3b85977fab03')
sha256sums_x86_64=('d31475a48731bda50747d4187f46f028565e84086473b55e165e9e4447430164')
sha256sums_aarch64=('4cfa941ac72e76eac65bb1e6e4668fd5c94c2179c8680c4a445f77644e819d08')

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
	cp -av $srcdir/napi-v* ./
	mv napi-v6-linux-*-x64 napi-v6-linux-x64
}

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -av $srcdir/resources/app $pkgdir/opt/$pkgname/
	echo "#!/bin/sh\nelectron11 /opt/$pkgname/app" | install -Dm755 /dev/stdin $pkgdir/usr/bin/$pkgname
	find $pkgdir -name "icon.png" -type f -exec install -Dm644 {} $pkgdir/usr/share/pixmaps/$pkgname.png \;
	gendesk --pkgname $pkgname --pkgdesc $pkgdesc
	install -Dm644 $pkgname.desktop -t $pkgdir/usr/share/applications/
}
