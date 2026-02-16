# Maintainer: marius o <retro-prpl-aur@federated.id>
pkgname=retro-prpl-git
pkgver=2026.02.16.2407927d3
pkgrel=1
pkgdesc="All the proprietary protocol plugins that were ever included in Gaim/Pidgin."
arch=('x86' 'x86_64')
url="https://github.com/pidgin/retro-prpl"
license=('GPL')
#depends=('libpurple>=2.15')
optdepends=('meanwhile')
makedepends=('git' 'meson' 'ninja' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/pidgin/retro-prpl")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	python ./version.py get-version | sed -e 's/-/./g' -e 's/^v//'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	rm -rf build/
	# silc and silc10 get compilation errors due to default makepkg cflags
	meson setup -Dbuildtype=release --prefix=/usr build/ \
	    -Dsilc10=disabled -Dsilc=disabled -Dnovell=disabled \
	    -Dzephyr=disabled -Dgadu-gadu=disabled
	ninja -C build/
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "${pkgdir}"
	DESTDIR="${pkgdir}" ninja -C build/ install
}
