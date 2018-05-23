# Maintainer: G Queiroz <gabrieljvnq@gmail.com>
pkgname=openicp-br-git
pkgver=r121.309475e
pkgrel=1
pkgdesc="A program for digitally singing and verifying documents according to Brazilian Law."
arch=('x86_64')
url="github.comn/gjvnq/OpenICP-BR"
license=('AGPL')
groups=()
depends=('wxgtk2' 'gtk-update-icon-cache')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+https://github.com/gjvnq/OpenICP-BR.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/${pkgname}/openssl-1.1.0h"
	mkdir dist || true
	./Configure linux-x86_64 --prefix="`pwd`/dist" --openssldir="`pwd`/dist" no-dso
	make
	make install

	cd "$srcdir/${pkgname}"
	cmake . -DNO_TESTS=1
	make openicp
}

package() {
	cd "$srcdir/${pkgname%}"
	make DESTDIR="$pkgdir/" install
}
