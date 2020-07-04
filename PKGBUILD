# Maintainer: Florian Märkl <heir-aur@florianmaerkl.de>
pkgname=heir-git
pkgver=r5.4697214
pkgrel=1
pkgdesc="Utility to launch new terminals in the same working directory as the currently focused one under Sway."
arch=("x86_64" "aarch64")
url="https://github.com/thestr4ng3r/heir"
license=('GPL3')
depends=("sway" "json-c")
source=(${pkgname}::'git+https://github.com/thestr4ng3r/heir.git'
		sway::'git+https://github.com/swaywm/sway.git')
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd ${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${pkgname}
	git submodule init
	git config submodule.sway.url $srcdir/sway
	git submodule update
}

build() {
	cd ${pkgname}
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	cd ${pkgname}
	make -C build DESTDIR="$pkgdir/" install
}
