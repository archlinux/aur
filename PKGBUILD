# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=openwebmonitor3
pkgver=3.5.2
pkgrel=2
pkgdesc="通用型网页内容监控工具"
arch=(x86_64 aarch64)
url="http://owm.fatecore.com/"
license=('proprietary')
depends=(electron11 glibc gcc-libs bash)
makedepends=(asar npm)
source=("local://OpenWebMonitor3-3.5.2.zip"
	"patch"
	$pkgname.desktop)
source_x86_64=(
	"https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v6-linux-glibc-x64.tar.gz"
)
source_aarch64=(
	"https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v6-linux-glibc-arm64.tar.gz"
)
sha256sums=('f788d367c73e5f287405452bce6b8d8b1f263e76fd4ff76a8c8b42e8e6e8f8a4'
            'dd6f93c153dc09ba60dae10bb3a16912c69469c9715231310ade3b85977fab03'
            '91044ca6e7e70b8ff72f4cb758d5e82395f6e4fda957020f27a7eaa75c4c7cf7')
sha256sums_x86_64=('d31475a48731bda50747d4187f46f028565e84086473b55e165e9e4447430164')
sha256sums_aarch64=('4cfa941ac72e76eac65bb1e6e4668fd5c94c2179c8680c4a445f77644e819d08')
options=(!emptydirs)

prepare() {
	bsdtar -xvpf ./**/*.exe resources/
	rm -rf $srcdir/{*.gz}
	pushd resources
	asar e app.asar ./app
	pushd app
	npm i sqlite3@5.0.2
	patch -p1 --verbose <$srcdir/patch
	pushd node_modules
	rm -rf node-gyp sqlite3/tools
	pushd sqlite3/lib/binding/
	cp -a $srcdir/napi-v* ./
	mv napi-v6-linux-*-x64 napi-v6-linux-x64
	find $srcdir \( \
		-name "Dockerfile" \
		-or -name "*.h" \
		-or -name "*.ts" \
		-or -name "package-lock.json" \
		-or -name "*.cc" \
		-or -name "cli.js" \
		-or -name "*.py" \
		-or -name "build.js" \
		\) -type f -delete
	find $srcdir \( \
		-path "*/bin/*" \
		-or -path "*/test/*" \
		-or -path "*/example/*" \
		-or -path "*/examples/*" \
		-or -path "*/.bin/*" \
		\) \( -type f -or -type l \) -delete
	find $srcdir -name "*.1" -path "*/man/*" -type f -delete
	find $srcdir \( -name "package-lock.json" -or -name "Makefile" \) -delete
}

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -a $srcdir/resources/app $pkgdir/opt/$pkgname/
	printf "#!/bin/bash
exec electron11 /opt/$pkgname/app \"\$@\"
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/$pkgname
	find $pkgdir -name "icon.png" -print -type f -exec install -Dm644 {} $pkgdir/usr/share/pixmaps/$pkgname.png \;
	install -vDm644 $pkgname.desktop -t $pkgdir/usr/share/applications/
}
