# Maintainer: Juliette Cordor <me@cordor.dev>
pkgname=savestate
pkgver=1.4.3
pkgrel=1
epoch=
pkgdesc="A versatile game save backup manager, featuring Steam detection, Minecraft support, drag & drop, desktop shortcuts and emulator compatible."
arch=('x86_64')
url="https://github.com/Matteo842/SaveState"
license=('GPL-3.0-only')
groups=()
depends=('glibc' 'zlib')
makedepends=('gendesk' 'python>=3.3' 'tk' 'pyside6' 'python-requests' 'python-psutil')
checkdepends=()
optdepends=()
provides=(savestate)
conflicts=(savestate)
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/Matteo842/SaveState/archive/refs/tags/$pkgver.tar.gz"
	"SaveState.png::https://github.com/Matteo842/SaveState/blob/$pkgver/icon.png?raw=true"
	"requirements.patch"
	"SaveState-OneFile-Linux.spec"
)
noextract=()
sha256sums=(
	'56d9a313cd3317ead0c1c77570d3faac8ac6604c890c78f56c8cb86b1f871d82'
	'7f7b294aa10ef51f23dbccd814e2ce507269be889e444f2bf2b1fb5c50dcb15e'
	'26e82b5c1397e3b9392b78b4c155da0dc2e289b5c7fa923593960fb0b5f3b3a5'
	'ac19894ca894e119940a48ec62f51f25c8c8623e433f60d52fee8863a0c4fd61'
)
validpgpkeys=()
_name="SaveState"
_categories=('Game;Utility')
_exec="/usr/bin/SaveState"

prepare() {
	cd "$srcdir/$_name-$pkgver"

	gendesk --pkgname="$pkgname" --pkgdesc="$pkgdesc" \
		--categories=$_categories \
		--name=$_name \
		--genericname=$_name \
		--exec=$_exec \
		--icon=$_name \
		-f

	patch -p1 -i ../requirements.patch

	python -m venv ./venv

	source ./venv/bin/activate

	pip install -r requirements.txt
}

build() {
	cd "$srcdir/$_name-$pkgver"

	source ./venv/bin/activate

	# TODO: Remove on next release
	cp ../SaveState-OneFile-Linux.spec .

	pyinstaller --clean SaveState-OneFile-Linux.spec
}

package() {
	cd "$srcdir"

	install -Dm0755 -t "$pkgdir/usr/share/applications/" "savestate.desktop"
	install -Dm0755 -t "$pkgdir/usr/share/icons/" "$_name.png"

	install -Dm0755 -t "$pkgdir/usr/bin" "$_name-$pkgver/dist/SaveState"
}
