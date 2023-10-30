# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=apotris
pkgname=$_pkgname-git
pkgver=3.4.6.r372.g537d68c
pkgrel=2
pkgdesc="A block stacking puzzle game for the Gameboy Advance (Linux port)"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://apotris.com/"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'libmodplug')
makedepends=('git' 'sfml')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://gitea.com/akouzoukos/apotris.git#branch=ports"
	'soloud::git+https://github.com/akouzoukos/soloud.git'
	'Tilengine::git+https://github.com/akouzoukos/Tilengine.git'
	'fix-flags.patch'
	"$_pkgname.sh"
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'a7406927a1ace3e96dd7f618b57a49dc70e7290c86ccb27f2f74698813aaa51614069ad8a8ab78bf5e6f6af88625209acdcc5bbabc784052311c1afabd3f11c8'
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
	patch -Np1 < ../fix-flags.patch
	sed -i "s/assets/\/usr\/share\/$_pkgname/" source/{audio_files,liba_window}.cpp
}

build() {
	cd $_pkgname
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
