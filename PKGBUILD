# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-accelerated
pkgver=2.8.3
pkgrel=5
epoch=
pkgdesc="Advanced ComputerCraft emulator written in C++, using the LuaJIT engine"
arch=('x86_64' 'i386' 'armv7l' 'armv7h' 'aarch64')
url="https://www.craftos-pc.cc/"
license=('MIT')
groups=()
depends=('craftos-pc-data>=2.5' 'sdl2>=2.0.8' 'sdl2_mixer' 'poco')
makedepends=('unzip' 'patchelf')
optdepends=('libharu: PDF output support' 'png++: PNG screenshot support' 'ncurses: CLI mode support')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("craftos2-${pkgver}.tar.gz::https://github.com/MCJack123/craftos2/archive/v${pkgver}-luajit.tar.gz"
        "craftos2-luajit-v2.8.tar.gz::https://github.com/MCJack123/craftos2-luajit/archive/v2.8.tar.gz"
        "0001-fix-poco.patch")
noextract=()
sha256sums=('44f53641745cdcaa6d250226c0344e9ff7e382be2cc05141cce9efa3b73c5cbf' 'c1348a7e872a722ce424761819c288b5dbe9edf0dcd3f85f12cdb6e49d3573f9'
            'SKIP')
validpgpkeys=()

prepare() {
    cp -R craftos2-luajit-2.8/* "craftos2-$pkgver-luajit/craftos2-luajit/"
    cd "craftos2-$pkgver-luajit"
    mkdir icons
    unzip resources/linux-icons.zip -d icons
    patch -Np1 -i ../0001-fix-poco.patch
}

build() {
	cd "craftos2-$pkgver-luajit"
	./configure --prefix=/usr
	make -C craftos2-luajit -j$(nproc)
	make -j$(nproc)
}

check() {
	cd "craftos2-$pkgver-luajit"
	make -k test
}

package() {
	cd "craftos2-$pkgver-luajit"
	patchelf --replace-needed craftos2-luajit/src/libluajit-craftos.so libluajit-craftos.so craftos
	install -D -m 0755 craftos2-luajit/src/libluajit-craftos.so "$pkgdir/usr/lib/libluajit-craftos.so"
	install -D -m 0755 craftos "$pkgdir/usr/bin/craftos-luajit"
	install -D -m 0644 icons/CraftOS-PC.desktop "$pkgdir/usr/share/applications/CraftOS-PC-Accelerated.desktop"
	install -D -m 0644 icons/16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/craftos-luajit.png"
	install -D -m 0644 icons/24.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/craftos-luajit.png"
	install -D -m 0644 icons/32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/craftos-luajit.png"
	install -D -m 0644 icons/48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/craftos-luajit.png"
	install -D -m 0644 icons/64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/craftos-luajit.png"
	install -D -m 0644 icons/96.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/craftos-luajit.png"
}
