# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=tisc-git
pkgver=r176.18b01a0
pkgrel=1
epoch=
pkgdesc='Remake of Kenneth Louden’s "Tiny Machine" computer'
arch=('x86_64')
url="https://github.com/jnguyen1098/TISC"
license=('ISC')
groups=()
depends=('glibc')
makedepends=('git')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"

	sed \
		-e "s/CFLAGS = .*/CFLAGS = $CFLAGS -I"'$(INC)'"/" \
		-e "s/CC = .*/CC = gcc/" \
		-e 's/$(CC) $(CFLAGS) $^ -o $@/& $(LDFLAGS)/'\
		-i makefile

	echo "LDFLAGS = $LDFLAGS" >> makefile
}

pkgver() {
	cd "$srcdir/$pkgname"

	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"

	make
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm755 bin/TISC "$pkgdir/usr/bin/TISC"
}
