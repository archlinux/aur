# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=irreader
pkgver=1.7.2
pkgrel=1
_sqlite3=5.1.7
pkgdesc="订阅网页、RSS和Podcast，具备急速的阅读体验，"
arch=(x86_64 aarch64)
url="http://irreader.fatecore.com/"
license=('PRIVATE')
depends=(electron32 bash gcc-libs glibc)
makedepends=(asar npm)
options=(!emptydirs)
source=("http://download.fatecore.com/irreader/irreader-$pkgver.zip"
	$pkgname.desktop)
source_x86_64=("https://github.com/TryGhost/node-sqlite3/releases/download/v$_sqlite3/sqlite3-v$_sqlite3-napi-v6-linux-x64.tar.gz"
	"https://github.com/TryGhost/node-sqlite3/releases/download/v$_sqlite3/sqlite3-v$_sqlite3-napi-v3-linux-x64.tar.gz")
source_aarch64=("https://github.com/TryGhost/node-sqlite3/releases/download/v$_sqlite3/sqlite3-v$_sqlite3-napi-v6-linux-arm64.tar.gz"
	"https://github.com/TryGhost/node-sqlite3/releases/download/v$_sqlite3/sqlite3-v$_sqlite3-napi-v3-linux-arm64.tar.gz")
sha256sums=('17df82ed55ec3b1dfa7334adbfccc5297bb93bd146f385bcbd60acdd9339a2e0'
            '65dfbe4147cc28945224bc554e2bdce2c98655d813a7ccb4fcc7de045c1053a9')
sha256sums_x86_64=('6d1f7a95e5aca90db1fd6a2839380a021d5ee23d46f2d7c520ded094da813fed'
                   'e1bc73859d215361ae18af3faf4c246a25b52aa782317c890dea2c0fda123437')
sha256sums_aarch64=('0f112c63a74bebdffce298792c264b3af4b85d7fe1975a4bca1227438f531dbb'
                    '61d1d092cb2fdad28eaf786ab950955cef5fe37a137f9cbd88c867ee56553b52')

prepare() {
	rm *.gz
	bsdtar -xvpf *.exe ./resources
	asar e ./**/app.asar ./app
	printf "
exports.is_vip = () => true;
exports.left_vip_days = () => 999;
exports.is_need_show_vip_renew = () => false;
" >>./app/libuser.js
	printf "
exports.vip_source_limit = Infinity;
" >>./app/scs/scsdef.js
	pushd app
	rm -vrf ./node_modules/sqlite3/build/*
	cp -av $srcdir/build ./node_modules/sqlite3/
	rm -vrf ./node_modules/node-gyp/
	rm -vrf ./node_modules/sqlite3/{build-tmp-napi-v6,deps}
	find . \( -name "cli.js" -or -name "bin.js" \) -delete
	find . -type f -path "*/node_modules/*" -and -path "*/bin/*" -printf "removed %p\n" -delete
	find . -type f -path "*man/man*" -printf "removed %p\n" -delete
	rm -vr ./node_modules/sqlite3/node_modules/node-addon-api/tools/
	rm -v ./node_modules/duplexer2/example.js ./node_modules/ajv/scripts/info
}

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -a app $pkgdir/opt/$pkgname/
	printf "#!/bin/bash
set -eux -o pipefail
ELECTRON_ENABLE_LOGGING=1 exec electron32 /opt/$pkgname/app \"\$@\"
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/$pkgname
	install -Dm644 $pkgname.desktop -t "$pkgdir"/usr/share/applications/
	find $pkgdir -type f -name "*.py" -printf "removed %p\n" -delete
	find $pkgdir -type f -name "*.h" -printf "removed %p\n" -delete
	find $pkgdir -type f -name "*.c" -printf "removed %p\n" -delete
	find . -type f -name "icon_about_win.png" -exec install -Dm644 {} "$pkgdir"/usr/share/pixmaps/$pkgname.png \;
}
