# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
# Contributor: anon@sansorgan.es
# Contributor: heavysink <winstonwu91 at gmail>

pkgname=proton
_pkgver=6.3-7
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compatibility tool for Steam Play based on Wine and additional components"
arch=('x86_64')
url="https://github.com/ValveSoftware/Proton/"
license=('BSD')
groups=()
depends=(
	'wine-valve'
)
makedepends=(
	'vulkan-headers'
)
source=(
	"https://github.com/ValveSoftware/Proton/archive/$pkgname-$_pkgver.tar.gz"
	"wined3d-interop.h"
)
sha512sums=(
	'fa7b411d3729530184d36c8756401a4bf063e6d9df919425936c7427a8964bc562f1bdbefcf1dc1a3e8fcf77760b893d69ed5cb5c7d4bba4916108de868c98f4'
	'f2caacca6bd55030331de7d017d85772b09e5ad9e5fdbfc6343f303ac5447595660fd3f83ba2a177ef321d9b54335245bac548ca804e6e3e9346690f29d55ad0'
)

prepare() {
	cd "Proton-$pkgname-$_pkgver"
	cp $srcdir/wined3d-interop.h vrclient_x64/vrclient_x64/
}

build() {
	cd "Proton-$pkgname-$_pkgver"

	export CXXFLAGS="$CXXFLAGS -Wno-attributes"
	export WINEMAKEFLAGS="--nosource-fix --nolower-include --nodlls --nomsvcrt --dll -ldl"
	export WINEMAKEFLAGS32="$WINEMAKEFLAGS --wine32"
	export LDFLAGS="$LDFLAGS -L/usr/lib32/wine -lntdll.dll"

	# The build script provided has so much cruft that it's easier to make everything manually
	mkdir -p build/lsteamclient.win32
	cp -a lsteamclient/* build/lsteamclient.win32
	cd build/lsteamclient.win32
	winemaker $WINEMAKEFLAGS32 -DSTEAM_API_EXPORTS .
	make
	cd ../..

	mkdir -p build/lsteamclient.win64
	cp -a lsteamclient/* build/lsteamclient.win64
	cd build/lsteamclient.win64
	winemaker $WINEMAKEFLAGS -DSTEAM_API_EXPORTS .
	make
	cd ../..

	# Currently depends on the custom bundled wine
	mkdir -p build/vrclient.win32
	cp -a vrclient_x64/* build/vrclient.win32
	rm -rf build/vrclient.win32/vrclient
	mv build/vrclient.win32/vrclient_x64 build/vrclient.win32/vrclient
	cd build/vrclient.win32/vrclient
	mv -u vrclient_x64.spec vrclient.spec
	winemaker -I.. $WINEMAKEFLAGS32 .
	CXXFLAGS="$CXXFLAGS --std=c++0x" make
	winebuild --dll --fake-module -E vrclient.spec -o vrclient.dll.fake
	cd ../../..

	mkdir -p build/vrclient.win64
	cp -a vrclient_x64/* build/vrclient.win64
	cd build/vrclient.win64/vrclient_x64
	winemaker -I.. $WINEMAKEFLAGS .
	CXXFLAGS="$CXXFLAGS --std=c++0x" make
	winebuild --dll --fake-module -E vrclient_x64.spec -o vrclient_x64.dll.fake
}

package() {
	cd "Proton-$pkgname-$_pkgver"

	install -d -m755 $pkgdir/usr/share/licenses/$pkgname
	install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -m644 LICENSE.proton $pkgdir/usr/share/licenses/$pkgname/LICENSE.proton
	install -m644 dist.LICENSE $pkgdir/usr/share/licenses/$pkgname/dist.LICENSE

	install -d -m755 $pkgdir/usr/share/doc/$pkgname
	install -m644 README.md $pkgdir/usr/share/doc/$pkgname/README.md

	install -d -m755 $pkgdir/usr/lib32/wine
	install -m755 build/lsteamclient.win32/lsteamclient.dll.so $pkgdir/usr/lib32/wine/
	install -m755 build/vrclient.win32/vrclient/vrclient.dll.so $pkgdir/usr/lib32/wine/

	install -d $pkgdir/usr/lib32/wine/fakedlls
	install -m644 build/vrclient.win32/vrclient/vrclient.dll.fake $pkgdir/usr/lib32/wine/fakedlls/vrclient.dll

	install -d -m755 $pkgdir/usr/lib/wine
	install -m755 build/lsteamclient.win64/lsteamclient.dll.so $pkgdir/usr/lib/wine/
	install -m755 build/vrclient.win64/vrclient_x64/vrclient_x64.dll.so $pkgdir/usr/lib/wine/

	install -d $pkgdir/usr/lib/wine/fakedlls
	install -m644 build/vrclient.win64/vrclient_x64/vrclient_x64.dll.fake $pkgdir/usr/lib/wine/fakedlls/vrclient_x64.dll
}

