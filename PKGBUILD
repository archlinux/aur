# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-ccemux
pkgver=2.8.3
pkgrel=2
epoch=
pkgdesc="CCEmuX plugin wrapper for CraftOS-PC, providing the ccemux API for compatibility with CCEmuX-enhanced programs."
arch=('x86_64' 'i386' 'armv7l' 'aarch64')
url="https://github.com/MCJack123/craftos2"
license=('MIT')
groups=()
depends=('craftos-pc>=2.8' 'sdl2>=2.0.8')
makedepends=('patchelf')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("craftos2.tar.gz::https://github.com/MCJack123/craftos2/archive/v${pkgver}.tar.gz"
        "craftos2-lua.tar.gz::https://github.com/MCJack123/craftos2-lua/archive/v2.8.3.tar.gz")
noextract=()
sha256sums=('01982222596e84eaff52d60e3d4d45dd151986df04c3b6d96d296917108239d9'
            '36ecf0b41b0b84c5bbb6fc87ac5b1f40a2c0c4b077a68d1f9c034646c5751922')
validpgpkeys=()

prepare() {
    cp -R "craftos2-lua-$pkgver"/* "craftos2-$pkgver/craftos2-lua/"
	cd "craftos2-$pkgver"
	make -C craftos2-lua linux MYCFLAGS=-Wno-error=incompatible-pointer-types
}

build() {
	cd "craftos2-$pkgver"
	./configure --prefix=/usr
	make linux-plugin
}

check() {
    true
}

package() {
	cd "craftos2-$pkgver"
	install -D -m 0755 ccemux.so "$pkgdir/usr/share/craftos/plugins/ccemux.so"
	patchelf --replace-needed craftos2-lua/src/liblua.so libcraftos2-lua.so "$pkgdir/usr/share/craftos/plugins/ccemux.so"
}
