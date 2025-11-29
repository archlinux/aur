# Maintainer:  Jonathon Fernyhough <jonathon at+m2x dev>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Romain Bouchaud-Leduc <r0m1.bl@camaris.org>

pkgname=trickle-git
pkgver=r23.09a1d95
pkgrel=5
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
        "fix-trickle-overload.patch"
        "$url/pull/28/commits/4171f1716eb2e37d36fb9189800c53b83723569d.patch"
        "$url/pull/29/commits/29de2a4704d9843d3c6cba1d4a4ac177f2d6e568.patch"
        "trickle-gcc14.patch"
        "atomicio.patch")
sha256sums=('SKIP'
            '7e148c9526dbd6667c94ce3ee4f1a1fd550e61ab185735939c4d5312cf13b7a1'
            'd3f91fa4b05777c936cb95fbfee04b5955e366755e682368e626d004f07d9c75'
            'dfffeb04a403e7eeb67e0fd5e611f2e428569b68139324fe7af8dee7e7b7cacb'
            '0b5ae4357c8b383b30235172a10b673eb2bfa5d640cfe86dd0b890d0d8c3dcc0'
            '07614e2a07ab61e95572da44b22b7a05b14d958ec62f4c400f7527104ff3492f'
            'dfc2ffbf0bdd4e26f06f22b6d3271f9e41a766deb32f73595c38792944766894')

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

	# https://aur.archlinux.org/packages/trickle-git#comment-885736
	# https://github.com/mariusae/trickle/pull/29
	patch -Np1 -i ../fix-trickle-overload.patch

	# Fix rpc support, https://github.com/mariusae/trickle/pull/28
	patch -Np1 -i ../4171f1716eb2e37d36fb9189800c53b83723569d.patch

	# Use $libdir for preload object lookup, https://github.com/mariusae/trickle/pull/29
	patch -Np1 -i ../29de2a4704d9843d3c6cba1d4a4ac177f2d6e568.patch

	# https://github.com/mariusae/trickle/issues/34
	# https://bbs.archlinux.org/viewtopic.php?id=295783
	patch -Np1 -i ../trickle-gcc14.patch

  patch -p1 -i ../atomicio.patch
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
