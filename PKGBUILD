# Maintainer: Jonathon Fernyhough <jonathon at_m2x+dev>
# Contributor: Gaming4JC
# Previous Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=gtkhtml4-git
pkgver=4.10.0.r10.g4b6f74dc
pkgrel=1
pkgdesc="A lightweight HTML renderer/editor widget for GTK3"
arch=(i686 x86_64)
license=('GPL')
provides=("${pkgname/-git/}")
conflicts=("${pkgname/-git/}")
depends=('cairo>=1.10.0'
         'enchant>=2.0'
         'gnome-common>=3.2.0'
         'gnome-icon-theme>=2.22'
         'gtk3>=3.2.0'
         'iso-codes>=0.49')
makedepends=('intltool')
url='https://gitlab.gnome.org/Archive/gtkhtml'
source=("${pkgname/-git/}::git+${url}.git"
        'enchant-2.patch')
sha256sums=('SKIP'
            '2b78f071f7893e19618959443f3775bd435941a37ea9198b2fe72b596c205891')

pkgver() {
	cd "${pkgname/-git/}"
	# https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
	git describe --long 2>/dev/null | sed 's/GTKHTML_//; s/\([^-]*-g\)/r\1/; s/[-_]/./g'
}

prepare() {
	cd "${pkgname/-git/}"
	patch -Np0 < ../enchant-2.patch
}

build() {
	cd "${pkgname/-git/}"
	./autogen.sh --prefix=/usr --sysconfdir=/etc \
		--libexecdir=/usr/lib/gtkhtml4 \
		--localstatedir=/var --disable-static
	make
}

package() {
	cd "${pkgname/-git/}"
	make DESTDIR="$pkgdir" install
}

