# Maintainer: Kirill Tikhomirov <kirill2980440@gmail.com>
pkgname=mutsu-git
pkgver=649.b5e6905
pkgrel=1
pkgdesc="Emulator for Fujitsu FM-7 series computers"
arch=('x86_64')
url="https://github.com/captainys/77AVEMU/"
license=('BSD-3-Clause')
makedepends=('git' 'cmake')
provides=('mutsu-git')
source=('git+https://github.com/captainys/77AVEMU.git' 'git+https://github.com/captainys/TOWNSEMU.git' 'git+https://github.com/captainys/public.git')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
        cd "77AVEMU"
        echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
        cd "$srcdir/77AVEMU"
        mkdir -p build
	cd build
	cmake ../src -DCMAKE_POLICY_VERSION_MINIMUM=3.5
	cmake --build . --config Release
	# Building GUI
	cp -r "$srcdir/public" "$srcdir/77AVEMU/gui/src/"
	cd "$srcdir/77AVEMU/gui"
	mkdir -p build
	cd build
	export CFLAGS="${CFLAGS} -Wno-incompatible-pointer-types"
	cmake ../src -DCMAKE_POLICY_VERSION_MINIMUM=3.5
	cmake --build . --config Release
}

package() {
        install -Dm644 "$srcdir/77AVEMU/build/main_cui/Mutsu_CUI" "${pkgdir}/usr/bin/mutsu_cui"
	chmod +x "$pkgdir/usr/bin/mutsu_cui"
	install -Dm644 "$srcdir/77AVEMU/gui/build/main_gui/Mutsu_GUI" "$pkgdir/usr/bin/mutsu_gui"
	chmod +x "$pkgdir/usr/bin/mutsu_gui"
        install -Dm644 "$srcdir/77AVEMU/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
