# Maintainer: Salvador Pardiñas <darkfm@vera.com.uy>
pkgname=higan-git
pkgver=103
pkgrel=2
pkgdesc="Multisystem emulator by Byuu"
arch=('x86_64' 'i686')
url="https://byuu.org"
license=('GPL3')
groups=()
depends=('libpulse' 'gtksourceview2' 'sdl' 'libxv' 'libao' 'openal')
makedepends=('git')
provides=('higan')
conflicts=('higan')
replaces=()
backup=()
options=()
source=(
	'git+https://gitlab.com/higan/higan.git'
	'allow_root.patch'
	'getver.patch')
noextract=()
md5sums=('SKIP'
         '6bc32fa73fafec579fcc608feed43523'
         '0b32b7421da621785ee29070782cfb77')

prepare() {
	cd $srcdir/higan
	patch -Np1 -i "${srcdir}/allow_root.patch"
	patch -Np1 -i "${srcdir}/getver.patch"
	chmod +x getver.sh
}

pkgver() {
	cd "$srcdir/higan"
	./getver.sh
}

build() {
	cd "$srcdir/higan"
	make -C icarus compiler=g++
	make -C higan compiler=g++
}

package() {
	cd "$srcdir/higan"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	make -C icarus prefix="$pkgdir/usr" install
	make -C higan prefix="$pkgdir/usr" install
	chmod -R 777 "$pkgdir/usr/share/higan"
	chmod -R 777 "$pkgdir/usr/share/icarus"
}
