# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='hlsdl'
pkgname="$_pkgname-git"
pkgver='0.27.r228.g62e0e09'
pkgrel='1'
pkgdesc='C program to download VoD HLS (.m3u8) files - git version'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/selsta/$_pkgname"
license=('MIT')
depends=('curl' 'openssl')
makedepends=('cmake>=3.21' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
b2sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf '%s.r%s.g%s' "$(sed -nE 's/^.*hlsdl v([0-9.]*).*$/\1/p' 'src/misc.c')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	cmake -S '.' -B 'build/' -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX='/usr'
	cmake --build 'build/'
}

check() {
	_checkoutput="$("$srcdir/$_sourcedirectory/build/$_pkgname")"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "^$_pkgname v"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
	install -Dm644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
