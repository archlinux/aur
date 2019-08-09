# Maintainer: telans <telans@protonmail.com>

pkgname=fuzion-git
_pkgname=Fuzion
pkgver=master
pkgrel=1
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
			'6cbff5e6ef37e08a44e440f08bf6910eb508b6795c9cac102d18f7cd92a16174'
			'87c41293afe0c1cfaad67b24144dc48b737011b92a9da4029768257711250cc8'
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
	if [ -f build_id_old ]; then
		install -Dm755 "build_id_old" "$pkgdir/usr/share/Fuzion/build_id_old"
	else
		touch "$pkgdir/usr/share/Fuzion/build_id_old"
	fi
	_buildname="$(cat build_id)"
	install -Dm755 "$_buildname" "$pkgdir/usr/lib/$_buildname"
}
