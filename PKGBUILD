# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=eon-git
pkgver=r499.03b2da5
pkgrel=1
pkgdesc="A light, modern editor for your terminal that doesn't want to be vim"
arch=('x86_64' 'aarch64')
url="https://github.com/tomas/eon"
license=('Apache-2.0')
depends=('pcre' 'luajit' 'glibc')
makedepends=('git' 'cmake' 'gcc' 'make' 'patch')
provides=('eon')
conflicts=('eon')
options=('!lto')
source=("git+$url.git" 'mlbuf::git+https://github.com/adsr/mlbuf.git' 'termbox::git+https://github.com/tomas/termbox.git')
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd eon
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd eon
	git submodule init
	git config submodule.mlbuf.url "$srcdir/mlbuf"
	git config submodule.termbox.url "$srcdir/termbox"
	git -c protocol.file.allow=always submodule update
	mkdir -p luajit/src
	cp /usr/include/luajit-2.1/*.h* luajit/src/
	ln -sf /usr/lib/libluajit-5.1.so luajit/src/libluajit.so
	ar rcs luajit/src/libluajit.a
	sed -i '/add_cflag_if_supported("-Werror")/d' termbox/CMakeLists.txt
	mkdir -p termbox/build
	(
		cd termbox/build
		CMAKE_POLICY_VERSION_MINIMUM=3.5 cmake ..
	)
}

build() {
	cd eon
	make -o luajit/src/libluajit.a eon
}

package() {
	cd eon
	install -Dm755 eon "$pkgdir/usr/bin/eon"
	install -d "$pkgdir/usr/share/eon"
	cp -a plugins "$pkgdir/usr/share/eon/"
	install -Dm644 README.md "$pkgdir/usr/share/doc/eon/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
