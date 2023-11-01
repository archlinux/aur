# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=apotris
pkgname=$_pkgname-git
pkgver=3.4.6.r378.g7f9b3db
pkgrel=1
pkgdesc="A block stacking puzzle game for the Gameboy Advance (Linux port)"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://apotris.com/"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'libmodplug')
makedepends=('general-tools' 'git' 'sfml')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://gitea.com/akouzoukos/apotris.git#branch=ports"
	'soloud::git+https://github.com/akouzoukos/soloud.git'
	'Tilengine::git+https://github.com/akouzoukos/Tilengine.git'
	"$_pkgname.sh"
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'6e704bfe9e2083f22a344024607521f01522d776310dd8597ed575a87214157b14984298da07bc5fb0c819eb7c16731afe9a77e2dad501ca2511be4a689cd3ba'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.soloud.url ../soloud
	git config submodule.tilengine.url ../Tilengine
	git -c protocol.file.allow=always submodule update
	sed -i "s|assets|/usr/share/$_pkgname|" source/{audio_files,liba_window}.cpp
}

build() {
	cd $_pkgname
	PATH=/opt/devkitpro/tools/bin:$PATH
	make linux
}

package() {
	depends+=(
		'libsfml-audio.so'
		'libsfml-graphics.so'
		'libsfml-system.so'
		'libsfml-window.so'
	)

	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm755 ../$_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
	install -Dm755 -t "$pkgdir"/usr/lib/$_pkgname bin/linux/Apotris
	install -Dm644 -t "$pkgdir"/usr/share/$_pkgname bin/linux/assets/*
}
