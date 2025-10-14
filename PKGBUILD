# Maintainer: Juliette Cordor <me@cordor.dev>
pkgname=savestate
pkgver=1.4.5
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
	"SaveState-OneFile-Linux.spec::https://github.com/Matteo842/SaveState/raw/refs/heads/main/SaveState-OneFile-Linux.spec"
	"requirements.patch"
)
noextract=()
sha256sums=(
	'ad3a02d5d37000b108154094f6d17e2b301e4b13296f3e57a28acd477775c5ac'
	'7f7b294aa10ef51f23dbccd814e2ce507269be889e444f2bf2b1fb5c50dcb15e'
	'ac19894ca894e119940a48ec62f51f25c8c8623e433f60d52fee8863a0c4fd61'
	'367ce17d16d84c18fd87028789d7520837d3c9e5f0d5c57a0ac8fa28ba0b3b84'
)
validpgpkeys=()
_name="SaveState"
_categories=('Game;Utility')
_exec="/usr/bin/SaveState"

prepare() {
	cd "$srcdir"

	# Generate .desktop file
	echo "Generating .desktop file..."
	gendesk --pkgname="$pkgname" --pkgdesc="$pkgdesc" \
		--categories=$_categories \
		--name=$_name \
		--genericname=$_name \
		--exec=$_exec \
		--icon=$_name \
		-f

	cd "$_name-$pkgver"

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
