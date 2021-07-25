# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=funemustation-git
_name=funemustation
_export=FunEmuStation_Launcher
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple but elegant launcher of emulators and pc games"
url="https://dannygaray60.itch.io/funemustation-launcher"
depends=('libxcursor' 'libxinerama' 'freetype2' 'alsa-lib' 'libxrandr' 'libxi' 'libglvnd')
makedepends=('godot' 'git')
optdepends=()
license=('GPL3')
arch=('any')
source=("git+https://github.com/dannygaray60/${_name}.git")
sha256sums=('SKIP')
provides=('funemustation')

pkgver() {
	cd ${srcdir}/${_name}

	cat 'export_presets.cfg' | grep "application/product_version" | cut -c 29- | tr '"' ' ' | awk '{ print $1 }'
}

build() {
	cd ${srcdir}/${_name}
	
	mkdir -p "bin"
	echo "#!/bin/sh" > "bin/${_name}"
	echo "mkdir -p ~/.local/share/${_name}/fes_data" >> "bin/${_name}"
	echo "cp /usr/share/${_name}/${_export}.x86_64 ~/.local/share/${_name}/${_export}.x86_64" >> "bin/${_name}"
	echo "if [ ! -h test ]; then ln -s /usr/share/${_name}/${_export}.pck ~/.local/share/${_name}/${_export}.pck; fi" >> "bin/${_name}"
	echo "cd ~/.local/share/${_name}" >> "bin/${_name}"
	echo "./${_export}.x86_64" >> "bin/${_name}"

	godot --no-window --path "." --export "Linux/X11" "bin/${_export}.x86_64"
}

package() {
	cd ${srcdir}/${_name}
	
	install -Dm755 "bin/${_export}.x86_64" "$pkgdir/usr/share/$_name/${_export}.x86_64"
	install -Dm644 "bin/${_export}.pck" "$pkgdir/usr/share/$_name/${_export}.pck"
	install -Dm755 "bin/${_name}" "$pkgdir/usr/bin/${_name}"
}

