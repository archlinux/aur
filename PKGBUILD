# shellcheck shell=bash
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>

pkgname=blt4l-git
pkgver=r159.7867157
pkgrel=1
pkgdesc="Mod loader for Payday 2 (non-Steam runtime only)"
arch=('i686' 'x86_64')
url="https://github.com/blt4linux/blt4l"
license=('GPL3')
groups=()
depends=('curl' 'openssl' 'zlib')
makedepends=('git' 'cmake')
provides=()
conflicts=("blt4l")
replaces=()
backup=()
options=()
install=blt4l.install
source=("blt4l::git+https://github.com/blt4linux/blt4l")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}" || exit
  # Git, tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/blt4l" || exit
	git submodule init
	git submodule update
}

build() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build" || exit
	cmake "$srcdir/blt4l"
	make
}

package() {
	install -D -m644 "${srcdir}/build/libblt_loader.so" "${pkgdir}/usr/lib/blt4l/libblt_loader.so"
}
