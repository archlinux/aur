# Maintainer: telans <telans@protonmail.com>

pkgname=fuzion-git
_pkgname=Fuzion
pkgver=v1.0.r1564.g648b4789
pkgrel=2
pkgdesc="Fuzion is a free-as-in-freedom CSGO cheat"
arch=("x86_64")
url="https://github.com/LWSS/Fuzion"
license=("GPL3")
depends=("gdb")
makedepends=('git'
			'gcc'
			'sdl2'
			'patchelf')
optdepends=("cartographer-git: Load Fuzion hidden from /proc maps")
source=('git://github.com/LWSS/Fuzion.git'
		'git://github.com/LWSS/imgui.git'
		'fuzion-load'
		'fuzion-unload'
		'build')
sha256sums=('SKIP'
			'SKIP'
			'41b2e9aa83ec988b556c9b2fa40be9d6d48d11e3fe5179ed6606615bddefbdc2'
			'95bc6992fb561e41f69bdb5923dd35eb8151eac39b074148478cf2353c6e13b3'
			'f6caf87a562b1aecd86bd80d17a0a3912f0095207f5416f873928cc7539e8e87')

pkgver() {
  cd "$_pkgname"
  git describe --always --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	git submodule init
	git config submodule.ImGUI.url "${_pkgname}/src/ImgGUI"
	git submodule update
	cd ..
	./build
}

package() {
	install -Dm755 fuzion-load "$pkgdir/usr/bin/fuzion-load"
	install -Dm755 fuzion-unload "$pkgdir/usr/bin/fuzion-unload"
	cd "$_pkgname"
	install -Dm755 "build_id" "$pkgdir/usr/share/Fuzion/build_id"
	_buildname="$(cat build_id)"
	install -Dm755 "$_buildname" "$pkgdir/usr/lib/$_buildname"
}
