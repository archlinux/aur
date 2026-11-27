# Maintainer: kinker31 <dp223171@gmail.com>
pkgname=mz800emu-git
pkgrel=1
pkgver=v2.0.2.preview.r150.ge2ce1b2
pkgdesc="MZ-Sharp Emulator Suite (git version)"
arch=('x86_64')
url="https://github.com/michalhucik/mz800emu"
license=('gpl-3.0')
depends=('sdl3' 'glib2' 'json-glib' 'curl' 'zlib' 'libglvnd')
makedepends=('cmake' 'ninja' 'pkgconf' 'git' 'doxygen' 'base-devel')
source=("git+https://github.com/michalhucik/mz800emu.git")
sha256sums=('SKIP')

pkgver() {
	cd mz800emu
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd mz800emu
	mkdir -p build && cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
	-Wno-dev -G Ninja
	cmake --build .
}

package() {
 	cd mz800emu/
	
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
