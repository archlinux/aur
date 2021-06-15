# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=winfile
pkgver=10.1.4.0
pkgrel=1
epoch=
pkgdesc="Original Windows File Manager (winfile) with enhancements"
arch=(x86_64)
url="https://github.com/microsoft/winfile"
license=('custom')
groups=()
depends=(mingw-w64-crt wine)
makedepends=(mingw-w64-gcc mingw-w64-headers)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("srcgit::git+https://github.com/microsoft/winfile.git"
"mingw_compile.patch"
"https://patch-diff.githubusercontent.com/raw/microsoft/winfile/pull/262.patch"
"winfile")
noextract=()
sha256sums=('SKIP'
            '920e92250a36d96e232d8ca1e556531c166e5cb9137e618396ff1790eb86eced'
            '6ff49930b6e473e66e506444643edd99bd0f46278d091df22aeb9f95f7f6eacc'
            'e323e64c3cc2cfc20af3d6aa1d5794ab09c2a21643d45ad7ca9c6fa111c5110e')
validpgpkeys=()

prepare() {
	cd "$srcdir/srcgit"
	git checkout v$pkgver
	# Fix some issues compiling on *nix (e.g. directory separator, toolchain location, header names, etc)
	git apply ../mingw_compile.patch
	# Pull request #262: WinFile: Fix multiple definition of variables error in MinGW
	git apply ../262.patch
}

build() {
	cd "$srcdir/srcgit"
	TOOLCHAIN=x86_64-w64-mingw32- make
}

package() {
	cd "$srcdir/srcgit"
	mkdir -p "$pkgdir"/usr/share/$pkgname
	mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
	mkdir -p "$pkgdir"/usr/bin
	install -Dm755 winfile.exe "$pkgdir"/usr/share/$pkgname
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
	install -Dm755 ../winfile "$pkgdir"/usr/bin
}
