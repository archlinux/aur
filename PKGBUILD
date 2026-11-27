# Maintainer: kinker31 <dp223171@gmail.com>
pkgname=mz800emu
pkgver=2.0.7
pkgrel=1
pkgdesc="Sharp MZ-800+ emulator suite"
arch=('x86_64')
url="https://github.com/michalhucik/mz800emu"
license=('GPL3')
depends=('sdl3' 'minizip-ng' 'curl')
makedepends=('cmake' 'gcc' 'ninja')
conflicts=('mz800emu-git')
source=("https://github.com/michalhucik/mz800emu/archive/refs/tags/v${pkgver}.tar.gz"
	'pifix.patch')
sha256sums=('1d5f7c51147dc26482b7cef0c60d1d778d044abcab37eeec8f42a24fac80ef51'
	'SKIP')

wow="${pkgname}-${pkgver}"

# M_PI is not defined for some reason in PKGBUILD default land
prepare() {
	cd "${srcdir}/${wow}/tests/videorec/"
	patch -Np0 -i "${srcdir}/pifix.patch"
}

build() {
	cd "${srcdir}/${wow}"
	mkdir -p build && cd build
	cmake .. -G Ninja -DSDL_TEST=ON \
	-DSDL_SHARED=ON \
	-DSDL_STATIC=OFF \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-Wno-dev
	cmake --build .
}

package() {
	cd "${srcdir}/${wow}"
	install -dm755 "$pkgdir/usr/lib/mz800emu" "$pkgdir/usr/bin"
	cp -r ui_resources "$pkgdir/usr/lib/mz800emu/"

	local emulators=(
		"mz700emu-pal"
		"mz700emu-ntsc"
		"mz800emu"
		"mz1500emu"
	 )

	for emu in "${emulators[@]}"; do
    	local bin_path
		bin_path="$(find build -maxdepth 3 -type f -name "$emu" | head -n 1)"
	
		if [[ -n "$bin_path" ]]; then
			install -Dm755 "$bin_path" "$pkgdir/usr/lib/mz800emu/$emu"
			ln -s "/usr/lib/mz800emu/$emu" "$pkgdir/usr/bin/$emu"
		fi
 	done
	
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/mz800emu/LICENSE"
}
