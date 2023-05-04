# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=irreader
pkgver=1.6.10
pkgrel=1
epoch=
pkgdesc="订阅网页、RSS和Podcast，具备急速的阅读体验，"
arch=(x86_64 aarch64)
url="http://irreader.fatecore.com/"
license=('PRIVATE')
groups=()
depends=(electron11 bash)
makedepends=(asar npm)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("http://irreader.fatecore.com/download/irreader-$pkgver.zip"
	$pkgname.desktop)
source_x86_64=("https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v6-linux-glibc-x64.tar.gz")
source_aarch64=("https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.6/napi-v6-linux-glibc-arm64.tar.gz")
noextract=()
sha256sums=('72a0adf30e6a661a710f6555adf3b13c43df7829ac3bf888e80812437e28df8b'
            '65dfbe4147cc28945224bc554e2bdce2c98655d813a7ccb4fcc7de045c1053a9')
sha256sums_x86_64=('d31475a48731bda50747d4187f46f028565e84086473b55e165e9e4447430164')
sha256sums_aarch64=('4cfa941ac72e76eac65bb1e6e4668fd5c94c2179c8680c4a445f77644e819d08')
validpgpkeys=()

prepare() {
	rm *.gz
	bsdtar -xvpf *.exe ./resources
	asar e ./**/app.asar ./app
	pushd app
	cp -av $srcdir/napi-* ./node_modules/sqlite3/lib/binding
}

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -av app $pkgdir/opt/$pkgname/
	install -Dm755 /dev/null $pkgdir/usr/bin/$pkgname
	echo "#!/bin/sh" >> $pkgdir/usr/bin/$pkgname
	echo "electron11 /opt/$pkgname/app" >> $pkgdir/usr/bin/$pkgname
	install -Dm644 $pkgname.desktop -t "$pkgdir"/usr/share/applications/
	find . -type f -name "icon_about_win.png" -exec install -Dm644 {} "$pkgdir"/usr/share/pixmaps/$pkgname.png \;
}
