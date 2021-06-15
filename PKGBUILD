# Maintainer: John Troxler <firstname dot lastname at gmail dot com>
# Co-Maintainer: Martin Rys <https://rys.pw/#contact_me>

pkgname=loot
pkgver=0.16.1
_pkglibver=0.16.3
pkgrel=3
pkgdesc="A load order optimisation tool for the Elder Scrolls (Morrowind and later) and Fallout (3 and later) games."
arch=('x86_64')
url="https://loot.github.io"
license=('GPL3')
depends=('boost-libs' 'http-parser' 'libssh2' 'alsa-lib' 'nss' 'pango' 'atk' 'libxdamage' 'libxcomposite' 'libxcursor' 'libxrandr' 'libxss' 'libxtst')
makedepends=('git' 'cmake' 'rust' 'cbindgen' 'yarn' 'boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
        "lib$pkgname-$_pkglibver.tar.gz::https://github.com/$pkgname/lib$pkgname/archive/$_pkglibver.tar.gz"
        'LOOT.desktop'
)
sha256sums=('7e7356d7b8d6d75924805d8e2b8e2cac69797ab203a18f6a1d12090f01a8c7f3'
            '6c2ff8bab81aeec74efb83fd6ee9754dde63c09349937c9a9b397fe92cbe2829'
            '3dd063fdbe33dc82a4298bd5bcd3b4e7490adab4128389c153d12c6b074b27fb'
)

#prepare() {
#	yarn install
#}

build() {
	# hack as per Comments page
	find ./ -type f -exec sed -i 's#--config $(CONFIGURATION)##g' {} \;
	# libloot
	cd "$srcdir/lib$pkgname-$_pkglibver"
	yarn install
	mkdir -p build
	cd build
	cmake .. -DCMAKE_SKIP_RPATH=TRUE
	make loot

	mkdir -p pkg
	cp lib$pkgname.so ./pkg/
	cp -r ../include/ ./pkg/
	tar -zcf lib$pkgname-$_pkglibver.tar.gz ./pkg/

	# loot
	cd "$srcdir/$pkgname-$pkgver"
	yarn install
	# Cripple update check, always return no update available
	echo 'export default async function updateExists(currentVersion: string, currentBuild: string){if(currentVersion === undefined || currentBuild === undefined || true) {return false;}}' > src/gui/html/js/updateExists.ts
	mkdir -p build
	cd build
	cmake .. -DLIBLOOT_URL="$srcdir/lib$pkgname-$_pkglibver/build/lib$pkgname-$_pkglibver.tar.gz" \
		-DCMAKE_BUILD_WITH_INSTALL_RPATH=TRUE -DCMAKE_INSTALL_RPATH="/opt/$pkgname"
	make LOOT
}

package() {
	_builddir="$srcdir/$pkgname-$pkgver/build"

	install -Dm755 -t "$pkgdir/opt/$pkgname" \
		"$_builddir/LOOT" \
		"$_builddir/lib$pkgname.so" \
		"$_builddir/libcef.so"

	install -Dm644 -t "$pkgdir/opt/$pkgname" \
		"$_builddir/icudtl.dat" \
		"$_builddir/snapshot_blob.bin" \
		"$_builddir/v8_context_snapshot.bin" \
		"$_builddir/resources.pak" \
		"$_builddir/chrome_100_percent.pak" \
		"$_builddir/chrome_200_percent.pak"

	install -Dm644 -t "$pkgdir/opt/$pkgname/resources/l10n" \
		"$_builddir/external/src/cef/Resources/locales"/*.pak

	cp -r "$_builddir/resources/ui" "$pkgdir/opt/$pkgname/resources/"

	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/LOOT" "$pkgdir/usr/bin"

	# Install the icon
	install -Dm644 "${_builddir}/../resources/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/loot.svg"
	# Install desktop entry
	install -Dm644 ${srcdir}/../LOOT.desktop ${pkgdir}/usr/share/applications/LOOT.desktop
}
