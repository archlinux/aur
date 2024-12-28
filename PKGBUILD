# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Justin Frank <justinpfrank@protonmail.com> (miniterm-git PKGBUILD)
pkgname='miniterm'
pkgver='1.7.0'
pkgrel='3'
pkgdesc='Lightweight VTE terminal emulator with colorscheme support (fork of tinyterm)'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/laelath/$pkgname"
license=('MIT')
depends=('glib2' 'vte3')
makedepends=('cmake')
checkdepends=('xorg-server-xvfb')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('630f7c2144dc514edd0ab7cb474a88837e7b5f80f3bf3402f9ec2581a37928309b5a30edd654505204ea6f97ed8358018bd8815e0166397528998df2f0af54ca')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	mkdir -p "$srcdir/$_sourcedirectory/build/"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	cmake -S '.' -B 'build/' -DCMAKE_INSTALL_PREFIX='/usr'
	cmake --build 'build/'
}

check() {
	_checkoutput="$(xvfb-run "$srcdir/$_sourcedirectory/build/src/$pkgname" -v)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "^$pkgname $pkgver$"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" cmake --install 'build/'
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
