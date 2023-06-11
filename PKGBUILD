# Maintainer: Piroro-hs
# Contributor: Ben Aaron Golberg <ben@benaaron.dev>

pkgname=geticons-git
pkgver=1.2.2.r1.g322fba4
pkgrel=1
pkgdesc="CLI tool to get icons on Linux and other Freedesktop systems"
arch=('x86_64')
makedepends=('cargo' 'git' 'scdoc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
url="https://git.sr.ht/~zethra/geticons"
license=('GPL')
source=("$pkgname::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	local ver=`git describe --long 2> /dev/null`
	if [ -z $ver ]; then
		local since_122=`git rev-list --count 7ac25068.. 2> /dev/null`
		if [ -z $since_122 ]; then
			ver="0-$(git rev-list --count HEAD)-g$(git rev-parse --short HEAD)"
		else
			ver="1.2.2-$since_122-g$(git rev-parse --short HEAD)"
		fi
	fi
	echo $ver | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 geticons "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 geticons.1 "$pkgdir/usr/share/man/man1/${pkgname%-git}.1"
}
