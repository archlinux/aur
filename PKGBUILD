# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Björn <theodorstormgrade@gmail.com>

pkgname=scratchbox2-git
pkgver=2.3.90+git29.r16.9ce0a32
pkgrel=1
pkgdesc="https://git.sailfishos.org/mer-core/scratchbox2"
arch=('x86_64' 'i686')
url="https://git.sailfishos.org/mer-core/scratchbox2"
license=('GPL')
depends=('perl' 'lib32-glibc' 'sh' 'lua52')
optdepends=('qemu-arch-extra: arm and aarch64 support')
makedepends=(
  'git'
  'lib32-gcc-libs'
  'lua52'
)
source=("$pkgname::git+https://git.sailfishos.org/mer-core/scratchbox2.git"
	"lua_52.patch::https://git.sailfishos.org/mer-core/scratchbox2/merge_requests/42.patch")
sha512sums=('SKIP'
            '7a8df6118bd6613693ff8a82139dcfe421c449ea0168918c18b6824c74accdc18e9955f18190dbec7f4c1964910fc9a1b0590e9a128655fb36647d0f07975ce8')

pkgver() {
	cd "scratchbox2-git"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "scratchbox2-git"

	# use system lua 5.2
	patch -p1 -i "${srcdir}/lua_52.patch" || true

	cd scratchbox2

	# disable i686 multilib target
	sed -i "119d;121d;258d" Makefile

	cp /usr/share/libtool/build-aux/config.guess .
	cp /usr/share/libtool/build-aux/config.sub .
}

build() {
	cd "scratchbox2-git/scratchbox2"
        ./autogen.sh
	LUA_CFLAGS=`pkg-config --cflags lua5.2` LUA_LIBS=`pkg-config --libs lua5.2` \
		./configure --prefix=/usr
        make
}

package() {
	cd "scratchbox2-git/scratchbox2"
        make prefix="$pkgdir/usr" install

        #ln -s obs-rpm-build $pkgdir/usr/share/$pkgname/modes/sdk-build
        #ln -s obs-rpm-build+pp $pkgdir/usr/share/$pkgname/modes/sdk-build+pp
        #ln -s obs-rpm-install $pkgdir/usr/share/$pkgname/modes/sdk-install
        #ln -s /usr/bin/qemu-arm $pkgdir/usr/bin/qemu-arm-dynamic
        #ln -s /usr/bin/qemu-aarch64 $pkgdir/usr/bin/qemu-aarch64-dynamic
}
