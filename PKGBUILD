# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=acdb-git
pkgver=r37.570cd3f
pkgrel=1
pkgdesc="Clang's C/C++ compile_commands.json generator for Arduino projects"
arch=('x86_64')
url="https://github.com/Softmotions/acdb"
license=('MIT')
groups=()
depends=("arduino-cli")
makedepends=("cmake" "git")
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+$url.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	# TODO: Un-vendor iwnet
	cmake -B build -S "$srcdir/$pkgname" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		-DCMAKE_UNITY_BUILD=ON

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	cd "$srcdir/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
