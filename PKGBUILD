# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-accelerated
pkgver=2.2.1
pkgrel=3
epoch=
pkgdesc="Advanced ComputerCraft emulator written in C++"
arch=('x86_64' 'i386' 'armv7l' 'aarch64')
url="https://github.com/MCJack123/craftos2"
license=('MIT')
groups=()
depends=('craftos-pc-data>=2.2.2' 'sdl2>=2.0.8' 'sdl2_mixer' 'poco')
makedepends=()
optdepends=('libharu: PDF output support' 'png++: PNG screenshot support' 'ncurses: CLI mode support')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("craftos2.tar.gz::https://github.com/MCJack123/craftos2/archive/v${pkgver}-luajit.tar.gz"
        "craftos2-luajit.tar.gz::https://github.com/MCJack123/craftos2-luajit/archive/v2.0.5-cc2.2.1.tar.gz"
        "updater-fix.json::https://api.github.com/repos/MCJack123/craftos2/commits/da749f574f626b733b7053e8c47947c7ab1c8bb8")
noextract=()
sha256sums=('276227c213b181b5642148bafc931fb1b5b486f0ca7866b6163a06749746c51f'
            '2680159260552e27cb8bf3c3fe2621a67026229eeeed116eba8523d39f0c482a'
            '6906ad34202ee2e30c4a30d3fa8487aed39054c82577c1b981e6be04a355e45e')
validpgpkeys=()

prepare() {
    cp -R craftos2-luajit-2.0.5-cc2.2.1/* "craftos2-$pkgver-luajit/craftos2-luajit/"
    # Late-breaking patch, DELETE AFTER v2.2.1!
    python3 -c "import json, sys, io; file = io.open('updater-fix.json'); print(json.load(file)['files'][0]['patch']); file.close()" > updater-fix.patch
    patch -p1 craftos2-$pkgver-luajit/src/main.cpp updater-fix.patch
    # -=-
    cd "craftos2-$pkgver-luajit"
    mkdir icons
    unzip linux-icons.zip -d icons
}

build() {
	cd "craftos2-$pkgver-luajit"
	./configure --prefix=/usr
	make
}

check() {
	cd "craftos2-$pkgver-luajit"
	make -k test
}

package() {
	cd "craftos2-$pkgver-luajit"
	install -D -m 0755 craftos "$pkgdir/usr/bin/craftos-luajit"
	install -D -m 0644 icons/CraftOS-PC-Accelerated.desktop "$pkgdir/usr/share/applications/CraftOS-PC-Accelerated.desktop"
	install -D -m 0644 icons/16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/craftos-luajit.png"
	install -D -m 0644 icons/24.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/craftos-luajit.png"
	install -D -m 0644 icons/32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/craftos-luajit.png"
	install -D -m 0644 icons/48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/craftos-luajit.png"
	install -D -m 0644 icons/64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/craftos-luajit.png"
	install -D -m 0644 icons/96.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/craftos-luajit.png"
}
