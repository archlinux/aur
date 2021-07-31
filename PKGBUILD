# Maintainer:  Jonathon Fernyhough <jonathon at+m2x dev>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Romain Bouchaud-Leduc <r0m1.bl@camaris.org>

pkgname=trickle-git
pkgver=r23.09a1d95
pkgrel=2
pkgdesc="Lightweight userspace bandwidth shaper"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mariusae/trickle"
license=('BSD')
depends=('libevent' 'libtirpc')
makedepends=('git')
provides=("${pkgname/-git/}")
conflicts=("${pkgname/-git/}")
source=("git+$url.git"
        "remove-libtrickle.patch"
        "$url/pull/28/commits/4171f1716eb2e37d36fb9189800c53b83723569d.patch"
        "$url/pull/29/commits/29de2a4704d9843d3c6cba1d4a4ac177f2d6e568.patch")
sha256sums=('SKIP'
            '7e148c9526dbd6667c94ce3ee4f1a1fd550e61ab185735939c4d5312cf13b7a1'
            'dfffeb04a403e7eeb67e0fd5e611f2e428569b68139324fe7af8dee7e7b7cacb'
            '0b5ae4357c8b383b30235172a10b673eb2bfa5d640cfe86dd0b890d0d8c3dcc0')

pkgver() {
	cd ${pkgname/-git/}
	# https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd ${pkgname/-git/}

	# https://github.com/mariusae/trickle/issues/16
	patch -Np1 -i ../remove-libtrickle.patch

	# Fix rpc support, https://github.com/mariusae/trickle/pull/28
	patch -Np1 -i ../4171f1716eb2e37d36fb9189800c53b83723569d.patch

	# Use $libdir for preload object lookup, https://github.com/mariusae/trickle/pull/29
	patch -Np1 -i ../29de2a4704d9843d3c6cba1d4a4ac177f2d6e568.patch
}

build() {
	cd ${pkgname/-git/}

	autoreconf -if
	./configure --prefix=/usr \
		--mandir=/usr/share/man
	make -j1
}

package() {
	cd ${pkgname/-git/}

	make DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ LICENSE
}
