# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=paleofetch-git
pkgver=r185.f5340ca
pkgrel=1
epoch=
pkgdesc="neofetch, but written in C "
arch=('x86_64')
url="https://github.com/otreblan/paleofetch"
license=('MIT')
groups=()
depends=('libx11')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	mkdir -p "$srcdir/$pkgname/build"
}

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-\?//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"

	# Batery path
	export CFLAGS+=" -D"$(./config_scripts/battery_config.sh)

	cd "$srcdir/$pkgname/build"

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_UNITY_BUILD=ON \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		..

	make
}

package() {
	cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir/" install

	cd "$srcdir/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
