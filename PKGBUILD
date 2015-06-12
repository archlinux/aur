# Contributor: Mael Kerbiriou <mael.kerbiriouATfreeDOTfr>

pkgname=wld-git
pkgver=r153.00ba7a7
pkgrel=1

pkgdesc='A primitive drawing library targeted at Wayland'
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/michaelforney/wld'

depends=('wayland' 'libdrm' 'fontconfig' 'pixman')
makedepends=('git')

provides=('wld')
conflicts=('wld')

source=('git://github.com/michaelforney/wld.git')

md5sums=('SKIP')

pkgver() {
	cd wld
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd wld
	
	if pkg-config --exists libdrm_intel; then
		DRM_DRIVERS+=' intel'
	fi
	
	if pkg-config --exists libdrm_nouveau; then
		DRM_DRIVERS+=' nouveau'
	fi
	
	export DRM_DRIVERS
	make -e
}

package() {
	cd wld
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
	make -e PREFIX=/usr DESTDIR="$pkgdir" install
}

