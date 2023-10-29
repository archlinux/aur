# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=apotris
pkgname=$_pkgname-git
pkgver=3.4.6.r372.g537d68c
pkgrel=1
pkgdesc="A block stacking puzzle game for the Gameboy Advance"
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
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'a7406927a1ace3e96dd7f618b57a49dc70e7290c86ccb27f2f74698813aaa51614069ad8a8ab78bf5e6f6af88625209acdcc5bbabc784052311c1afabd3f11c8'
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
	install -D bin/linux/Apotris "$pkgdir"/usr/bin/$_pkgname
	install -Dm644 -t "$pkgdir"/usr/share/$_pkgname bin/linux/assets/*
}
