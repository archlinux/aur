# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=cfunge-git
pkgver=1,001.r1.b7bf640
pkgrel=1
pkgdesc="A fast Befunge interpreter in C"
arch=('x86_64' 'i686' 'arm7h' 'aarch64')
url="https://github.com/VorpalBlade/cfunge"
license=('GPL3')
depends=('libbsd')
makedepends=('git' 'cmake' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('cfunge::git+https://github.com/VorpalBlade/cfunge'
        'mycology::git+https://github.com/Deewiant/Mycology')
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	# There isn't a sane way to deal with submodules apparently in PKGBUILDs.
	git submodule init
	git config submodule.tests/mycology/src.url "$srcdir/mycology"
	git -c protocol.file.allow=always submodule update
}

build() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake -GNinja "$srcdir/${pkgname%-git}" -DCMAKE_INSTALL_PREFIX=/usr
	ninja
}

check() {
	cd "$srcdir/build"
	ninja -k0 test
}

package() {
	cd "$srcdir/build"
	DESTDIR="$pkgdir/" ninja install
}
