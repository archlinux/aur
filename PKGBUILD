# Maintainer: cfstras <c+arch@cfs.im>
_pkgname=sqlcheck
pkgname=$_pkgname-git
pkgver=r187.e10f5f9
pkgrel=1
epoch=
pkgdesc="Automatically identify anti-patterns in SQL queries"
arch=('i686' 'x86_64')
url="https://github.com/jarulraj/sqlcheck"
license=('Apache')
groups=()
depends=('gcc-libs')
makedepends=('git' 'gcc' 'cmake')
checkdepends=()
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/jarulraj/$_pkgname.git"
	"git+https://github.com/gflags/gflags.git"
	"git+https://github.com/google/googletest.git")
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$_pkgname"
	git submodule init
	git config submodule.external/gflags.url $srcdir/gflags
	git config submodule.external/googletest.url $srcdir/googletest
	git submodule update
	./bootstrap
}

build() {
	cd "$_pkgname"
	cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr
	make
}

check() {
	cd "$_pkgname"
	make -k test
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
