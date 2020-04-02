# Maintainer: Bastian Pukallus <bplinux at posteo de>
pkgname='fspy'
pkgver='1.0.3'
pkgrel=3
pkgdesc="cross platform app for still image camera matching"
arch=('x86_64')
url="https://github.com/stuffmatic/fSpy"
license=('GPL')
depends=(gconf fuse2 xdialog)
makedepends=(yarn)
provides=()
options=()
install=
changelog=
source=("https://github.com/stuffmatic/fSpy/archive/v$pkgver.tar.gz"
	"fspy")
noextract=()
sha256sums=("64d6fe96b1b480c514aba1657f3486cfe5a21bff0fc1c23427857715e5e9ea91"
	"24875587507ce4c1e8c354a3b74a48b9814aef7551125343512a54b196139553")

prepare() {
	_fspydir="$(ls -d $srcdir/*/)"
	cd "$_fspydir"
	yarn
	sed -i s/"electron-builder -mwl"/"electron-builder"/ package.json
}

build() {
	cd "$_fspydir"
	yarn dist
}

check() {
	echo "check" > /dev/null
}

package() {
	_appdir="$(ls -d $srcdir/*/)dist/linux-unpacked"
	_libdir="$pkgdir/usr/lib/$pkgname"
	_bindir="$pkgdir/usr/bin/"
	
	mkdir -p "$_bindir"
	mkdir -p "$_libdir"
	cd "$_appdir"	
	for i  in *; do
        	cp -r "$i" "$_libdir"
    	done
	cd "$srcdir/.."
	install -Dm755 "./$pkgname" "$_bindir"
}
