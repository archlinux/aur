# Maintainer: Colin Wallace <wallacoloo@gmail.com>

pkgname=hase-git
pkgver=341.da32fd2
pkgrel=1
pkgdesc='Gravity artillery shooter game'
arch=('any')
url='http://ziz.gp2x.de/hase/'
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sparrow3d-git')
makedepends=('git')
provides=('hase')
source=("git+https://github.com/theZiz/hase.git" "sparrow-dyn.patch" "share-dir.patch")
md5sums=('SKIP' 'f71a4a3fb0569eaf3d66c818b1f8470c' 'bf589b325d503d7b32037b607db65ff1')

pkgver() {
	cd "$srcdir"/hase
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
	cd "$srcdir"/hase
	# Patch hase to link against sparrow dynamically
	patch -p1 -i "$srcdir"/sparrow-dyn.patch Makefile
	# Patch so data directory is /usr/share/hase, instead of virtualenv directory
	patch -p1 -i "$srcdir"/share-dir.patch install.sh
}

build() {
	cd "$srcdir"/hase
	make
}

package() {
	cd "$srcdir"/hase
	# Make directories that the install script expects to already exist
	mkdir -p "$pkgdir"/usr/{bin,share,share/applications,share/pixmaps}
	./install.sh "$pkgdir"/usr
}
