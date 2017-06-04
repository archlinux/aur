# Maintainer: Salvador Pardiñas <darkfm@vera.com.uy>
pkgname=higan-git
pkgver=r572.1ca46090
pkgrel=1
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
	'allow_root.patch')
noextract=()
md5sums=('SKIP'
         '6bc32fa73fafec579fcc608feed43523')

prepare() {
	cd $srcdir/higan
	patch -Np1 -i "${srcdir}/allow_root.patch"
}

pkgver() {
	cd "$srcdir/higan"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
