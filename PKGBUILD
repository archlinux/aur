# Maintainer:  Jonathon Fernyhough <jonathon at_manjaro_dot org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Romain Bouchaud-Leduc <r0m1.bl@camaris.org>

pkgname=trickle-git
pkgver=latest
pkgrel=2
pkgdesc="Lightweight userspace bandwidth shaper"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mariusae/trickle"
license=('BSD')
depends=('libevent' 'libtirpc')
provides=("${pkgname/-git/}")
conflicts=("${pkgname/-git/}")
source=("git+https://github.com/mariusae/trickle.git"
        'remove-libtrickle.patch')
sha256sums=('SKIP'
            '7e148c9526dbd6667c94ce3ee4f1a1fd550e61ab185735939c4d5312cf13b7a1')

pkgver() {
	cd "${srcdir}/${pkgname/-git/}"
	# https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "${srcdir}/${pkgname/-git/}"

	# https://github.com/mariusae/trickle/issues/16
	patch -Np1 -i "${srcdir}/remove-libtrickle.patch"
}

build() {
	cd "${srcdir}/${pkgname/-git/}"

	CPPFLAGS+=" -I/usr/include/tirpc/"
	LDFLAGS+=" -ltirpc"

	autoreconf -if
	./configure --prefix=/usr \
		--mandir=/usr/share/man
	sed -i "s|.*in_addr_t.*||g" config.h
	make -j1
}

package() {
	cd "${srcdir}/${pkgname/-git/}"

	make DESTDIR="${pkgdir}" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
