# Maintainer: ArcticLampyrid <ArcticLampyrid@outlook.com>
# Contributor: Alex Henrie <alexhenrie24@gmail.com>
# Contributor: RubenKelevra <cyrond@gmail.com>

_archive_extension="tar.gz"
pkgname=ipfs-desktop-electron
_pkgname=ipfs-desktop
pkgver=0.46.2
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=(x86_64)
url="https://github.com/ipfs/$_pkgname"
license=(MIT)
depends=(electron go-ipfs)
makedepends=("nodejs>=16" npm node-gyp)
provides=("$_pkgname")
source=(
	"$_pkgname-$pkgver.$_archive_extension::https://github.com/ipfs/ipfs-desktop/archive/refs/tags/v$pkgver.$_archive_extension"
	"ipfs-desktop.svg::https://raw.githubusercontent.com/ipfs/ipfs-webui/refs/tags/v4.4.2/src/navigation/ipfs-logo.svg"
	"ipfs-desktop.desktop"
)
b2sums=(
	'90e573ee4f2b34294edd91e49c075d7cb4bdceec5120321a9ba4f066507ac518164ee39ab58e19933b882d1421cfddc0d5c474fa62abcc8f1fea846326770dee'
	'd2bcf08f57f09298c5105867e5531f648c7f69bb7c081011477be507057d69bff147442029f86f5e6135f8ddca68f5176f792c99af8dace07d3063fcdbd2c0f5'
	'adf5806b22b9e7667155d67a58ba54d9f141b893013d04aed14a8814a7f7e3393ea836eb0632275dbe3893092c69844da8fdea53ff3b13064ae8c54b3f1cad97'
)

prepare() {
	cd "$_pkgname-$pkgver"
	npm ci --no-audit --progress=false --cache "$srcdir/npm-cache"
}

build() {
	cd "$_pkgname-$pkgver"
	npm run-script build
	npx electron-builder build --linux dir
}

package() {
	cd "$_pkgname-$pkgver"

	mkdir -p $pkgdir/usr/lib/ipfs-desktop
	mkdir -p $pkgdir/usr/bin

	cp -r dist/linux-unpacked/resources/* $pkgdir/usr/lib/ipfs-desktop/
	ln -sf /usr/bin/ipfs $pkgdir/usr/lib/ipfs-desktop/app.asar.unpacked/node_modules/kubo/kubo/ipfs

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	echo "#!/bin/sh
exec electron /usr/lib/ipfs-desktop/app.asar \"\$@\"" > ipfs-desktop
	install -Dm755 ipfs-desktop "$pkgdir/usr/bin/ipfs-desktop"
	install -Dm644 ${srcdir}/ipfs-desktop.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/ipfs-desktop.svg
	install -Dm644 ${srcdir}/ipfs-desktop.desktop -t ${pkgdir}/usr/share/applications
}
